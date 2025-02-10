param (
    [string]$Key,
    [string]$Value
)

$config = .$PSScriptRoot/getConfig.ps1

# Aktualizowanie wartości przekazanego klucza
$config.$Key = $Value

# Konwertowanie hashtable na JSON, zapis do pliku config.json
$config | ConvertTo-Json -Depth 3 | Out-File -FilePath $config.Path -Encoding utf8
