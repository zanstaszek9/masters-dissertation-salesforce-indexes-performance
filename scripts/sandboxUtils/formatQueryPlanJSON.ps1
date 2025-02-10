param (
    [string]$json,
    [string]$query,
    [string]$executionStartDateTime
)


# $json = {"plans":[{"cardinality":198750,"fields":[],"leadingOperationType":"TableScan","notes":[{"description":"Not considering filter for optimization because unindexed","fields":["IsDeleted"],"tableEnumOrId":"Account"}],"relativeCost":1.3445,"sobjectCardinality":1500000,"sobjectType":"Account"},{"cardinality":198750,"fields":["Number_externalId_nulls__c"],"leadingOperationType":"Index","notes":[{"description":"Not considering filter for optimization because unindexed","fields":["IsDeleted"],"tableEnumOrId":"Account"}],"relativeCost":1.59,"sobjectCardinality":1500000,"sobjectType":"Account"}],"sourceQuery":"SELECT Id FROM Account WHERE Number_externalId_nulls__c > 500000000000000000.0 AND Number_externalId_nulls__c < 700000000000000000.0"}

# Convert JSON to PowerShell object
$data = $json | ConvertFrom-Json
""
# Display the query
"Query: " + $data.sourceQuery

# Create an empty array to store the table rows
$table = @()
$subplanCounter = 1

# Iterate through each plan in the JSON
foreach ($plan in $data.plans) {

    # Initialize variables with default values
    $noteDescription = ""
    $noteFields = ""
    $tableEnumOrId = ""

    # Check if notes exist and extract the relevant information
    if ($plan.notes.Count -gt 0) {
        $noteDescription = $plan.notes[0].description
        $noteFields = ($plan.notes[0].fields -join ", ")
        $tableEnumOrId = $plan.notes[0].tableEnumOrId
    }

    # Extract relevant fields and add them as an object to the table array
    $table += [PSCustomObject]@{
        'Cardinality'            = $plan.cardinality
        'Fields'                 = ($plan.fields -join ", ") # Extract fields array and join it as a string
        'LeadingOperationType'   = $plan.leadingOperationType
        'RelativeCost'           = [math]::round([decimal]$plan.relativeCost, 8)
        'SObjectCardinality'     = $plan.sobjectCardinality
        'SObjectType'            = $plan.sobjectType
        'NoteDescription'        = $noteDescription
        'NoteFields'             = $noteFields
        'TableEnumOrId'          = $tableEnumOrId
        'Subplan Id'             = $subplanCounter++
        'SOQL Query'             = $query
        'ExecutionStartDateTime' = $executionStartDateTime
    }
}

# Display the table with tab-separated columns
#$table | Format-Table -AutoSize

return $table
