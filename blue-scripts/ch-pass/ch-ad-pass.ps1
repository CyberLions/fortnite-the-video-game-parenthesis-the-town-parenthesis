$NewPassword = Read-Host "Enter the new password" -AsSecureString
Get-ADUser -Filter * | ForEach-Object {
    Set-ADAccountPassword -Identity $_.SamAccountName -NewPassword $NewPassword -Reset
}
