[CmdletBinding()]
Param(
    [Parameter (Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String] $ProjectPath,

    [Parameter (Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String] $ProjectKey,

    [Parameter (Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String] $HostUrl,

    [Parameter (Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String] $ProjectToken
)

SonarScanner.MSBuild.exe begin /k:$ProjectKey /d:sonar.host.url=$HostUrl /d:sonar.login=$ProjectToken
MSBuild.exe $ProjectPath /t:Rebuild
SonarScanner.MSBuild.exe end /d:sonar.login=$ProjectToken

Write-Host "SonarScanner successfully executed"