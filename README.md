# SonarQube-Scripts

This repository holds the scripts that can be used to manage a SonarQube integration.

## CheckQualityGate.ps1

This script checks if the project's quality gate status is OK, if not. It throws an error. This script can be included in a DevOps CI pipeline and be used to deny a PR merge per example.

### Fields needed
- AccessToken = SonarQube access token in order to authenticate.
- ServerName  = Hosting URL of the SonarQube server.
- ProjectKey  = SonarQube project's key. Permits to get the status for that certain project.

## RunSonarAnalyzer.ps1

This script works with .NET Framework 4.6+ projects only.
This script starts the SonarAnalyzer, builds the solution and analyzes the code that has been built.

### Fields needed
- ProjectPath   = The path linking to the directory where the project's solution (.sln file) is. 
- ProjectKey    = SonarQube project's key. Permits to determine where the analysis should be placed.
- HostUrl       = Hosting URL of the SonarQube server.
- ProjectToken  = SonarQube project's access token. Needed for the authentication.
