function Get-GitPub {
    <#
    .SYNOPSIS
        Gets GitPub        
    .DESCRIPTION
        Gets GitPub.
        
        Returns the version and currently loaded Publishers and Sources.
    .EXAMPLE
        Get-GitPub
    .LINK
        Publish-GitPub
    #>
    param()
    process {
        $sourceFunctions =             
$(
# Collect all items into an input collection
$inputCollection =$(
$executionContext.SessionState.InvokeCommand.GetCommands('*','Function',$true)
)
# 'unroll' the collection by iterating over it once.
$filteredCollection = $inputCollection =
    @(foreach ($in in $inputCollection) { $in })
# Since filtering conditions have been passed, we must filter item-by-item
$filteredCollection = foreach ($item in $inputCollection) {
    # we set $this, $psItem, and $_ for ease-of-use.
    $this = $_ = $psItem = $item
    
if (-not $( 
    foreach ($attr in $this.ScriptBlock.Attributes) {                    
        if ($attr -is [Reflection.AssemblyMetaDataAttribute] -and  $attr.Key -eq 'GitPub.Source') { $true; break }
    } 
)) { continue } 
    $item
}
# Walk over each item in the filtered collection
foreach ($item in $filteredCollection) {
    # we set $this, $psItem, and $_ for ease-of-use.
    $this = $_ = $psItem = $item
if ($item.value -and $item.value.pstypenames.insert) {
    if ($item.value.pstypenames -notcontains 'GitPub.Sources') {
        $item.value.pstypenames.insert(0, 'GitPub.Sources')
    }
}
elseif ($item.pstypenames.insert -and $item.pstypenames -notcontains 'GitPub.Sources') {
    $item.pstypenames.insert(0, 'GitPub.Sources')
}
            
$item
}
)
    
        $publisherFunctions = 
$(
# Collect all items into an input collection
$inputCollection =$(
$executionContext.SessionState.InvokeCommand.GetCommands('*','Function',$true)
)
# 'unroll' the collection by iterating over it once.
$filteredCollection = $inputCollection =
    @(foreach ($in in $inputCollection) { $in })
# Since filtering conditions have been passed, we must filter item-by-item
$filteredCollection = foreach ($item in $inputCollection) {
    # we set $this, $psItem, and $_ for ease-of-use.
    $this = $_ = $psItem = $item
    
if (-not $(                 
    foreach ($attr in $this.ScriptBlock.Attributes) {                    
        if ($attr -is [Reflection.AssemblyMetaDataAttribute] -and 
            ($attr.Key -eq 'GitPub.Publisher')) { $true; break }
    }
)) { continue } 
    $item
}
# Walk over each item in the filtered collection
foreach ($item in $filteredCollection) {
    # we set $this, $psItem, and $_ for ease-of-use.
    $this = $_ = $psItem = $item
if ($item.value -and $item.value.pstypenames.insert) {
    if ($item.value.pstypenames -notcontains 'GitPub.Publishers') {
        $item.value.pstypenames.insert(0, 'GitPub.Publishers')
    }
}
elseif ($item.pstypenames.insert -and $item.pstypenames -notcontains 'GitPub.Publishers') {
    $item.pstypenames.insert(0, 'GitPub.Publishers')
}
            
$item
}
)
        [PSCustomObject]@{
            PSTypeName = 'GitPub'
            Version    = $MyInvocation.MyCommand.Module.Version
            Sources    = $sourceFunctions
            Publishers = $publisherFunctions
        }
        
    }
}



