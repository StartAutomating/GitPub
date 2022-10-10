@{
    ModuleVersion = '0.1.1'
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
## GitPub 0.1.1

* Fixing GitHub Action Issues:
  * TargetBranch was not pushing upstream (#21)
  * Action Required Different Name from Repo (#22)
* Publish-GitPub fixes:
  * Publish parameters now correctly mapped (#20)
* Publish-GitPubJekyll:
  * Inlcuding .PostTitle in FrontMatter (#18)
* Selfhosting Action (#19)
'@
        }
    }
}
