# red-team-powershell
This is PowerShell code useful for red teaming engagements.

* shortcut.ps1 creates a shortcut on the desktop and is useful for creating a shortcut for use during initial access operations involving a LNK file.
* downloadExecute will use a .NET web object to download a red team trojan from OneDrive and execute it. NewObject and DownloadFile can be configured to use a COM object insted of a .NET web object if you prefer that.
