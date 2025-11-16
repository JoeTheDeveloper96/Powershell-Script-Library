# Check Windows Version
$osInfo = Get-CimInstance Win32_OperatingSystem

Write-Host "Operating System: $($osInfo.Caption)"
Write-Host "Version: $($osInfo.Version)"
Write-Host "Build Number: $($osInfo.BuildNumber)"