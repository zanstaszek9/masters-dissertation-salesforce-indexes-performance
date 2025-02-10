# .\scripts\sandboxUtils\replaceFieldInPermissionSet.ps1  -s Account -c Email_externalId__c -f




param(
    [Alias("s")][string]$sobjectName,
    [Alias("c")][string]$fieldName,
    [Alias("f")][string]$permissionSetFilePath

)


if (-Not (Test-Path -Path $permissionSetFilePath)) {
    Write-Error "replaceFieldInPermissionSet - File not found!: $permissionSetFilePath"
    exit
}

[xml]$xml = Get-Content -Path $permissionSetFilePath

$fieldNode = $xml.PermissionSet.fieldPermissions



if ($fieldNode -ne $null) {
    $newFieldValue = "$sobjectName.$fieldName"

    $fieldNode.field = $newFieldValue

    $xml.Save($permissionSetFilePath)
    Write-Host "replaceFieldInPermissionSet - Saved '$newFieldValue' field into Permission Set file: $permissionSetFilePath"
} else {
    Write-Error "replaceFieldInPermissionSet - Node was empty in XML file."
}
