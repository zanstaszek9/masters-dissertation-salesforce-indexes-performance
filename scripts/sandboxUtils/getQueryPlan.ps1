#./scripts/sandboxUtils/getQueryPlan.ps1 'SELECT Id, Name FROM Account LIMIT 1'
#./scripts/sandboxUtils/getQueryPlan.ps1 'SELECT Id FROM Account WHERE Number_externalId_nulls__c > 500000000000000000.0 AND Number_externalId_nulls__c < 700000000000000000.0'
param (
    [Alias("q")][string]$querySOQL,
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
# Encode the query
$encodedQuery = $querySOQL.Replace(' ', '+')

$executionStartDateTime = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ss.fff") #Example: 2024-08-27T20:44:58.138


# Send the request to Salesforce
$response = curl "$domainUrl/services/data/v62.0/tooling/query/?explain=$encodedQuery" `
    -Method Get `
    -Headers @{
    'Authorization' = "OAuth $sessionID"
    'Content-Type' = 'application/json'
    'charset' = 'UTF-8'
}

# Format and display the JSON response
return ./scripts/sandboxUtils/formatQueryPlanJSON.ps1 $response.Content $querySOQL $executionStartDateTime







