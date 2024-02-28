# Path to the text file containing the list of users
$usersFilePath = "C:\path\to\users.txt"

# Read the list of users from the text file
$usersToKeep = Get-Content $usersFilePath

# Get all existing users from AD
$allUsers = Get-ADUser -Filter * -Property SamAccountName | Select-Object -ExpandProperty SamAccountName

# Users to remove
$usersToRemove = $allUsers | Where-Object { $_ -notin $usersToKeep }

# Remove users not in the array
foreach ($user in $usersToRemove) {
    Remove-ADUser -Identity $user -Confirm:$false
}

Write-Host "Users removed successfully."
