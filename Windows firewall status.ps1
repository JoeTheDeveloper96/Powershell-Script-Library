# Check if the script is running with administrative privileges
function Test-Administrator {
    $currentUser = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    return $currentUser.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

if (-not (Test-Administrator)) {
    # Restart script as an administrator
    Start-Process -FilePath "powershell" -ArgumentList ("-File", "`"$PSCommandPath`"") -Verb RunAs
    exit
}

# Check Windows Firewall status
$firewallStatus = Get-Service -Name MpsSvc

if ($firewallStatus.Status -eq "Running") {
    Write-Host "Windows Firewall is running."
} else {
    Write-Host "Windows Firewall is not running."
}

# Pause to keep the window open
Write-Host "Press Enter to exit."
Read-Host