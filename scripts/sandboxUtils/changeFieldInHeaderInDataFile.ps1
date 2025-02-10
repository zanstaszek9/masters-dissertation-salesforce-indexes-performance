# ./scripts/sandboxUtils/changeFieldInHeaderInDataFile.ps1

# Ścieżka do pliku
$filename = "D:\Studia\Magisterka\code\dissertation\dataToInsert\merged\Account_data_Emails_4k-test.csv"

# Zmienna do przechowywania zmodyfikowanych linii
$lines = @()

# Flaga do wykrywania pierwszej linii
$firstLineProcessed = $false

# Odczyt pliku linia po linii
foreach ($line in [System.IO.File]::ReadLines($filename)) {
    Write-Warning "line: $line"

    $lineArray = $line.Split(",")  # Podziel linię po przecinkach
    $lineArray[-1] = "External_Email__c"  # Zmień ostatnią wartość na "External_Email__c"
    $line = $lineArray -join ","  # Połącz zmodyfikowaną linię


    # Dodaj linię (zmodyfikowaną lub nie) do zmiennej $lines
    $lines += $line
    break;
}

# Zapisz zmodyfikowane linie do pliku
[System.IO.File]::WriteAllLines($filename, $lines)
