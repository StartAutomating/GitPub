@{
    ModuleVersion = '0.1.4'
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
## GitPub 0.1.4

* Publish-GitPub: Improved publishing error behavior (Fixes #48)
* Get-GitPubIssue/Get-GitPubRelease:  Linking issues (Fixes #47)
* Publish-GitPubJekyll:
  * Improving Date Handling (Fixes #51)
  * Allowing more filenames (Fixes #52)
* Providing RunGitPub Job Definition (Fixes #53)

More history available in the [changelog](https://gitpub.start-automating.com/CHANGELOG/)
'@
        }
    }
}
