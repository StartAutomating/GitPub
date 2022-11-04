Get-GitPubRelease
-----------------
### Synopsis
Gets GitHub Releases as Posts

---
### Description

Gets GitHub Releases as Posts.
The release content will be considered the body of the post.

---
### Parameters
#### **UserName**

The GitHub Username or Organization.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 1

> **PipelineInput**:false



---
#### **Repository**

The repository



> **Type**: ```[String]```

> **Required**: true

> **Position**: 2

> **PipelineInput**:false



---
#### **ReleaseTag**

One or more tags used for releases.
By default, `release`.



> **Type**: ```[String[]]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **GitHubAccessToken**

The GitHub Access token.
If this is not provided, $env:GITHUB_TOKEN is present, $env:GITHUB_TOKEN will be used.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
### Syntax
```PowerShell
Get-GitPubRelease [[-UserName] <String>] [-Repository] <String> [[-ReleaseTag] <String[]>] [[-GitHubAccessToken] <String>] [<CommonParameters>]
```
---
