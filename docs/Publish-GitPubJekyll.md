
Publish-GitPubJekyll
--------------------
### Synopsis
Publishes content as Jekyll Posts

---
### Description

Publishes content as Jekyll Posts.

---
### Related Links
* [Get-GitPub](Get-GitPub.md)



* [Publish-GitPub](Publish-GitPub.md)



---
### Examples
#### EXAMPLE 1
```PowerShell
Get-GitPubIssue -Repository GitPub -Owner StartAutomating |
    Publish-GitPubJekyll
```

---
### Parameters
#### **PostTitle**

The title of the post.



> **Type**: ```[String]```

> **Required**: true

> **Position**: 1

> **PipelineInput**:true (ByPropertyName)



---
#### **PostBody**

The body of the post.



> **Type**: ```[String]```

> **Required**: true

> **Position**: 2

> **PipelineInput**:true (ByPropertyName)



---
#### **PostCreationTime**

The time the post was created.



> **Type**: ```[DateTime]```

> **Required**: true

> **Position**: 3

> **PipelineInput**:true (ByPropertyName)



---
#### **PostAuthor**

The author of the post



> **Type**: ```[String]```

> **Required**: false

> **Position**: 4

> **PipelineInput**:true (ByPropertyName)



---
#### **PostTag**

One or more tags used for the post



> **Type**: ```[String[]]```

> **Required**: false

> **Position**: 5

> **PipelineInput**:true (ByPropertyName)



---
#### **PostLayout**

The layout used for a post.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 6

> **PipelineInput**:true (ByPropertyName)



---
#### **SourceUrl**

The source URL.  If provided, this will be included in front matter.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 7

> **PipelineInput**:true (ByPropertyName)



---
#### **OutputPath**

The output path.  If not provided, will output to _posts in the current directory.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 8

> **PipelineInput**:false



---
### Syntax
```PowerShell
Publish-GitPubJekyll [-PostTitle] <String> [-PostBody] <String> [-PostCreationTime] <DateTime> [[-PostAuthor] <String>] [[-PostTag] <String[]>] [[-PostLayout] <String>] [[-SourceUrl] <String>] [[-OutputPath] <String>] [<CommonParameters>]
```
---


