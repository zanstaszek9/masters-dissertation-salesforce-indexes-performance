# ./scripts/sandboxUtils/queriesPlanAndTimes/queries/autonumber.ps1
param (
[Alias("s")][string]$sObjectName = 'MISSING-sObjectName',
[Alias("c")][string]$fieldApiName = 'MISSING-fieldApiName'
)


$inputQueries = @"
SELECT Id FROM $sObjectName
SELECT Id FROM $sObjectName WHERE $fieldApiName = '0014256'
SELECT Id FROM $sObjectName WHERE $fieldApiName = '0485020'
SELECT Id FROM $sObjectName WHERE $fieldApiName = '1013657'
SELECT Id FROM $sObjectName WHERE $fieldApiName = '22013657'
SELECT Id FROM $sObjectName WHERE $fieldApiName IN ('0091528', '0183788', '0998431', '0034116', '0585192', '0000742')
SELECT Id FROM $sObjectName WHERE $fieldApiName = null
SELECT Id FROM $sObjectName WHERE $fieldApiName != null
SELECT Id FROM $sObjectName WHERE $fieldApiName < '0700000'
SELECT Id FROM $sObjectName WHERE $fieldApiName > '0500000'
SELECT Id FROM $sObjectName WHERE $fieldApiName < '0500000'
SELECT Id FROM $sObjectName WHERE $fieldApiName > '0500000' AND $fieldApiName < '0700000'
"@


return $inputQueries


