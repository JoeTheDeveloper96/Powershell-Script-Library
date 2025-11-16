# Check System Uptime
$uptime = (Get-Date) - (gcim Win32_OperatingSystem).LastBootUpTime
Write-Host "System Uptime: $($uptime.Days) days, $($uptime.Hours) hours, $($uptime.Minutes) minutes"