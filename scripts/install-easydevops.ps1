winget install --id Microsoft.DotNet.sdk.8 -e --source winget
winget install --id Git.Git -e --source winget
$urlRepo = "https://github.com/DuurtKort/EasyDevOps-ITM.git"
$Folder = "$env:USERPROFILE\EasyDevOps-ITM"
git clone $urlRepo $Folder
Set-Location "$Folder\frontend"
dotnet run
