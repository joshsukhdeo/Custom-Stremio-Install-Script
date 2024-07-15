try{
    Import-Module WingetTools
} catch {
    Install-Module WingetTools
    Import-Module WingetTools 
}

$currentlyInstalledStremio = Get-WinGetPackage Stremio.Stremio

if($currentlyInstalledStremio){
    taskkill /f /im stremio.exe /T
    taskkill /f /im stremio-runtime.exe /t
    winget uninstall stremio --wait
}
winget install stremio
Copy-Item ./server.js "$($env:USERPROFILE)\AppData\Local\Programs\LNV\Stremio-4\server.js" -force
