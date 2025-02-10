#./scripts/sandboxUtils/getMultipleQueryPlans.ps1

# Input queries as a single string block (paste them here)
<#$inputQueries = @'
SELECT Id FROM Account
SELECT Id FROM Account WHERE Number_short_externalId__c = 414120592.0
SELECT Id FROM Account WHERE Number_short_externalId__c = 485020343.0
SELECT Id FROM Account WHERE Number_short_externalId__c IN (851896872.0, 201907104.0, 884589645.0, 679783123.0, 549620024.0, 900559086.0)
SELECT Id FROM Account WHERE Number_short_externalId__c = null
SELECT Id FROM Account WHERE Number_short_externalId__c != null
SELECT Id FROM Account WHERE Number_short_externalId__c < 700000000.0
SELECT Id FROM Account WHERE Number_short_externalId__c > 500000000.0
SELECT Id FROM Account WHERE Number_short_externalId__c < 500000000.0
SELECT Id FROM Account WHERE Number_short_externalId__c > 500000000.0 AND Number_short_externalId__c < 700000000.0
'@#>

# Split the input string into an array of queries
$queries = $inputQueries -split "`r?`n"

# Iterate over each query and execute the script
foreach ($query in $queries) {
    if (-not [string]::IsNullOrWhiteSpace($query)) {
        ./scripts/sandboxUtils/getQueryPlan.ps1 -Query $query
    }
}

###############
#Example Output:
#Query: SELECT Id FROM Account WHERE Number_short_no_index__c > 500000000000000000.0 AND Number_short_no_index__c < 700000000000000000.0
#Cardinality LeadingOperationType RelativeCost SObjectCardinality SObjectType NoteDescription                                           NoteFields TableEnumOrId
#----------- -------------------- ------------ ------------------ ----------- ---------------                                           ---------- -------------
#277500 TableScan                   1,481            1500000 Account     Not considering filter for optimization because unindexed IsDeleted  Account
#277500 Index                        2,22            1500000 Account     Not considering filter for optimization because unindexed IsDeleted  Account


const baseEntries = [
'xoul.ai',
'karachan.org',
'x.com',
'twitter.com',
'xvideos.com',
'djav.org'
];

const entries = baseEntries.flatMap(entry => [
'http://${entry},
'http://${entry}/,
'http://${entry}/*,
'http://www.${entry},
'http://www.${entry}/,
'http://www.${entry}/*,
'https://${entry},
'https://${entry}/,
'https://${entry}/*,
'https://www.${entry},
'https://www.${entry}/,
'https://www.${entry}/*,
'http://it.${entry}/*,
'https://it.${entry}/*,
'http://pl.${entry}/*,
'https://pl.${entry}/*,
]);

(async function automateEntries() {
for (const entry of entries) {
try {
// Kliknij przycisk "Dodaj"
const addButton = document.querySelector('#add');
if (addButton) {
addButton.click();
}

// Poczekaj na modal
await new Promise(resolve => setTimeout(resolve, 2000));

// Wprowadź URL do pola wejściowego
const urlInput = document.querySelector('#url');
if (urlInput) {
urlInput.value = entry;
}

// Kliknij przycisk "OK"
const okButton = [...document.querySelectorAll('button')].find(button => button.textContent === 'OK');
if (okButton) {
okButton.click();
}

// Poczekaj 2 sekundy przed następną iteracją
await new Promise(resolve => setTimeout(resolve, 2000));

} catch (error) {
console.error('Błąd podczas wprowadzania danych:', error);
}
}
})();