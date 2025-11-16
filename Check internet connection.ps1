# Set execution policy to allow script execution
Set-ExecutionPolicy Bypass -Scope Process -Force

# Internet Connection Status Check
$serverToPing = "8.8.8.8"  # Google's public DNS server

if (Test-Connection -ComputerName $serverToPing -Count 1 -Quiet) {
    Write-Host "Internet connection is up."
} else {
    Write-Host "No internet connection."
}

# Reset execution policy to its original state (optional)
Set-ExecutionPolicy Default -Scope Process -Force

# Pause to keep the window open
Write-Host "Press Enter to exit."
Read-Host

