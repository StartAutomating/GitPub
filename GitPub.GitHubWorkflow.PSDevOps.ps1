#requires -Module PSDevOps
Import-BuildStep -ModuleName GitPub
New-GitHubWorkflow -Name "Analyze, Test, Tag, and Publish" -On Push, PullRequest, Demand -Job PowerShellStaticAnalysis, TestPowerShellOnLinux, TagReleaseAndPublish, BuildGitPub -Environment @{
    NoCoverage = $true
}|
    Set-Content (Join-Path $PSScriptRoot .github\workflows\TestAndPublish.yml) -Encoding UTF8 -PassThru

New-GitHubWorkflow -On Issue, Demand -Job RunGitPub -Name OnIssueChanged |
    Set-Content (Join-Path $PSScriptRoot .github\workflows\OnIssue.yml) -Encoding UTF8 -PassThru