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

$Token = [System.Text.Encoding]::UTF8.GetBytes($AccesToken + ":")
$Token64 = [System.Convert]::ToBase64String($Token)
 
$Headers = @{ Authorization = [string]::Format("Basic {0}", $Token64) }
 
$QualityGateResult = Invoke-RestMethod -Method Get -Uri http://$ServerName/api/qualitygates/project_status?projectKey=$ProjectKey -Headers $Headers
$QualityGateResult | ConvertTo-Json | Write-Host
 
if ($QualityGateResult.projectStatus.status -eq "OK"){
    Write-Host "Quality Gate Succeeded"
}
else{
    throw "Quality gate failed. Please check and fix the issues by reviewing the same."
}