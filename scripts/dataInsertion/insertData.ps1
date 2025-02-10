#./scripts/dataInsertion/insertData.ps1 -f dataToInsert\merged\Account_data_numbers.csv -s Account  -o dissertation-v2
#./scripts/dataInsertion/insertData.ps1 -f dataToInsert\merged\Account_data_numbers_10.csv -s Account  -o dissertation-v2 ####

param(
    [Alias("f")][string]$inputFile,
    [Alias("s")][string]$sObjectName,
    [Alias("o")][string]$sandboxName,
    [Alias("i")][string]$upsertFieldApiName = "Id"


)
Write-Warning "insertData - inputFile: $inputFile"
Write-Warning "insertData - sObjectName: $sObjectName"
Write-Warning "insertData - sandboxName: $sandboxName"

$insertResult = sf data upsert bulk -f $inputFile -i $upsertFieldApiName -s $sObjectName -o $sandboxName --json

$responseParsed = $insertResult | ConvertFrom-Json

return $responseParsed
