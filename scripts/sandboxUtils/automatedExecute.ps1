# ./scripts/sandboxUtils/automatedExecute.ps1
#

$basePath = ($PSScriptRoot -split '\\scripts\\')[0]
$mappingPath = "$basePath\scripts\fieldsMappingsForScript\fieldNameToFieldPath.ps1"
$fieldNames = (& $mappingPath).Keys | Sort-Object
$processedFieldsFile = "$basePath\scripts\fieldsMappingsForScript\processedFiles.txt"
#$sobject = "Account"
$sobject = "Test_Custom_Object__c"

# Odczytaj ilość elementów w fieldNames
$totalFields = $fieldNames.Count
$currentIteration = 1


foreach ($fieldName in $fieldNames) {

    Write-Host ""
    Write-Host ""
    Write-Host ""
    Write-Host ""
    Write-Host ""
    Write-Host "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
    Write-Warning "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
    Write-Host "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
    Write-Warning "Executing for: $fieldName | $((Get-Date).ToString("yyyy-MM-dd HH:mm:ss.fff"))"
    Write-Warning "Iteration: $currentIteration/$totalFields - Executing for: $sobject.$fieldName"
    Write-Host "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
    Write-Warning "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
    Write-Host "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
    Write-Host ""
    Write-Host ""
    Write-Host ""
    Write-Host ""
    Write-Host ""


    ./scripts/sandboxUtils/automatedFullExecution.ps1 -c $fieldName -s $sobject -o dissertation-v2

    Add-Content -Path $processedFieldsFile -Value ("$sobject,$fieldName,"+(Get-Date).ToString("yyyy-MM-dd HH:mm:ss.fff"))

    $currentIteration++
}


