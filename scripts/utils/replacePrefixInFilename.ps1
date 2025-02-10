#   ../../../scripts/utils/replacePrefixInFilename.ps1
# Definicja zmiennych
$oldPrefix = "Text"
$newPrefix = "Autonumber"

# Pobierz wszystkie pliki w bieżącym katalogu, których nazwa zaczyna się od $oldPrefix
$files = Get-ChildItem -Path . -Filter "$oldPrefix*"

foreach ($file in $files) {
    # Nowa nazwa pliku, zastąpienie $oldPrefix na $newPrefix
    $newName = $file.Name -replace "^$oldPrefix", $newPrefix

    # Zmień nazwę pliku
    Rename-Item -Path $file.FullName -NewName $newName
}
