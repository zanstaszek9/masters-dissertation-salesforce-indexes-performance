# ./scripts/sandboxUtils/saveBulkResultsToCsv.ps1 -v $deleteJobResult -f ./scripts/sandboxUtils/queriesPlanAndTimes/bulkDmlsResults.csv -c Email_no_index__c
param (
    [Alias("v")]$inputDataFromBulkDmlResponse,
    [Alias("f")][string]$csvFilePathToSave,
    [Alias("c")][string]$fieldApiName
)

$storageUsedInMegabytes = ./scripts/sandboxUtils/getDataStorageSize.ps1


$filteredResponse = [PSCustomObject]@{
    "Object"                    = $inputDataFromBulkDmlResponse.object
    "Operation"                 = $inputDataFromBulkDmlResponse.operation
    "TotalProcessingTime"       = $inputDataFromBulkDmlResponse.totalProcessingTime
    "ApiActiveProcessingTime"   = $inputDataFromBulkDmlResponse.apiActiveProcessingTime
    "ApexProcessingTime"        = $inputDataFromBulkDmlResponse.apexProcessingTime
    "CreatedDate"               = $inputDataFromBulkDmlResponse.createdDate
    "State"                     = $inputDataFromBulkDmlResponse.state
    "NumberRecordsProcessed"    = $inputDataFromBulkDmlResponse.numberRecordsProcessed
    "FieldApiName"              = $fieldApiName
    "StorageUsedInMegabytes"    =$storageUsedInMegabytes
}

# Sprawdź, czy plik istnieje i zapisz nagłówek tylko raz
if (-not (Test-Path -Path $csvFilePathToSave)) {
    $filteredResponse | Export-Csv -Path $csvFilePathToSave -NoTypeInformation -Delimiter "," -Force
} else {
    $filteredResponse | Export-Csv -Path $csvFilePathToSave -NoTypeInformation -Delimiter "," -Append -Force
}
