#requires -Module GitPub

Publish-GitPub -Parameter @{
    "Get-GitPubIssue" = @{
        "IssueState" = "All"
        "UserName"   = "StartAutomating"
        "Repository" = "GitPub"       
    }
    "Publish-GitHubJekyll" = @{
        OutputPath = "docs"
    }
}
