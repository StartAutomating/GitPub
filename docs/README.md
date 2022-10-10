
### GitPub Sources

Sources can provide content to publish.

GitPub is written so that you can write your own sources easily.

Any function that adds `[Reflection.AssemblyMetadata('GitPub.Source','true')]` will be considered a source.

GitPub ships with the following sources:


|Name                                      |
|------------------------------------------|
|[Get-GitPubGist](Get-GitPubGist.ps1)      |
|[Get-GitPubIssue](Get-GitPubIssue.ps1)    |
|[Get-GitPubRelease](Get-GitPubRelease.ps1)|




### GitPub Publishers

Any function that adds `[Reflection.AssemblyMetadata('GitPub.Publisher','true')]` will be considered a publisher.


|Name                                            |
|------------------------------------------------|
|[Publish-GitPubJekyll](Publish-GitPubJekyll.ps1)|



