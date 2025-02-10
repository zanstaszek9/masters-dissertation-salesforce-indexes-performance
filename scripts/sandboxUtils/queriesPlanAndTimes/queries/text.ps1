# ./scripts/sandboxUtils/queriesPlanAndTimes/queries/text.ps1
param (
[Alias("s")][string]$sObjectName = 'MISSING-sObjectName',
[Alias("c")][string]$fieldApiName = 'MISSING-fieldApiName'
)


$inputQueries = @"
SELECT Id FROM $sObjectName
SELECT Id FROM $sObjectName WHERE $fieldApiName = 'Energy focus all eye on agreement whose. At travel life create others happen north kind. Every east many keep consider author strategy.Child heart any purpose region. School share song staff third again. Meet worker throughout while say soldier.'
SELECT Id FROM $sObjectName WHERE $fieldApiName = 'Not existing String value'
SELECT Id FROM $sObjectName WHERE $fieldApiName IN ('Student throw give financial else base. Test her behind question. Challenge relationship may billion.Think court adult along store party. After look late price.Church option evening green issue religious international chair.','Worry person reduce may lead. End film line option green. Hit part fact face responsibility institution.','Hold begin nice. Power bring her issue official.Easy tree knowledge guy probably. Great through down character. City practice physical character break edge think. Speech opportunity chair American us positive.','Product at whatever expert recently field wife. Place very result better civil. Particularly ten security system around outside.Physical order boy. Best figure family provide senior state. Her artist money account little kitchen value measure.','School charge people across board then. Expect indeed account better first recently detail.Power agent college eye box federal. Along sense before in newspaper oil life responsibility. Her resource physical nor until.','Cause boy throw exist add. Word throw be throw wife reason mention. Crime financial very authority also.Once middle writer example hair.Audience with young measure student along. Might describe town.')
SELECT Id FROM $sObjectName WHERE $fieldApiName = null
SELECT Id FROM $sObjectName WHERE $fieldApiName != null
SELECT Id FROM $sObjectName WHERE $fieldApiName = ''
SELECT Id FROM $sObjectName WHERE $fieldApiName != ''
SELECT Id FROM $sObjectName WHERE $fieldApiName LIKE '%computer science%'
SELECT Id FROM $sObjectName WHERE (NOT $fieldApiName LIKE '%computer science%')
SELECT Id FROM $sObjectName WHERE $fieldApiName < 'Rule common too bed theory yard voice. Kitchen or start home range.Laugh dream different wonder arm once. Ahead today clearly movement others. Stage short far from cold black western.'
SELECT Id FROM $sObjectName WHERE $fieldApiName > 'Hundred mission law rule.Happen particularly with chance dinner upon trial. Opportunity religious best.Writer include maintain shoulder ability. Dark toward spend seek. Public dinner nature seven while weight around.'
SELECT Id FROM $sObjectName WHERE $fieldApiName < 'Hundred mission law rule.Happen particularly with chance dinner upon trial. Opportunity religious best.Writer include maintain shoulder ability. Dark toward spend seek. Public dinner nature seven while weight around.'
SELECT Id FROM $sObjectName WHERE $fieldApiName > 'Hundred mission law rule.Happen particularly with chance dinner upon trial. Opportunity religious best.Writer include maintain shoulder ability. Dark toward spend seek. Public dinner nature seven while weight around.' AND $fieldApiName < 'Rule common too bed theory yard voice. Kitchen or start home range.Laugh dream different wonder arm once. Ahead today clearly movement others. Stage short far from cold black western.'
"@


return $inputQueries