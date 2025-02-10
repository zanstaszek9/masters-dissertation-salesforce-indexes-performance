#   ./scripts/sandboxUtils/executeAnonymousMethodWithQuery.ps1 -q 'SELECT Id FROM Account' -o dissertation-v2

param (
    [Alias("q")][string]$querySOQL,
    [Alias("o")][string]$sandboxName
)


$config = .$PSScriptRoot/getConfig.ps1
$username = $config.username


#New StarDate and ExpirationDate
$NOW = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ss")
$EXP = ($NOW | Get-Date).AddHours(3) | Get-Date -Format "yyyy-MM-ddTHH:mm:ss"


# Getting Trace Flags for the User
#$EXISTING_TRACE_QUERY = (sf data query --query "SELECT Id, DebugLevel.DeveloperName, ExpirationDate, TracedEntityId FROM Traceflag WHERE TracedEntityId IN (SELECT ID from USER WHERE Username = '$username')" --use-tooling-api --json -o dissertation-v2 | ConvertFrom-Json)
$EXISTING_TRACE_QUERY = (sf data query --query "SELECT Id, DebugLevel.DeveloperName, ExpirationDate, TracedEntityId FROM Traceflag WHERE TracedEntityId IN (SELECT ID from USER WHERE Username = '$username')" --use-tooling-api --json -o $sandboxName | ConvertFrom-Json)

# Setting up the trace flags
foreach ($debuglogRecord in $EXISTING_TRACE_QUERY.result.records)
{
    $TRACEID = $debuglogRecord.Id
    #Update trace flag and extend by 3 hours
    sf data update record --sobject TraceFlag --record-id $TRACEID -v "StartDate=$NOW ExpirationDate=$EXP" --use-tooling-api --json -o dissertation-v2 > $null



}

$executionStartDateTime = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ss.fff") #Example: 2024-08-27T20:44:58.138
$debugLogs = ( "List<SObject> s = [$querySOQL LIMIT 50000];" | sf apex run -o $sandboxName)


# Extract lines that start with "CUMULATIVE_PROFILING|SOQL"
# Initialize an empty array to store results
$soqlResults = @()
$executionTime = 0;
$queriedRows = 0;
# Iterate over the lines using a for loop to access both the current and next line
for ($i = 0; $i -lt $debugLogs.Length; $i++) {
    if ($debugLogs[$i] -match "Number of query rows: (\d+)")
    {
        $queriedRows = $matches[1]
    }
    elseif ($debugLogs[$i] -match "CUMULATIVE_PROFILING\|SOQL")
    {
        # Check if the next line exists and contains the SOQL query information
        if ($i + 1 -lt $debugLogs.Length -and $debugLogs[$i + 1] -match "AnonymousBlock:.*?\[(.*?)\]: executed 1 time in (\d+) ms")
        {
            $queryFromLogs = $matches[1]          # Extracted SOQL query
            $executionTime = $matches[2]  # Extracted execution time in milliseconds
        }
    }
    elseif ($executionTime -gt 0 -and $executionTime -gt 0)
    {
        break
    }
}

$soqlResults += [PSCustomObject]@{
    Rows = $queriedRows
    ExecutionTimeMs = $executionTime
    'SOQL Query' = $queryFromLogs
    ExecutionStartDateTime = $executionStartDateTime
}



return $soqlResults



