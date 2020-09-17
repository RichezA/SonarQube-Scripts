[CmdletBinding()]
Param(
    [Parameter (Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String] $AccessToken,

    [Parameter (Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String] $ServerName,

    [Parameter (Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String] $ProjectKey
)

$Token = [System.Text.Encoding]::UTF8.GetBytes("$($AccesToken)" + ":")
$Token64 = [System.Convert]::ToBase64String($Token)
$bearerAuth = [string]::Format("Bearer {0}", $Token64)
 
$Headers = @{ Authorization = $bearerAuth }

$Result = Invoke-RestMethod -Uri http://$ServerName/api/qualitygates/project_status?projectKey=$ProjectKey -Headers $Headers
$Result | ConvertTo-Json
 
if ($Result.projectStatus.status -eq "OK"){
    Write-Host "Quality Gate Succeeded."
}
else{
    throw "Quality gate failed."
}
