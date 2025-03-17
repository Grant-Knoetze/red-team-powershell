# Define the destination for the shortcut
$destination = "C:\Users\amrth\Desktop\OurShortcut.lnk"

try {
    # Create a Shell object
    $shell = New-Object -ComObject WScript.Shell

    # Create the shortcut
    $shortcut = $shell.CreateShortcut($destination)

    # Set the target path to calc.exe
    $shortcut.TargetPath = "calc.exe"

    # Optionally, set an icon location (if needed)
    # Example: $shortcut.IconLocation = "C:\Path\To\Icon.ico,0"

    # Save the shortcut
    $shortcut.Save()

    # Read the shortcut file as bytes
    $bytes = [System.IO.File]::ReadAllBytes($destination)

    # Modify byte 21 (0x15) to set the 6th bit (0x20) ON
    $bytes[0x15] = $bytes[0x15] -bor 0x20

    # Write the modified bytes back to the shortcut file
    [System.IO.File]::WriteAllBytes($destination, $bytes)

    Write-Host "Shortcut created and modified successfully at: $destination"
}
catch {
    Write-Host "An error occurred: $_"
}