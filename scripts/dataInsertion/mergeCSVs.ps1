#./scripts/dataInsertion/mergeCSVs.ps1
#./scripts/dataInsertion/mergeCSVs.ps1  -s "./scripts/dataCreation/csvFiles/Account_data.csv" -e "./scripts/dataCreation/csvFiles/Numbers-unique-with-null.csv" -r ".\dataToInsert\merged\Account_data_numbers.csv" -i Number_externalId__c
#./scripts/dataInsertion/mergeCSVs.ps1  -s "./scripts/dataCreation/csvFiles/Account_data.csv" -e "./scripts/dataCreation/csvFiles/Numbers-unique.csv" -r ".\dataToInsert\merged\Account_data_numbers_no_nulls.csv" -i Number_externalId__c
#./scripts/dataInsertion/mergeCSVs.ps1  -s "./scripts/dataCreation/csvFiles/Account_data.csv" -e "./scripts/dataCreation/csvFiles/Numbers-short-unique-with-null.csv" -r ".\dataToInsert\merged\Account_data_numbers_short.csv" -i Number_short_no_index__c
#./scripts/dataInsertion/mergeCSVs.ps1  -s "./scripts/dataCreation/csvFiles/Account_data.csv" -e "./scripts/dataCreation/csvFiles/Numbers-short-unique.csv" -r ".\dataToInsert\merged\Account_data_numbers_short_no_nulls.csv" -i Number_short_no_index__c
#./scripts/dataInsertion/mergeCSVs.ps1  -s "./scripts/dataCreation/csvFiles/Account_data.csv" -e "./scripts/dataCreation/csvFiles/Emails-unique.csv" -r ".\dataToInsert\merged\Account_data_Emails_no_nulls.csv" -i Email_no_index__c
#./scripts/dataInsertion/mergeCSVs.ps1  -s "./scripts/dataCreation/csvFiles/Account_data.csv" -e "./scripts/dataCreation/csvFiles/Emails-unique-with-null.csv" -r ".\dataToInsert\merged\Account_data_Emails.csv" -i Email_externalId_nulls__c
#./scripts/dataInsertion/mergeCSVs.ps1  -s "./scripts/dataCreation/csvFiles/Account_data.csv" -e "./scripts/dataCreation/csvFiles/Text-to-255-unique.csv" -r ".\dataToInsert\merged\Account_data_Text_no_nulls" -i Text_no_nulls__c
#./scripts/dataInsertion/mergeCSVs.ps1  -s "./scripts/dataCreation/csvFiles/Account_data.csv" -e "./scripts/dataCreation/csvFiles/Text-to-255-unique-with-null.csv" -r ".\dataToInsert\merged\Account_data_Text" -i Text__c
#./scripts/dataInsertion/mergeCSVs.ps1  -s "./scripts/dataCreation/csvFiles/Account_data.csv" -e "./scripts/dataCreation/csvFiles/Text-to-60-unique.csv" -r ".\dataToInsert\merged\Account_data_Text_60_no_nulls.csv" -i Text_no_nulls__c
#./scripts/dataInsertion/mergeCSVs.ps1  -s "./scripts/dataCreation/csvFiles/Account_data.csv" -e "./scripts/dataCreation/csvFiles/Text-to-60-unique-with-null.csv" -r ".\dataToInsert\merged\Account_data_Text_60.csv" -i Text__c
#./scripts/dataInsertion/mergeCSVs.ps1  -s "./scripts/dataCreation/csvFiles/Account_data.csv" -e "./scripts/dataCreation/csvFiles/Text-Autonumber-unique.csv" -r ".\dataToInsert\merged\Account_data_Text_Autonumber.csv" -i Text_Autonumber__c


param(
    [Alias("s")][string]$firstInput,
    [Alias("e")][string]$secondInput,
    [Alias("r")][string]$outputFile,
    [Alias("i")][string]$fieldApiName
)

$host.privatedata.ProgressForegroundColor = "darkgreen"
$host.privatedata.ProgressBackgroundColor = "black"

#Input and output files
# $firstInput = ".\dataToInsert\Account_data.csv"
# $secondInput = ".\dataToInsert\indexedColumnData\Numbers-unique-with-nulls.csv"
# $outputFile = ".\dataToInsert\merged\Account_data_numbers.csv"
# $fieldApiName = "Number_externalId__c"


$MaxFileSizeBytes = 150000000 - 2000000 #148 MB
#$MaxFileSizeBytes = 1500
Write-Progress "Starting merging script..."
# Opening output file
$outputFileHandle = [System.IO.StreamWriter]::new($outputFile)

try {
    # Opening input files in streaming mode
    $firstFileLines = Get-Content -Path $firstInput
    $secondFileLines = Get-Content -Path $secondInput

    # Check if both files have the same number of lines
    $totalLines = $firstFileLines.Count
    if ($totalLines -ne $secondFileLines.Count) {
        Write-Error "Files do not have the same number of lines. Please make sure both files have the same number of lines."
        exit
    }


    $headerLine = "$($firstFileLines[0].TrimEnd()),$($fieldApiName.TrimEnd())"
    $isHeaderInserted = $false
    $currentFileSize = 0 + [Text.Encoding]::UTF8.GetByteCount("$headerLine")
    Write-Warning "currentFileSize: $currentFileSize"
    $filePart = 0

    for ($i = 0; $i -lt $totalLines; $i++) {
        # Progress bar every 1000 lines
        if ($i % 1000 -eq 0) {
            $percentComplete = [math]::Round(($i / $totalLines) * 100)
            Write-Progress -Activity "Progress" -Status "Lines $($i) // $totalLines ($percentComplete%)"
        }

        $combinedLine = ""
        $lineFromFirstFile = $firstFileLines[$i].TrimEnd()

        # Replace the first line of the second file with the fieldApiName
        if (!$isHeaderInserted) {
            $combinedLine = $headerLine
            $isHeaderInserted = $true
        } else {
            $lineFromSecondFile = $secondFileLines[$i].Trim()
            $combinedLine = "$lineFromFirstFile,$lineFromSecondFile"
        }

        # Write the combined line directly to the output file
        $outputFileHandle.WriteLine($combinedLine)

        $combinedLineSize = [Text.Encoding]::UTF8.GetByteCount("$combinedLine\r\n")
        $currentFileSize += $combinedLineSize

        if ($currentFileSize -ge $MaxFileSizeBytes ) {
            $outputFileHandle.Close();
            Write-Warning "File created: $outputFile"


            ++$filePart
            $newOutputFile = $outputFile -replace ".csv", "_part$filePart.csv"
            $outputFileHandle = [System.IO.StreamWriter]::new($newOutputFile)
            Write-Warning "Switching to new file after: $newOutputFile"

            $isHeaderInserted = $false
            $currentFileSize = 0 + [Text.Encoding]::UTF8.GetByteCount("$headerLine")
        }

    }
}
finally {
    # Closing the output file
    $outputFileHandle.Close()
    Write-Host "File created: $outputFile"
    $currentFileSize = (Get-Item -Path $outputFile).Length
    Write-Host "File size: $currentFileSize"
}
