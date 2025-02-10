# ./scripts/sandboxUtils/queriesPlanAndTimes/queries/text.ps1
param (
[Alias("s")][string]$sObjectName = 'MISSING-sObjectName',
[Alias("c")][string]$fieldApiName = 'MISSING-fieldApiName'
)


$inputQueries = @"
SELECT Id FROM $sObjectName
SELECT Id FROM $sObjectName WHERE $fieldApiName = 'Energy for good billion site effort color.'
SELECT Id FROM $sObjectName WHERE $fieldApiName = 'Not existing String value'
SELECT Id FROM $sObjectName WHERE $fieldApiName IN ('Student trade list pressure.','Worry perhaps turn ten spend cover worry.','Hold future interest maintain school model much.','Product once likely final born view probably front.','Last in daughter expert common ever.','Cause newspaper fight area. Learn themselves some.')
SELECT Id FROM $sObjectName WHERE $fieldApiName = null
SELECT Id FROM $sObjectName WHERE $fieldApiName != null
SELECT Id FROM $sObjectName WHERE $fieldApiName = ''
SELECT Id FROM $sObjectName WHERE $fieldApiName != ''
SELECT Id FROM $sObjectName WHERE $fieldApiName LIKE '%computer science%'
SELECT Id FROM $sObjectName WHERE (NOT $fieldApiName LIKE '%computer science%')
SELECT Id FROM $sObjectName WHERE $fieldApiName < 'Rule commercial among generation they teach smile pull.'
SELECT Id FROM $sObjectName WHERE $fieldApiName > 'Hundred leave represent. American provide black.'
SELECT Id FROM $sObjectName WHERE $fieldApiName < 'Hundred leave represent. American provide black.'
SELECT Id FROM $sObjectName WHERE $fieldApiName > 'Hundred leave represent. American provide black.' AND $fieldApiName < 'Rule commercial among generation they teach smile pull.'
"@


return $inputQueries