@echo off
setlocal EnableDelayedExpansion

rem Path to the text file containing the list of users
set "usersFilePath=..\users.txt"

rem Read the list of users from the text file
for /f "tokens=*" %%A in (%usersFilePath%) do (
    set "usersToKeep=!usersToKeep! %%A"
)

rem Get all existing users
for /f "tokens=*" %%U in ('net user ^| findstr /R /C:"[A-Za-z0-9]"') do (
    for %%V in (%%U) do (
        set "user=%%V"
        if "!user:~-1!" NEQ "$" (
            set "allUsers=!allUsers! !user!"
        )
    )
)

rem Users to remove
for %%A in (%allUsers%) do (
    echo !usersToKeep! | findstr /i /c:"%%A" >nul || set "usersToRemove=!usersToRemove! %%A"
)

rem Remove users not in the array
for %%A in (%usersToRemove%) do (
    net user %%A /delete >nul
)

echo Users removed successfully.

