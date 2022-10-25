function Publish-GitPubJekyll {
    <#
    .SYNOPSIS
        Publishes content as Jekyll Posts
    .DESCRIPTION
        Publishes content as Jekyll Posts.
    .LINK
        Get-GitPub        
    .LINK
        Publish-GitPub 
    .EXAMPLE
        Get-GitPubIssue -Repository GitPub -Owner StartAutomating |
            Publish-GitPubJekyll
    #>
    [Reflection.AssemblyMetaData("GitPub.Publisher", $true)]
    param(
    # The title of the post.
    [Parameter(Mandatory,ValueFromPipelineByPropertyName)]
    [Alias('Title')]
    [string]
    $PostTitle,
    # The body of the post.
    [Parameter(Mandatory,ValueFromPipelineByPropertyName)]
    [Alias('Body')]
    [string]
    $PostBody,
    # The time the post was created.
    [Parameter(Mandatory,ValueFromPipelineByPropertyName)]
    [Alias('Created_At','CreationTime')]
    [DateTime]
    $PostCreationTime,
    # The author of the post
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $PostAuthor,
    # One or more tags used for the post
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('Tags')]
    [string[]]
    $PostTag,
    # The layout used for a post.
    [Parameter(ValueFromPipelineByPropertyName)]
    [string]
    $PostLayout,
    # The source URL.  If provided, this will be included in front matter.
    [Parameter(ValueFromPipelineByPropertyName)]
    [Alias('HTML_url')]
    [string]
    $SourceUrl,
    # If not set, will summarize all posts in a given year, month, and day.
    # This will generate a file for each unique year, year/month, day combination
    # and will give them the appropriate permalinks.
    [switch]
    $NoSummary,
    # The content used for a yearly summary
    [Alias('AnnualSummary')]
    [string]
    $YearlySummary = @'
---
permalink: /$Year/
---
{% assign currentYear = "$Year" %}
{% for post in site.posts %}  
    {% assign postYear = post.date | date: "%Y" %}
    {% assign postYearMonth = post.date | date: "[%B](%m) %Y" %}
    {% if postYear != currentYear %}
        {% continue %}
    {% endif %}
    {% if hasDisplayedYear != postYear %}
## [{{postYear}}](.)    
    {% endif %}
    {% assign hasDisplayedYear = postYear %}
    {% if hasDisplayedYearMonth != postYearMonth %}
### {{postYearMonth}}    
    {% endif %}
    {% assign hasDisplayedYearMonth = postYearMonth %} 
* [ {{ post.title }} ]( {{ post.url }} )
{% endfor %}
'@,
    [ValidateSet('md','html')]
    [Alias('YearlySummaryFormat','AnnualSummaryFormat', 'AnnualSummaryExtension')]
    [string]
    $YearlySummaryExtension = 'md',
    [Alias('MonthSummary')]
    [string]
    $MonthlySummary = @'
---
permalink: /$Year/$Month/
---
{% assign currentYearMonth = "$Year $Month" %}
{% for post in site.posts %}  
    {% assign postYear = post.date | date: "%Y" %}
    {% assign postYearMonth = post.date | date: "%B [%Y](..)" %}
    {% assign postYM = post.date | date: "%Y %m" %}
    {% if postYM != currentYearMonth %}
        {% continue %}
    {% endif %}
    {% if hasDisplayedYearMonth != postYearMonth %}
## {{postYearMonth}}    
    {% endif %}
    {% assign hasDisplayedYearMonth = postYearMonth %} 
* [ {{ post.title }} ]( {{ post.url }} )
{% endfor %}    
'@,
    [Alias('MonthlySummaryFormat', 'MonthSummaryFormat','MonthSummaryExtension')]
    [string]
    $MonthlySummaryExtension = 'md',
    [string]
    $DailySummary = @'
---
permalink: /$Year/$Month/$Day/
---
{% for post in site.posts %}  
    {% assign currentdate = post.date | date: "%Y %m %d" %}
    {% assign friendlydate = post.date | date: "[%B](..) [%d](.) [%Y](../..)" %}
    {% if currentdate != "$Year $Month $Day" %}
        {% continue %}
    {% endif %}
    {% if currentdate != date %}
## {{friendlydate}}
    {% assign date = currentdate %} 
    {% endif %}
* [ {{ post.title }} ]( {{ post.url }} )
{% endfor %}
'@,
    [Alias('DailySummaryFormat', 'DaySummaryFormat', 'DaySummaryExtension')]
    [string]
    $DailySummaryExtension = 'md',
    
    # The output path.  If not provided, will output to _posts in the current directory.
    [string]
    $OutputPath    
    )
    begin {
        if (-not $OutputPath) {
            $OutputPath = Join-Path $pwd "_posts"                        
        }
        if (-not (Test-Path $OutputPath)) {
            $null = New-Item -ItemType Directory -Path $OutputPath -Force
        }
        $MarkdownYamlHeader = [regex]::new(@'
\A\-{3,}                          # At least 3 dashes mark the start of the YAML header
(?<YAML>(?:.|\s){0,}?(?=\z|\-{3,} # And anything until at least three dashes is the content
))\-{3,}                          # Include the dashes in the match, so that the pointer is correct.
'@, 'Multiline,IgnorePatternWhitespace')
    }
    process {
        $formattedDate = $PostCreationTime.ToLocalTime().ToString("yyyy-MM-dd")
        $safeTitle = $Posttitle -replace '[\p{P}-[\.]]' -replace '\s', '-'
        $postPath = Join-Path $OutputPath "$formattedDate-$safeTitle.md"
        $yamlHeader = $MarkdownYamlHeader.Matches($Postbody)
        $PostBody = $MarkdownYamlHeader.Replace($Postbody,'')
        $frontMatter = [Ordered]@{PSTypeName='YamlHeader';title= $PostTitle -replace '-', ' '}
        
        if ($PostLayout) {
            $frontMatter['layout'] = $PostLayout
        }
        if ($PostAuthor) {
            $frontMatter['author'] = $PostAuthor
        }
        if ($SourceUrl) {
            $frontMatter['sourceURL'] = $SourceUrl
        }
        if ($PostTag) {
            if ($PostTag.Length -eq 1) {
                $frontMatter['tag'] = $PostTag[0]
            } else {
                $frontMatter['tags'] = $PostTag
            }
        }
        
        $PostBody = @(
        ([PSCustomObject]$frontMatter | Out-String -Width 1kb).Trim()        
        $PostBody) -join [Environment]::NewLine
    
        $PostBody | Set-Content -LiteralPath $postPath -Encoding utf8
        Get-Item -LiteralPath $postPath
    }
    end {
        if ($NoSummary) { return }
        $foundPosts = Get-ChildItem -Path $OutputPath -Filter "????-??-??*"
        $outputParentPath = Split-Path $OutputPath
        $summaryFiles = @{}
        foreach ($postFound in $foundPosts) {
            $postFoundDate = (@($postFound.Name -split '-',4)[0..3] -join '-') -as [DateTime]
            if (-not $postFoundDate) {
                continue                
            }
            $year  = $postFoundDate.ToString("yyyy")
            $month = $postFoundDate.ToString("MM")
            $day = $postFoundDate.ToString("dd")
            
            foreach ($summaryName in 'Yearly','Monthly','Daily') {
                $summaryContent   = $ExecutionContext.SessionState.PSVariable.Get("${summaryName}Summary").Value
                $summaryExtension = $ExecutionContext.SessionState.PSVariable.Get("${summaryName}SummaryExtension").Value.ToLower()
                $summaryFilePath  = 
                    switch ($summaryName) {
                        Yearly {
                            Join-Path $outputParentPath "$year.$SummaryExtension"
                        }
                        Monthly {
                            Join-Path $outputParentPath "$year-$month.$SummaryExtension"
                        }
                        Daily {
                            Join-Path $outputParentPath "$year-$month-$day.$SummaryExtension"
                        }
                    }
                if ($summaryFiles["$summaryFilePath"]) { continue }
                $ExecutionContext.SessionState.InvokeCommand.ExpandString($summaryContent) |
                    Set-Content $summaryFilePath -Encoding UTF8                    
                $summaryFiles["$summaryFilePath"] = Get-Item $summaryFilePath
                $summaryFiles["$summaryFilePath"]
            }
            
        }
    }
}

