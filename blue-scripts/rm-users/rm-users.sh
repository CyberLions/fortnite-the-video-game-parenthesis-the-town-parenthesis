#!/bin/bash

# Path to the text file containing the list of users
usersFilePath="../users.txt"

# Read the list of users from the text file
usersToKeep=$(cat "$usersFilePath")

# Define a list of users or user groups to exclude
excludedUsers="root daemon bin sys sync games man lp mail news uucp proxy www-data backup list irc gnats nobody systemd-journal sshd"

# Get all existing users
allUsers=$(cut -d: -f1 /etc/passwd)

# Users to remove
usersToRemove=""
for user in $allUsers; do
    # Check if the user should be excluded
    if [[ ! " $excludedUsers " =~ " $user " ]]; then
        # Check if the user is not in the list of users to keep
        if ! grep -q "$user" <<< "$usersToKeep"; then
            usersToRemove="$usersToRemove $user"
        fi
    fi
done

# Remove users not in the array
for user in $usersToRemove; do
    sudo userdel -r "$user"
done

echo "Users removed successfully."
