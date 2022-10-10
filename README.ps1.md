
### GitPub Sources

Sources can provide content to publish.

GitPub is written so that you can write your own sources easily.

Any function that adds `[Reflection.AssemblyMetadata('GitPub.Source','true')]` will be considered a source.

GitPub ships with the following sources:

~~~PipeScript{
    $rootPath = Import-Module .\GitPub.psd1 -PassThru | Split-Path
    [PSCustomObject]@{
        Table = Get-GitPub | 
            Select-Object -ExpandProperty Sources |
            .Name .Link {
                $_.ScriptBlock.File.Substring("$rootPath".Length) -replace '^[\\/]'
            }
    }
}
~~~


### GitPub Publishers

Any function that adds `[Reflection.AssemblyMetadata('GitPub.Publisher','true')]` will be considered a publisher.

~~~PipeScript{
    $rootPath = Import-Module .\GitPub.psd1 -PassThru | Split-Path
    [PSCustomObject]@{
        Table = Get-GitPub | 
            Select-Object -ExpandProperty Publishers |
            .Name .Link {
                $_.ScriptBlock.File.Substring("$rootPath".Length) -replace '^[\\/]'
            }
    }
}
~~~