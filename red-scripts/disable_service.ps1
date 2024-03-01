$serviceName = "ServiceName" # CHANGE ME

# Loop indefinitely
while ($true) {
    # Attempt to get the service
    $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue

    if ($service -ne $null) {
        # Check if the service is running
        if ($service.Status -eq 'Running') {
            # Stop the service
            Stop-Service -Name $serviceName -Force
            Write-Host "Service $serviceName stopped successfully."

            # Set the service startup type to Disabled
            Set-Service -Name $serviceName -StartupType Disabled
            Write-Host "Service $serviceName is now set to disabled."
        } else {
            Write-Host "Service $serviceName is not running. Checking again in 5 seconds..."
        }
    } else {
        Write-Host "Service $serviceName not found. Checking again in 5 seconds..."
    }

    # Wait for 5 seconds before the next check
    Start-Sleep -Seconds 5
}

