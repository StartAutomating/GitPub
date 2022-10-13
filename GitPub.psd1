@{
    ModuleVersion = '0.1.3'
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
## GitPub 0.1.3

* Publish-GitPubJekyll will generate summary pages unless -NoSummary is passed.
* GitPub's GitHub Page Now Uses Permalink: pretty
'@
        }
    }
}
