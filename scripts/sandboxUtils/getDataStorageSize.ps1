#./scripts/sandboxUtils/getDataStorageSize.ps1
param (
    [string]$sessionID,
    [string]$domainUrl
)


# Check if sessionID or domainUrl are empty
if ([string]::IsNullOrWhiteSpace($sessionID) -or [string]::IsNullOrWhiteSpace($domainUrl)) {
    $config = ./scripts/sandboxUtils/getConfig.ps1
    $sessionID = $config.sessionId
    $sessionIdRetrieval = [datetime]::Parse($config.sessionIdRetrieval)
    $domainUrl = $config.domainUrl

    # Refresh sessionID if needed
    if ([string]::IsNullOrWhiteSpace($sessionID) -or ($sessionIdRetrieval -lt (Get-Date).AddHours(-1))) {
        $sessionID = ./scripts/sandboxUtils/soapLoginGetSessionId.ps1
    }
}


# Send the request to Salesforce
$response = curl "$domainUrl/services/data/v62.0/limits/" `
    -Method Get `
    -Headers @{
    'Authorization' = "OAuth $sessionID"
    'Content-Type' = 'application/json'
    'charset' = 'UTF-8'
}

$responseJson = ($response.Content | ConvertFrom-Json)
$storageJson = $responseJson.DataStorageMB
$usedSizeInMegabytes = ($storageJson.Max - $storageJson.Remaining)

return $usedSizeInMegabytes