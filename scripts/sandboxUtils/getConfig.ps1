#  ./scripts/sandboxUtils/getConfig
# Path to config file in JSON format
#$configFilePath = "./scripts/sandboxUtils/config.json"
$configFilePath = $PSScriptRoot+"\config.json"


if (Test-Path $configFilePath) {
    $config = Get-Content -Path $configFilePath | ConvertFrom-Json
    $config | Add-Member -NotePropertyName Path  -NotePropertyValue  $configFilePath -Force
} else {
    throw "Config file does not exists at the location: $configFilePath"
}

return $config


#   Sample Config file:
# {
#     "defaultOrgLoginUrl":  "https://login.salesforce.com",
#     "username":  "saleforceLogin@mindful-bear-ur0tdg.com",
#     "password":  "password123",
#     "securityToken":  "L8XN9zzgDuasb8nPqsXgjl3WE",
#     "domainUrl":  "https://mindful-bear-ur0tdg-dev-ed.trailblaze.my.salesforce.com",
#     "sessionId":  "00E7R000005R38T!ARsAQIMxZ6lYV6k3ZRl.QOok_l6HMbXoMAxhesqwRa3eYNfevgrA3o2OkvcMaTSdUEG9s3twJVDLBlLZ4mPB_yi3IFGfVIhM",
#     "sessionIdRetrieval":  "2024-07-04T18:00:00.0174851+02:00"
# }
