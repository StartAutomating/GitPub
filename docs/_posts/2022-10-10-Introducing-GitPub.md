---

title: Introducing GitPub
author: StartAutomating
tag: enhancement
---
# Introducing GitPub

[GitPub](https://github.com/StartAutomating/GitPub) is a [GitHub Action](https://github.com/marketplace/actions/usegitpub) and [PowerShell Module](https://www.powershellgallery.com/packages/GitPub/) that helps Easily Automate Publishing from GitHub.

## What does GitPub do?

GitPub gives you a flexible framework for converting content (primarily from GitHub) into published content.

For example, you can turn GitHub issues that match a certain label into [Jeykll](https://jekyllrb.com/) posts within a GitHub Page.

You might be reading output from GitPub that way right now.  This post started as [this GitHub issue](https://github.com/StartAutomating/GitPub/issues/1).

Publishing this way makes for a more virtuous cycle when working with GitHub.

If you write high quality issues or release notes, you can share them with the world without breaking a sweat.

## Using GitPub

You can use GitPub as a GitHub Action or as a PowerShell Module.

### Using the GitPub action

You can easily use GitPub as a GitHub action.

The following workflow is used to publish GitPub whenever issues change:

```yaml
name: OnIssueChanged
on:
  issues:
  workflow_dispatch:
jobs:
  RunGitPub:
    runs-on: ubuntu-latest
    if: ${{ success() }}
    steps:
      - name: Check out repository
        uses: actions/checkout@v2
      - name: Use GitPub Action
        uses: StartAutomating/GitPub@main
        id: GitPub
        with:
          TargetBranch: edits-$([DateTime]::Now.ToString("o").Replace(":","-"))
          CommitMessage: Posting with GitPub [skip ci]
          PublishParameters: |
            {
                "Get-GitPubIssue": {
                    "UserName": "${{github.repository_owner}}",
                    "Repository": "GitPub"
                },
                "Get-GitPubRelease": {
                    "UserName": "${{github.repository_owner}}",
                    "Repository": "GitPub"
                },
                "Publish-GitPubJekyll": {
                    "OutputPath": "docs/_posts"
                }
            }
```

### Using the GitPub module

You can install GitPub from the PowerShell Gallery, or download a release from [github](https://github.com/StartAutomating/GitPub):

~~~PowerShell
Install-Module GitPub -Scope CurrentUser -Force
Import-Module GitPub -Force -PassThru
~~~

## How GitPub Works

GitPub works using the simple concepts of Sources and Publishers.

### GitPub Sources

A source is a function that provides content to post.  GitPub comes with three sources:

|Source|Function|Description|
|-|-|-|
|Gist       | [Get-GitPubGist](https://gitpub.start-automating.com/Get-GitPubGist)         | Turns gists into posts      |
|Issue     | [Get-GitPubIssue](https://gitpub.start-automating.com/Get-GitPubIssue)       | Turns issues into posts    |
|Release | [Get-GitPubRelease](https://gitpub.start-automating.com/Get-GitPubRelease)   | Turns releases into posts |

~~~PowerShell
Get-GitPub |
    Select-Object -ExpandProperty Sources
~~~

### GitPub Publishers

A publisher is a function that finalizes content and publishes it.  GitPub comes with one publisher:

|Source|Function|Description|
|-|-|-|
|Jeykll    | [Publish-GitPubJeykll](https://gitpub.start-automating.com/Publish-GitPubJeykll) | Publishes content to _posts directories    |
