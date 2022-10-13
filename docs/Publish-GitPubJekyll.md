
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
#### **NoSummary**

If not set, will summarize all posts in a given year, month, and day.
This will generate a file for each unique year, year/month, day combination
and will give them the appropriate permalinks.



> **Type**: ```[Switch]```

> **Required**: false

> **Position**: named

> **PipelineInput**:false



---
#### **YearlySummary**

The content used for a yearly summary



> **Type**: ```[String]```

> **Required**: false

> **Position**: 8

> **PipelineInput**:false



---
#### **YearlySummaryExtension**

Valid Values:

* md
* html



> **Type**: ```[String]```

> **Required**: false

> **Position**: 9

> **PipelineInput**:false



---
#### **MonthlySummary**

> **Type**: ```[String]```

> **Required**: false

> **Position**: 10

> **PipelineInput**:false



---
#### **MonthlySummaryExtension**

> **Type**: ```[String]```

> **Required**: false

> **Position**: 11

> **PipelineInput**:false



---
#### **DailySummary**

> **Type**: ```[String]```

> **Required**: false

> **Position**: 12

> **PipelineInput**:false



---
#### **DailySummaryExtension**

> **Type**: ```[String]```

> **Required**: false

> **Position**: 13

> **PipelineInput**:false



---
#### **OutputPath**

The output path.  If not provided, will output to _posts in the current directory.



> **Type**: ```[String]```

> **Required**: false

> **Position**: 14

> **PipelineInput**:false



---
### Syntax
```PowerShell
Publish-GitPubJekyll [-PostTitle] <String> [-PostBody] <String> [-PostCreationTime] <DateTime> [[-PostAuthor] <String>] [[-PostTag] <String[]>] [[-PostLayout] <String>] [[-SourceUrl] <String>] [-NoSummary] [[-YearlySummary] <String>] [[-YearlySummaryExtension] <String>] [[-MonthlySummary] <String>] [[-MonthlySummaryExtension] <String>] [[-DailySummary] <String>] [[-DailySummaryExtension] <String>] [[-OutputPath] <String>] [<CommonParameters>]
```
---


