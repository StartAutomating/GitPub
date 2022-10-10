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
            (. {
                all functions that { 
                foreach ($attr in $this.ScriptBlock.Attributes) {                    
                    if ($attr -is [Reflection.AssemblyMetaDataAttribute] -and 
                        $attr.Key -eq 'GitPub.Source') { $true; break }                    
                }
            } are GitPub.Sources
        }.Transpile())
        $publisherFunctions = 
            (. {
                all functions that {                 
                foreach ($attr in $this.ScriptBlock.Attributes) {                    
                    if ($attr -is [Reflection.AssemblyMetaDataAttribute] -and 
                        ($attr.Key -eq 'GitPub.Publish' -or 
                        $attr.Key -eq 'GitPub.Publisher')) { $true; break }                    
                }
            } are GitPub.Publishers
        }.Transpile())
        [PSCustomObject]@{
            PSTypeName = 'GitPub'
            Version    = $MyInvocation.MyCommand.Module.Version
            Sources    = $sourceFunctions
            Publishers = $publisherFunctions
        }
        
    }
}



