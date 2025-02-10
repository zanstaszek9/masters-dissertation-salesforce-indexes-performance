# .\scripts\sandboxUtils\getBulkDmlResults.ps1 -j 750d10000018z92AAA
# .\scripts\sandboxUtils\getBulkDmlResults.ps1 -j 750WV000003YsnS -d

param (
    [Alias("j")][string]$jobId,
    [Alias("d")][switch]$failedRecordsFlag
)

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

Write-Warning "getBulkDmlResults. JobId: $jobId."
Write-Warning "getBulkDmlResults. domainUrl: $domainUrl."
Write-Warning "getBulkDmlResults. sessionID: $sessionID."
Write-Warning "address: $domainUrl/services/data/v62.0/jobs/ingest/$jobId"

$endpoint = "$domainUrl/services/data/v62.0/jobs/ingest/$jobId"
if ($failedRecordsFlag) {
    $endpoint += "/failedResults"
    Write-Warning "----- getBulkDmlResults: Debug for failed records enabled"
}

$response = curl "$endpoint" `
    -Method Get `
    -Headers @{
    'Authorization' = "OAuth $sessionID"
    'Content-Type' = 'application/json'
    'charset' = 'UTF-8'
}

$responseParsed = $response | ConvertFrom-Json

return $responseParsed