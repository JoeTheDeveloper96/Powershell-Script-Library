
# Get CPU utilization percentage
$cpuUsage = (Get-WmiObject Win32_Processor | Measure-Object -Property LoadPercentage -Average).Average

# Display CPU utilization
Write-Output "CPU Utilization: $cpuUsage %"
