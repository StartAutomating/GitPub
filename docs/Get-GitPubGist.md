
Get-GitPubGist
--------------
### Synopsis
Gets GitHub Gists as Posts

---
### Description

Gets GitHub Gists as Posts.

---
### Examples
#### EXAMPLE 1
```PowerShell
Get-GitPubGist -UserName StartAutomating
```

---
### Parameters
#### **UserName**

The GitHub Username or Organization.



> **Type**: ```[String]```

> **Required**: true

> **Position**: 1

> **PipelineInput**:false



---
#### **GitHubAccessToken**

The GitHub Access token.
If this is not provided, $env:GITHUB_TOKEN is present, $env:GITHUB_TOKEN will be used.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 2

> **PipelineInput**:false



---
### Syntax
```PowerShell
Get-GitPubGist [-UserName] <String> [[-GitHubAccessToken] <String>] [<CommonParameters>]
```
---


