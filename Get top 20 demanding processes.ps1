# Get total CPU capacity (number of logical processors)
$totalCPUCapacity = (Get-WmiObject Win32_ComputerSystem).NumberOfLogicalProcessors

# Loop to continuously monitor CPU usage every 2 seconds
while ($true) {
    # Clear the console
    Clear-Host
    
    # Get top CPU consuming processes
    $processes = Get-Process | Sort-Object -Property CPU -Descending | Select-Object -First 20

    # Display top CPU consuming processes with percentage of total CPU capacity
    foreach ($process in $processes) {
        $processName = $process.ProcessName
        $cpuUsage = [Math]::Round(($process.CPU / $totalCPUCapacity) / 100, 2)
        Write-Output "Process $processName CPU Usage: $cpuUsage % of total CPU capacity"
    }

    # Wait for 2 seconds before refreshing
    Start-Sleep -Seconds 2
}
# Pause to keep the window open
Write-Host "Press Enter to exit."
Read-Host

