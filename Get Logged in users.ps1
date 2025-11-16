# Get logged in users
$users = Get-WmiObject Win32_ComputerSystem

# Display logged in users
Write-Output "Logged in Users:"
foreach ($user in $users.UserName) {
    Write-Output " - $user"
}
# Pause to keep the window open
Write-Host "Press Enter to exit."
Read-Host