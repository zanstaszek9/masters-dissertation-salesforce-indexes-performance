#.\scripts\sandboxUtils\soapLoginGetSessionId.ps1
$config = .$PSScriptRoot/getConfig.ps1


# Przypisanie wartości z pliku konfiguracyjnego do zmiennych
$defaultOrgLoginUrl = $config.defaultOrgLoginUrl
$username = $config.username
$password = $config.password
$securityToken = $config.securityToken

# Joining password and securityToken
$fullPassword = $password + $securityToken

try
{
    # Making SOAP login request
    $soapLoginResponseWithSessionId = curl -Uri "$defaultOrgLoginUrl/services/Soap/u/62.0" `
    -Method Post `
    -Headers @{
        'SOAPAction' = 'login'
        'Content-Type' = 'text/xml'
        'charset' = 'UTF-8'
    } `
    -Body @"
<?xml version="1.0" encoding="utf-8" ?>
<env:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:env="http://schemas.xmlsoap.org/soap/envelope/">
  <env:Body>
    <n1:login xmlns:n1="urn:partner.soap.sforce.com">
      <n1:username>$username</n1:username>
      <n1:password>$fullPassword</n1:password>
    </n1:login>
  </env:Body>
</env:Envelope>
"@



    # Parsowanie odpowiedzi XML
    $responseXml = [xml]$soapLoginResponseWithSessionId

    # Wydobywanie wartości
    $sessionId = $responseXml.Envelope.Body.loginResponse.result.sessionId
    $sessionIdRetrieval = Get-Date -Format "o"

    # Save into Config File
    ./scripts/sandboxUtils/saveIntoConfig.ps1 -Key "sessionId" -Value $sessionId
    ./scripts/sandboxUtils/saveIntoConfig.ps1 -Key "sessionIdRetrieval" -Value $sessionIdRetrieval

    return $sessionId
} catch {
    # Wyświetlenie szczegółów błędu
    Write-Host "Error for SOAP: $_"
    if ($_.Exception.Response -ne $null) {
        $responseStream = $_.Exception.Response.GetResponseStream()
        $reader = New-Object System.IO.StreamReader($responseStream)
        $responseBody = $reader.ReadToEnd()
        Write-Host "Server reponse:"
        Write-Host $responseBody
    } else {
        Write-Host "Not answer from the server provided."
    }
}
