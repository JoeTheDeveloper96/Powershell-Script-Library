$computerName = "localhost"  # Replace "RemoteComputerName" with the actual name of the remote PC

# Get disk information from the remote computer
$diskInfo = Get-WmiObject -Class Win32_LogicalDisk -ComputerName $computerName -Filter "DeviceID='C:'"

if ($diskInfo) {
    $freeSpaceGB = [math]::Round($diskInfo.FreeSpace / 1GB, 2)
    $totalSpaceGB = [math]::Round($diskInfo.Size / 1GB, 2)

    Write-Host "Free space on C drive of $computerName $freeSpaceGB GB"
    Write-Host "Total space on C drive of $computerName $totalSpaceGB GB"
} else {
    Write-Host "Failed to retrieve disk information for C drive on $computerName"
}
