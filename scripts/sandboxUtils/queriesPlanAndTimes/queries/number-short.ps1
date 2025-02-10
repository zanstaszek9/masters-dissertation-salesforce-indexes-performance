# ./scripts/sandboxUtils/queriesPlanAndTimes/queries/number-short.ps1
param (
[Alias("s")][string]$sObjectName = 'MISSING-sObjectName',
[Alias("c")][string]$fieldApiName = 'MISSING-fieldApiName'
)


$inputQueries = @"
SELECT Id FROM $sObjectName
SELECT Id FROM $sObjectName WHERE $fieldApiName = 414120592.0
SELECT Id FROM $sObjectName WHERE $fieldApiName = 485020343.0
SELECT Id FROM $sObjectName WHERE $fieldApiName IN (851896872.0, 201907104.0, 884589645.0, 679783123.0, 549620024.0, 900559086.0)
SELECT Id FROM $sObjectName WHERE $fieldApiName = null
SELECT Id FROM $sObjectName WHERE $fieldApiName != null
SELECT Id FROM $sObjectName WHERE $fieldApiName < 700000000.0
SELECT Id FROM $sObjectName WHERE $fieldApiName > 500000000.0
SELECT Id FROM $sObjectName WHERE $fieldApiName < 500000000.0
SELECT Id FROM $sObjectName WHERE $fieldApiName > 500000000.0 AND $fieldApiName < 700000000.0
"@


return $inputQueries