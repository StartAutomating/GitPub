@{
    ModuleVersion = '0.1.2'
    RootModule = 'GitPub.psm1'
    TypesToProcess = 'GitPub.types.ps1xml'
    FormatsToProcess = 'GitPub.format.ps1xml'
    Description = 'GitPub:  Easily Automate Publishing from GitHub'
    Guid = 'e6c8682e-ba31-49c0-bf6d-e211c70b2f00'
    Author='James Brundage'
    CompanyName='Start-Automating'
    Copyright='2022 Start-Automating'
    PrivateData = @{
        PSData = @{
            ProjectURI = 'https://github.com/StartAutomating/GitPub'
            LicenseURI = 'https://github.com/StartAutomating/GitPub/blob/main/LICENSE'
            ReleaseNotes = @'
## GitPub 0.1.2

* Fixing GitHub Action Issues:
  * Will not push to TargetBranch when not on a branch (#33)
* Get-GitPubIssue/Get-GitPubRelease:
  * UserName is now optional (#32)
* Publish-GitPubJekyll:
  * Including SourceURL in front matter (#34)
---
'@
        }
    }
}
