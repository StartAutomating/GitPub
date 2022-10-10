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
        $formattedDate = $PostCreationTime.ToString("yyyy-MM-dd")
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
}

