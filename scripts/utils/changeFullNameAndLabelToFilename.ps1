#  ../../../scripts/utils/changeFullNameAndLabelToFilename.ps1
# Get the current directory where the script is run
$directoryPath = Get-Location

# Get all XML files in the current directory
$xmlFiles = Get-ChildItem -Path $directoryPath -Filter *.xml

foreach ($file in $xmlFiles) {
    # Get the file name without extension
    $fileNameWithoutExtension = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)

    # Extract the new name before the first period (.) or the full name if no period exists
    $newName = ($fileNameWithoutExtension -split '\.')[0]

    # Determine the label by removing the '__c' suffix if it exists and replacing underscores with spaces
    $newLabel = $newName -replace "__c$", ""
    $newLabel = $newLabel -replace "_", " "

    # Load the XML file
    [xml]$xmlContent = Get-Content -Path $file.FullName

    # Update the <fullName> and <label> elements with string values
    $xmlContent.CustomField.fullName = [string]$newName
    $xmlContent.CustomField.label = [string]$newLabel

    # Save the modified XML back to the file
    $xmlContent.Save($file.FullName)
}

Write-Output "XML files updated successfully."
