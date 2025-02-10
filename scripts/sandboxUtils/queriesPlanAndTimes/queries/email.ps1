# ./scripts/sandboxUtils/queriesPlanAndTimes/queries/email.ps1
param (
    [Alias("s")][string]$sObjectName = 'MISSING-sObjectName',
    [Alias("c")][string]$fieldApiName = 'MISSING-fieldApiName'
)



$inputQueries = @"
SELECT Id FROM $sObjectName
SELECT Id FROM $sObjectName WHERE $fieldApiName = 'shawnstevens@yahoo.com'
SELECT Id FROM $sObjectName WHERE $fieldApiName = 'nonexisting@email.co.uk'
SELECT Id FROM $sObjectName WHERE $fieldApiName IN ('carla10@hotmail.com', 'myersangela@yahoo.com', 'williamadams@gmail.com', 'spencerarroyo@yahoo.com', 'janiceolson@hotmail.com', 'farleykevin@yahoo.com')
SELECT Id FROM $sObjectName WHERE $fieldApiName = null
SELECT Id FROM $sObjectName WHERE $fieldApiName != null
SELECT Id FROM $sObjectName WHERE $fieldApiName = ''
SELECT Id FROM $sObjectName WHERE $fieldApiName != ''
SELECT Id FROM $sObjectName WHERE $fieldApiName < 'rebeccakrueger@gmail.com'
SELECT Id FROM $sObjectName WHERE $fieldApiName > 'margarethenson@gmail.com'
SELECT Id FROM $sObjectName WHERE $fieldApiName < 'margarethenson@gmail.'
SELECT Id FROM $sObjectName WHERE $fieldApiName > 'margarethenson@gmail.' AND $fieldApiName < 'rebeccakrueger@gmail.com'
"@


return $inputQueries