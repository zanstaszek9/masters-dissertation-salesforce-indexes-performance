#./scripts/sandboxUtils/queryBatchToGetTime.ps1 'SELECT Id, Name FROM Account LIMIT 1'
#./scripts/sandboxUtils/queryBatchToGetTime.ps1 "SELECT Id FROM Account WHERE Text_all_case_sensitive__c LIKE '%computer science%'"
param (
    [Alias("q")][string]$querySOQL,
    [string]$sessionID,
    [string]$domainUrl
)
# Check if sessionID or domainUrl are empty
if ([string]::IsNullOrWhiteSpace($sessionID) -or [string]::IsNullOrWhiteSpace($domainUrl)) {
    $config = .$PSScriptRoot/getConfig.ps1
    $sessionID = $config.sessionId
    $sessionIdRetrieval = [datetime]::Parse($config.sessionIdRetrieval)
    $domainUrl = $config.domainUrl

    # Refresh sessionID if needed
    if ([string]::IsNullOrWhiteSpace($sessionID) -or ($sessionIdRetrieval -lt (Get-Date).AddHours(-1))) {
        $sessionID = .$PSScriptRoot/soapLoginGetSessionId.ps1
    }
}

Write-Warning "-------------"
Write-Warning "-------------"
Write-Warning "queryBatchToGetTime querySOQL: $querySOQL"

# Initialize the query using Bulk API
$executionStartDateTime = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ss.fff") #Example: 2024-08-27T20:44:58.138
$initQuery = sf data query -q "$querySOQL" -o dissertation-v2 --async -b
Write-Warning "------ queryBatchToGetTime initQuery: $initQuery"
$jobId = [regex]::Match($initQuery, 'Query ID:\s*(\S+)').Groups[1].Value
Write-Warning "------ queryBatchToGetTime jobId: $jobId"

$state = "InProgress"

# Poll the job status until it completes
while ($state -ne "JobComplete") {
    $response = curl "$domainUrl/services/async/62.0/job/$jobId" `
        -Method Get `
        -Headers @{
        'X-SFDC-Session' = "$sessionID"
        'Content-Type' = 'application/json'
        'charset' = 'UTF-8'
    }

    $data = $response.Content | ConvertFrom-Json
    $state = $data.state

    if ($state -ne "JobComplete") {
        Start-Sleep -Seconds 5
    }
}

# Collect and display the result
$table = @()
$table += [PSCustomObject]@{
    SObjectType                  = $data.object
    'Records Processed'          = $data.numberRecordsProcessed
    'Total Processing Time [ms]' = $data.totalProcessingTime
    'SOQL Query'                 = $querySOQL
    ExecutionStartDateTime       = $executionStartDateTime

}

# Display the table with tab-separated columns
return $table



# Sample response: {apexProcessingTime=0; apiActiveProcessingTime=520; apiVersion=61.0; assignmentRuleId=; concurrencyMode=Parallel; contentType=CSV; createdById=00568000004uN5wAAE; createdDate=2024-08-18T05:04:19.000+0000; externalIdFieldName=; fastPathEnabled=False; id=7506800000BQUfKAAX; numberBatchesCompleted=2; numberBatchesFailed=0; numberBatchesInProgress=0; numberBatchesQueued=0; numberBatchesTotal=2; numberRecordsFailed=0; numberRecordsProcessed=10; numberRetries=0; object=Account; operation=query; state=JobComplete; systemModstamp=2024-08-18T05:04:20.000+0000; totalProcessingTime=520}