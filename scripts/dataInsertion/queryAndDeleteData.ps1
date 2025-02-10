#./scripts/dataInsertion/queryAndDeleteData.ps1 -s Account  -o dissertation-v2

#sf data query -q "SELECT Id FROM Account LIMIT 50" -b --wait 1 -o dissertation-v2 -r "csv" > temp.cav



param(
    [Alias("s")][string]$sObjectName,
    [Alias("o")][string]$sandboxName
)

# Create a temporary file
#$tempFile = New-Item -ItemType File -Force -Path $PSScriptRoot/tempFiles/queryTemp.csv
$tempFile = New-Item -ItemType File -Force -Path "E:/temp/queryTemp.csv"
$headFile = New-Item -ItemType File -Force -Path $PSScriptRoot/tempFiles/headTemp.csv
$tailFile = New-Item -ItemType File -Force -Path $PSScriptRoot/tempFiles/tailTemp.csv

Write-Host "1 - $sObjectName " (Get-Date).ToString("yyyy-MM-ddTHH:mm:ss.fff")
# Execute the query and save the result to the temporary file
sf data query -q "SELECT Id FROM $sObjectName LIMIT 5000000" -b --wait 5 -o $sandboxName -r "csv" | Set-Content -Path $tempFile
#sf data query -q "SELECT Id FROM $sObjectName LIMIT 5000000" -b --wait 1 -o $sandboxName -r "csv" > $tempFile
Get-Content $tempFile -Head 20 > $headFile
Get-Content $tempFile -Tail 20 > $tailFile

Write-Host "11 head - " | Get-Content $headFile
Write-Host "12 tail - " | Get-Content $tailFile

Write-Host "2 - " (Get-Date).ToString("yyyy-MM-ddTHH:mm:ss.fff")
Write-Host "Query done. Starting deletion..."

#throw "Exit!"
# Execute the delete command using the temporary file as a parameter
$deletingJob = sf data delete bulk -s $sObjectName -f $tempFile -o $sandboxName --json
Write-Host "3 - " (Get-Date).ToString("yyyy-MM-ddTHH:mm:ss.fff")
# Remove the temporary file
Remove-Item $tempFile

$responseParsed = $deletingJob | ConvertFrom-Json

return $responseParsed

# return $deleteResult

#$in = "Number_externalId__c = 0"
#$val = "Number_externalId__c = null"

#sf data update record --sobject Account --where $in --values $val -o dissertation-v2

