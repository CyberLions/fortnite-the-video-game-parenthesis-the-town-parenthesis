@echo off
setlocal EnableDelayedExpansion

rem Path to the text file containing the list of users
set "usersFilePath=..\users.txt"

rem Read the list of users from the text file
for /f "tokens=*" %%A in (%usersFilePath%) do (
    set "usersToKeep=!usersToKeep! %%A"
)

rem Get all existing users from AD
for /f "tokens=*" %%A in ('dsquery user -limit 0') do (
    set "allUsers=!allUsers! %%A"
)

rem Users to remove
for %%A in (%allUsers%) do (
    echo !usersToKeep! | findstr /i /c:"%%~nxA" >nul || set "usersToRemove=!usersToRemove! %%~nxA"
)

rem Remove users not in the array
for %%A in (%usersToRemove%) do (
    dsrm %%A
)

echo Users removed successfully.

