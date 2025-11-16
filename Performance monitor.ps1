# System Performance Monitoring
while ($true) {
    $cpuUsage = Get-WmiObject Win32_Processor | Select-Object -ExpandProperty LoadPercentage
    $memoryUsage = Get-WmiObject Win32_OperatingSystem | Select-Object -ExpandProperty FreePhysicalMemory
    $diskUsage = Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='C:'" | Select-Object -ExpandProperty FreeSpace

    Write-Host "CPU Usage: $cpuUsage%"
    Write-Host "Memory Usage: $($memoryUsage / 1MB) MB"
    Write-Host "Disk Free Space: $($diskUsage / 1GB) GB"
    
    Start-Sleep -Seconds 1  # Adjust interval as needed
    Clear-Host
}

# Pause to keep the window open
Write-Host "Press Enter to exit."
Read-Host