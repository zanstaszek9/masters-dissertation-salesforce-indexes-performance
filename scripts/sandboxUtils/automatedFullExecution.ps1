# .\scripts\sandboxUtils\automatedFullExecution.ps1
param (
    [Alias("o")][string]$sandboxName,
    [Alias("s")][string]$sObjectName,
    [Alias("c")][string]$fieldApiName
)


##   Write-Warning "AUTOMATE FULL EXECUTION $fieldApiName"




$basePath = ($PSScriptRoot -split '\\scripts\\')[0] + '/'

$fieldFiles = (./scripts/fieldsMappingsForScript/fieldNameToFieldPath.ps1).$fieldApiName

$fileMetadataPath = ($basePath + ($fieldFiles.fileMetadataPath) ) -replace '/','\'
$recordDataFilePath = $fieldFiles.recordDataFilePath | ForEach-Object {
    ($basePath + $_) -replace '/', '\'
}
$queries = & (($basePath + ($fieldFiles.queriesPath) ) -replace '/','\') -s $sObjectName -c $fieldApiName

#Write-Warning "recordDataFilePath: $recordDataFilePath"
#
#foreach ($filePath in $recordDataFilePath) {
#    Write-Warning "filePath: $filePath"
#
#}
#throw "After record data file path!"


$permissionSetFilePath = ($basePath + ("\salesforce-metadata\main\default\permissionsets\IndexingTest.permissionset-meta.xml") ) -replace '/','\'





##   Write-Warning "Before deploy to org | $fieldApiName"



### Deploy Field
sf project deploy start -o $sandboxName -r -g -d $fileMetadataPath


### Replace Field in Permission Set
./scripts/sandboxUtils/replaceFieldInPermissionSet.ps1  -s $sObjectName -c $fieldApiName -f $permissionSetFilePath > $null



##   Write-Warning "Before deploy Permission Set to org | $fieldApiName"
### Deploy changed Permission Set
(sf project deploy start -o $sandboxName -r -g -d $permissionSetFilePath) > $null

#   Write-Warning "After deploy Permission Set to org | $fieldApiName"



#exit;



foreach ($filePath in $recordDataFilePath) {

    if ($fieldApiName -notin @("Autonumber_externalId__c", "Autonumber_no_index__c", "Id")) {
        ### Replace header in data file
        Write-Warning "In if: $filePath $sObjectName"
        cd .\scripts\sandboxUtils\ ; py "changeFieldInHeaderInDataFile.py" "$filePath" "$sObjectName" "$fieldApiName"; cd ..\..
    } else {
        ### Replace header in data file
        Write-Warning "In else: $filePath $sObjectName $fieldApiName"
        cd .\scripts\sandboxUtils\ ; py "changeFieldInHeaderInDataFile.py" "$filePath" "$sObjectName" ""; cd ..\..
    }

    #   Write-Warning "Before inserting data from org | $fieldApiName"
    #### Insert records to Org
    $insertJobInit = ./scripts/dataInsertion/insertData.ps1 -f $filePath -s $sObjectName -o $sandboxName

    #   Write-Warning "After insert insertJobInit: $insertJobInit | $fieldApiName"


    ##   Write-Warning "Before sleep | $fieldApiName"
    Start-Sleep -Seconds (60*20)
    #    Start-Sleep -Seconds (60*5)
    #   Write-Warning "Before bulk dml loop handler, insertJobInit: $insertJobInit | $fieldApiName"
    $insertJobResult = ./scripts/sandboxUtils/getBulkDmlResultsLoopHandler.ps1 -j $insertJobInit.result.jobInfo.id

    #    throw "Stop after insert!"
    #### Save Bulk Insert results
    ./scripts/sandboxUtils/saveBulkResultsToCsv.ps1 -v $insertJobResult -f ./scripts/sandboxUtils/queriesPlanAndTimes/bulkDmlsResults.csv -c $fieldApiName > $null

}




##   Write-Warning "After bulk dml loop handler, insertJobResult: $insertJobResult | $fieldApiName"
##   Write-Warning "After bulk dml loop handler, insertJobDataToCsv: $insertJobDataToCsv | $fieldApiName"



##   Write-Warning "Before querying data from org | $fieldApiName"
##   Write-Warning "Before querying data from org queries: $queries | $fieldApiName"
### Get query plan, time SOQL and Bulk Query

#./scripts/sandboxUtils/getQueryPlanAndMakeBulkApiQueryCall.ps1  -o $sandboxName -q $queries ; ./scripts/sandboxUtils/getQueryPlanAndMakeBulkApiQueryCall.ps1  -o $sandboxName  -q $queries; ./scripts/sandboxUtils/getQueryPlanAndMakeBulkApiQueryCall.ps1  -o $sandboxName -q $queries > $null # multiple times
./scripts/sandboxUtils/getQueryPlanAndMakeBulkApiQueryCall.ps1  -o $sandboxName -q $queries ;


#throw "After queries!"


Write-Warning "Before deleting data from org | $fieldApiName"
#### Delete records from Org
$deleteJobInit = ./scripts/dataInsertion/queryAndDeleteData.ps1 -s $sObjectName  -o $sandboxName


Start-Sleep -Seconds (60*16)
#Start-Sleep -Seconds (60*3)
$deleteJobResult = ./scripts/sandboxUtils/getBulkDmlResultsLoopHandler.ps1 -j $deleteJobInit.result.jobInfo.id
#### Save Bulk Delete results
./scripts/sandboxUtils/saveBulkResultsToCsv.ps1 -v $deleteJobResult -f ./scripts/sandboxUtils/queriesPlanAndTimes/bulkDmlsResults.csv -c $fieldApiName > $null


#throw "Stop after dleeting records!"

##   Write-Warning "Before deleting field from org | $fieldApiName"
#### Delete Field from Org
$fileContent = Get-Content -Path $fileMetadataPath -Raw     #We must copy file, as "project delete source" deletes that file localy. Later it will be brought back
$tempFilePath = $filePath+".bak"
Set-Content -Path $tempFilePath -Value $fileContent

sf project delete source -o $sandboxName -r -p $fileMetadataPath

Set-Content -Path $fileMetadataPath -Value $fileContent
Remove-Item -Path $tempFilePath

#throw "At the very end!"

##   Write-Warning "After deleting from org | $fieldApiName"

##   Write-Warning "FINISH ___________"
