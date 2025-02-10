# .\scripts\sandboxUtils\getQueryPlanAndMakeBulkApiQueryCall.ps1  -o dissertation-v2
param (
    [Alias("o")][string]$sandboxName,
    [Alias("q")][string]$inputQueries
)

$host.privatedata.ProgressForegroundColor = "darkgreen"
$host.privatedata.ProgressBackgroundColor = "black"

Write-Warning "getQueryPlanAndMakeBulkApiQueryCall inputeQueries: $inputQueries"

<#$inputQueries = @'
SELECT Id FROM Account
SELECT Id FROM Account WHERE Number_short_externalId__c = 414120592.0
SELECT Id FROM Account WHERE Number_short_externalId__c = 485020343.0
SELECT Id FROM Account WHERE Number_short_externalId__c IN (851896872.0, 201907104.0, 884589645.0, 679783123.0, 549620024.0, 900559086.0)
SELECT Id FROM Account WHERE Number_short_externalId__c = null
SELECT Id FROM Account WHERE Number_short_externalId__c != null
SELECT Id FROM Account WHERE Number_short_externalId__c < 700000000.0
SELECT Id FROM Account WHERE Number_short_externalId__c > 500000000.0
SELECT Id FROM Account WHERE Number_short_externalId__c < 500000000.0
SELECT Id FROM Account WHERE Number_short_externalId__c > 500000000.0 AND Number_short_externalId__c < 700000000.0
'@#>

# Split the queries into an array
$queries = $inputQueries -split "`r?`n"
Write-Warning "getQueryPlanAndMakeBulkApiQueryCall inputeQueries: $inputQueries"
# Load configuration and session details
$config = .$PSScriptRoot/getConfig.ps1
$sessionID = $config.sessionId
$sessionIdRetrieval = [datetime]::Parse($config.sessionIdRetrieval)
$domainUrl = $config.domainUrl

# If sessionId is blank or sessionIdRetrieval is older than one hour
if ([string]::IsNullOrWhiteSpace($sessionID) -or ($sessionIdRetrieval -lt (Get-Date).AddHours(-1)))
{
    $sessionID = .$PSScriptRoot/soapLoginGetSessionId.ps1
}

# Initialize arrays to store the results
$queryPlans = @()
$queryBulkApiTimes = @()
$queryApex = @()

$totalQueries = $queries.Count
$currentQueryIndex = 0



# Loop through each query and process it
foreach ($query in $queries)
{
    $currentQueryIndex++
    $percentComplete = ($currentQueryIndex / $totalQueries) * 100

    # Update progress bar for the current query processing
    Write-Progress -Activity "Progress" -Status "Processing query $currentQueryIndex of $totalQueries ($percentComplete%) | [$query]"


    # Execute the queries and collect the results
    $queryApex += .$PSScriptRoot/executeAnonymousMethodWithQuery.ps1 -q $query -o $sandboxName
    $queryPlans += .$PSScriptRoot/getQueryPlan.ps1 -q $query $sessionID $domainUrl
    $queryBulkApiTimes += .$PSScriptRoot/queryBatchToGetTime.ps1 -q $query $sessionID $domainUrl
}

# Export the combined results to a CSV file
$csvFilePathPlans = "$PSScriptRoot/queriesPlanAndTimes/outputPlans.csv"
$csvFilePathTimes = "$PSScriptRoot/queriesPlanAndTimes/outputBulkApiTimes.csv"
$csvFileApexTimes = "$PSScriptRoot/queriesPlanAndTimes/outputApex.csv"

$currentFileIndex = 0
$totalFiles = 3  # We have three files to export

# Export query plans
foreach ($querySubplan in $queryPlans)
{
    if ($querySubplan."SOQL Query" -eq $null)
    {
        continue
    }
    # Prepare the export object
    $exportObj = [PSCustomObject]@{
        'Subplan Id' = $querySubplan."Subplan Id"
        'Cardinality' = $querySubplan.Cardinality
        'LeadingOperationType' = $querySubplan.LeadingOperationType
        'RelativeCost' = $querySubplan.RelativeCost
        'SObjectCardinality' = $querySubplan.SObjectCardinality
        'SObjectType' = $querySubplan.SObjectType
        'NoteDescription' = $querySubplan.NoteDescription
        'NoteFields' = $querySubplan.NoteFields
        'TableEnumOrId' = $querySubplan.TableEnumOrId
        'SOQL Query' = $querySubplan."SOQL Query"
        'ExecutionStartDateTime' = $querySubplan.ExecutionStartDateTime
    }
    $exportObj | Export-Csv -Path $csvFilePathPlans -NoTypeInformation -Delimiter "," -Append
}

# Update progress bar after exporting query plans
$currentFileIndex++
Write-Progress -Activity "Saving Results" -Status "Saving file $currentFileIndex of $totalFiles" -PercentComplete (($currentFileIndex / $totalFiles) * 100)

# Export bulk API times
$queryBulkApiTimes | Export-Csv -Path $csvFilePathTimes -NoTypeInformation -Delimiter "," -Append

# Update progress bar after exporting bulk API times
$currentFileIndex++
Write-Progress -Activity "Saving Results" -Status "Saving file $currentFileIndex of $totalFiles" -PercentComplete (($currentFileIndex / $totalFiles) * 100)

# Export Apex execution times
$queryApex | Export-Csv -Path $csvFileApexTimes -NoTypeInformation -Delimiter "," -Append


# Final update of the progress bar
$currentFileIndex++
Write-Progress -Activity "Saving Results" -Status "Saving file $currentFileIndex of $totalFiles" -PercentComplete (($currentFileIndex / $totalFiles) * 100)

# Complete the progress bar
Write-Progress -Activity "Processing Complete" -Status "Done" -Completed


#
<#
$inputQueries = @'
SELECT Id FROM Account
SELECT Id FROM Account WHERE Number_externalId_nulls__c = 107543767824119486.0
SELECT Id FROM Account WHERE Number_externalId_nulls__c IN (671990991681965580.0, 633410834057205158.0, 124164625585794140.0, 339539723753925206.0, 257666175608376142.0, 475037130997212014.0)
SELECT Id FROM Account WHERE Number_externalId_nulls__c = null
SELECT Id FROM Account WHERE Number_externalId_nulls__c != null
SELECT Id FROM Account WHERE Number_externalId_nulls__c < 700000000000000000.0
SELECT Id FROM Account WHERE Number_externalId_nulls__c > 500000000000000000.0
SELECT Id FROM Account WHERE Number_externalId_nulls__c < 500000000000000000.0
SELECT Id FROM Account WHERE Number_externalId_nulls__c > 500000000000000000.0 AND Number_externalId_nulls__c < 700000000000000000.0
'@#>

