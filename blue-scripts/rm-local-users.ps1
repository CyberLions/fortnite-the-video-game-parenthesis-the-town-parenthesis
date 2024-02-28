# Path to the text file containing the list of users
$usersFilePath = "..\users.txt" 

# Read the list of users from the text file
$usersToKeep = Get-Content $usersFilePath

# Get all existing users
$allUsers = Get-LocalUser | Select-Object -ExpandProperty Name

# Users to remove
$usersToRemove = $allUsers | Where-Object { $_ -notin $usersToKeep }

# Remove users not in the array
foreach ($user in $usersToRemove) {
    Remove-LocalUser -Name $user -Force
}

Write-Host "Users removed successfully."
