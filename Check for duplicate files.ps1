# Define the directory to check for duplicate files
$directoryPath = "" #Enter your filepath here!

# Get all files in the directory
$files = Get-ChildItem -Path $directoryPath -File

# Create a hashtable to store file hashes
$fileHashes = @{}
$duplicatesCount = 0

# Iterate through each file
foreach ($file in $files) {
    # Calculate the hash of the file
    $hash = Get-FileHash -Path $file.FullName -Algorithm MD5

    # Check if the hash already exists in the hashtable
    if ($fileHashes.ContainsKey($hash.Hash)) {
        Write-Host "Duplicate file found:"
        Write-Host "Original: $($fileHashes[$hash.Hash])"
        Write-Host "Duplicate: $($file.FullName)"
        Write-Host
        $duplicatesCount++

        # Delete the duplicate file (uncomment the next line to enable deletion)
        Remove-Item -Path $file.FullName -Force
    } else {
        # Add the hash and file path to the hashtable
        $fileHashes[$hash.Hash] = $file.FullName
    }
}

# Display the total number of duplicates found
Write-Host "Total duplicates found: $duplicatesCount" -ForegroundColor Red
