
Get-GitPubIssue
---------------
### Synopsis
Gets GitHub Issues as Posts

---
### Description

Gets GitHub Issues as Posts.

By default, will get closed issues with the label 'post'.

---
### Examples
#### EXAMPLE 1
```PowerShell
Get-GitPubIssue -UserName StartAutomating -Repository PipeScript
```

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
#### **IssueState**

The issue state.  Can be open, closed, or all



Valid Values:

* open
* closed
* all



> **Type**: ```[String]```

> **Required**: false

> **Position**: 3

> **PipelineInput**:false



---
#### **IssueLabel**

The issue label.



> **Type**: ```[String[]]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:false



---
#### **GitHubAccessToken**

The GitHub Access token.
If this is not provided, $env:GITHUB_TOKEN is present, $env:GITHUB_TOKEN will be used.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 5

> **PipelineInput**:false



---
### Syntax
```PowerShell
Get-GitPubIssue [[-UserName] <String>] [-Repository] <String> [[-IssueState] <String>] [[-IssueLabel] <String[]>] [[-GitHubAccessToken] <String>] [<CommonParameters>]
```
---


