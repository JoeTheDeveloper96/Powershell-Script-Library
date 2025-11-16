# Get total physical memory and free memory
$memory = Get-WmiObject Win32_OperatingSystem
$totalMemory = $memory.TotalVisibleMemorySize / 1MB
$freeMemory = $memory.FreePhysicalMemory / 1MB

# Calculate memory utilization percentage
$memoryUsage = (($totalMemory - $freeMemory) / $totalMemory) * 100

# Round the memoryUsage value
$memoryUsageRounded = [Math]::Round($memoryUsage)

# Display memory utilization
Write-Output "Memory Utilization: $memoryUsageRounded %"