############################
## Sample response:
<#
Debug Logs:  Start typing Apex code. Press the Enter key after each line, then press CTRL+D when finished. Compiled successfully. Executed successfully.  61.0 APEX_CODE,FINEST;APEX_PROFILING,FINE;CALLOUT,NONE;DB,NONE;NBA,NONE;SYSTEM,NONE;VALIDATION,NONE;VISUALFORCE,FINER;WAVE,NONE;WORKFLOW,NONE Execute Anonymous: List<SObject> s = [SELECT Id FROM Account
WHERE Number_short_no_index__c < 700000000000000000.0 LIMIT 50000]; 05:07:00.47 (47397193)|USER_INFO|[EXTERNAL]|00568000004uN5w|zanstaszek9+feedbackmanagement+v1-vthb@force.com|(GMT+02:00) Central European Summer Time (Europe/Warsaw)|GMT+02:00 05:07:00.47 (47451630)|EXECUTION_STARTED 05:07:00.47 (47502583)|CODE_UNIT_STARTED|[EXTERNAL]|execute_anonymous_apex 0
5:07:00.47 (47886434)|VARIABLE_SCOPE_BEGIN|[1]|s|List<SObject>|true|false 05:07:00.47 (48246185)|HEAP_ALLOCATE|[93]|Bytes:3 05:07:00.47 (48330297)|HEAP_ALLOCATE|[98]|Bytes:152 05:07:00.47 (48351952)|HEAP_ALLOCATE|[415]|Bytes:408 05:07:00.47 (48374088)|HEAP_ALLOCATE|[428]|Bytes:408 05:07:00.47 (48394097)|HEAP_ALLOCATE|[536]|Bytes:48 05:07:00.47 (48469537)|
HEAP_ALLOCATE|[247]|Bytes:6 05:07:00.47 (48503453)|HEAP_ALLOCATE|[EXTERNAL]|Bytes:1 05:07:00.47 (48842475)|STATEMENT_EXECUTE|[1] 05:07:00.47 (48899374)|STATEMENT_EXECUTE|[1] 05:07:00.47 (48906019)|HEAP_ALLOCATE|[1]|Bytes:84 05:07:00.47 (48931423)|HEAP_ALLOCATE|[1]|Bytes:4 05:07:00.47 (48986971)|HEAP_ALLOCATE|[68]|Bytes:5 05:07:00.47 (49173398)|HEAP_ALLOCA
TE|[74]|Bytes:5 05:07:00.47 (49262105)|HEAP_ALLOCATE|[82]|Bytes:7 05:07:00.47 (621085089)|HEAP_ALLOCATE|[1]|Bytes:200004 05:07:00.47 (670587144)|HEAP_ALLOCATE|[1]|Bytes:1450000 05:07:00.47 (670810598)|HEAP_ALLOCATE|[1]|Bytes:200004 05:07:00.47 (671333697)|VARIABLE_ASSIGNMENT|[1]|s|"List of size 50000 too large to display"|0x6c2f6c79 05:07:00.671 (67151044
4)|CUMULATIVE_LIMIT_USAGE 05:07:00.671 (671510444)|LIMIT_USAGE_FOR_NS|(default)|   Number of SOQL queries: 1 out of 100   Number of query rows: 50000 out of 50000 ******* CLOSE TO LIMIT   Number of SOSL queries: 0 out of 20   Number of DML statements: 0 out of 150   Number of Publish Immediate DML: 0 out of 150   Number of DML rows: 0 out of 10000   Maxim
um CPU time: 0 out of 10000   Maximum heap size: 0 out of 6000000   Number of callouts: 0 out of 100   Number of Email Invocations: 0 out of 10   Number of future calls: 0 out of 50   Number of queueable jobs added to the queue: 0 out of 50   Number of Mobile Apex push calls: 0 out of 10  05:07:00.671 (671510444)|TOTAL_EMAIL_RECIPIENTS_QUEUED|0 05:07:00.6
71 (671510444)|STATIC_VARIABLE_LIST|   int:BYTES:0   int:BYTES:0   byte[]:DigitOnes:0   byte[]:DigitTens:0   Boolean:FALSE:0   int:MAX_EXPONENT:0   double:MAX_VALUE:0   int:MAX_VALUE:0   int:MIN_EXPONENT:0   double:MIN_NORMAL:0   double:MIN_VALUE:0   int:MIN_VALUE:0   double:NEGATIVE_INFINITY:0   double:NaN:0   double:POSITIVE_INFINITY:0   int:SIZE:0   in
t:SIZE:0   Boolean:TRUE:0   String:_sfdcSuppressedCodeLocations:0   List<SObject>:_static_s:0   char[]:digits:0   long:serialVersionUID:0   long:serialVersionUID:0   long:serialVersionUID:0   int[]:sizeTable:0  05:07:00.671 (671510444)|CUMULATIVE_LIMIT_USAGE_END  05:07:00.47 (674318190)|CODE_UNIT_FINISHED|execute_anonymous_apex 05:07:00.47 (674354769)|EXE
CUTION_FINISHED 05:07:00.675 (675914990)|CUMULATIVE_PROFILING_BEGIN 05:07:00.675 (675914990)|CUMULATIVE_PROFILING|SOQL operations| AnonymousBlock: line 1, column 1: [SELECT Id FROM Account WHERE Number_short_no_index__c < 700000000000000000.0 LIMIT 50000]: executed 1 time in 621 ms  05:07:00.675 (675914990)|CUMULATIVE_PROFILING|No profiling information for SO
SL operations 05:07:00.675 (675914990)|CUMULATIVE_PROFILING|No profiling information for DML operations 05:07:00.675 (675914990)|CUMULATIVE_PROFILING|method invocations| External entry point: public static void execute(): executed 1 time in 623 ms  05:07:00.675 (675914990)|CUMULATIVE_PROFILING_END
#>
