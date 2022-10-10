## GitPub 0.1

Introducing GitPub: Easily Automate Publishing from GitHub

See [https://gitpub.start-automating.com/2022/10/09/Introducing-GitPub.html](the first post)


GitPub provides a flexible way to publish content in a GitHub workflow.

GitPub can be extended with Sources and Publishers.

### GitPub Sources

A source is a function that provides content to post.  GitPub comes with three sources:

|Source|Function|Description|
|-|-|-|
|Gist       | Get-GitPubGist         | Turns gists into posts      |
|Issue     | Get-GitPubIssue       | Turns issues into posts    |
|Release | Get-GitPubRelease   | Turns releases into posts |

~~~PowerShell
Get-GitPub |
    Select-Object -ExpandProperty Sources
~~~

### GitPub Publishers

A publisher is a function that finalizes content and publishes it.  GitPub comes with one publisher:

|Source|Function|Description|
|-|-|-|
|Jeykll    | Publish-GitPubJeykll | Publishes content to _posts directories    |

---

