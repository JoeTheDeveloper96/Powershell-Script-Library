# PowerShell Script to Find Remote Shutdown (Event ID 1074) and Unexpected Shutdown (Event ID 6008) Events in Event Viewer

# Define event logs and IDs
$logName = "System"
$remoteShutdownID = 1074
$unexpectedShutdownID = 6008

# Get events with Event ID 1074 (Remote shutdown) from the System log
$shutdownEvents = Get-WinEvent -FilterHashtable @{LogName=$logName; Id=$remoteShutdownID} | 
    Select-Object TimeCreated, Id, Message

# Filter remote shutdown events related to shutdown.exe
$remoteShutdowns = $shutdownEvents | Where-Object { 
    $_.Message -like "*shutdown.exe*" 
}

# Get events with Event ID 6008 (Unexpected shutdown) from the System log
$unexpectedShutdowns = Get-WinEvent -FilterHashtable @{LogName=$logName; Id=$unexpectedShutdownID} | 
    Select-Object TimeCreated, Id, Message

# Display the results
if ($remoteShutdowns) {
    Write-Host "Remote Shutdown Events (Event ID 1074) Detected:" -ForegroundColor Green
    $remoteShutdowns | ForEach-Object {
        Write-Host "`nTime Created: " $_.TimeCreated
        Write-Host "Event ID: " $_.Id
        Write-Host "Message: " $_.Message
    }
} else {
    Write-Host "No remote shutdown events found." -ForegroundColor Yellow
}

# Display unexpected shutdowns
if ($unexpectedShutdowns) {
    Write-Host "`nUnexpected Shutdown Events (Event ID 6008) Detected:" -ForegroundColor Red
    $unexpectedShutdowns | ForEach-Object {
        Write-Host "`nTime Created: " $_.TimeCreated
        Write-Host "Event ID: " $_.Id
        Write-Host "Message: " $_.Message
    }
} else {
    Write-Host "No unexpected shutdown events found." -ForegroundColor Yellow
}