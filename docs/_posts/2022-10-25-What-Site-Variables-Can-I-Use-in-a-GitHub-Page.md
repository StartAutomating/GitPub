---

title: What Site Variables Can I Use in a GitHub Page
author: StartAutomating
sourceURL: https://github.com/StartAutomating/GitPub/issues/49
tag: question
---
I'm trying to build the best GitHub pages I can and would love to be able to offer more helpful links to the repository than just "Improve this Page".

I wanted to understand:

 1. How does "Improve This Page" show up?
 2. What other information about my repo / project is there?

Figuring this out was really illuminating!

It took some digging in my GitHub Jobs.

When "Pages Deploy and Publish" runs, I see something like this
[![GitHub Action Output][1]][1]

The theme GitHub Pages is using, if I don't specify one, is [Primer][2]

Primer's default layout is where we get the "Improve this Page" link.  Specifically, Improve this Page is _referenced_ in [_layouts/default.html, on line 22](https://github.com/pages-themes/primer/blob/master/_layouts/default.html#L22).

Notice I said _referenced_.  Primer doesn't define `github_edit_link` (the Liquid tag used to make the link).

That led me a bit further down the rabbit hole to find the dependency:

[![Another Clue][3]][3]

Once that veil had been pierced, I took a look at [jekyll-github-metadata][4]

This is where I found the motherload of information I had been looking for!

[This Markdown Document Lists All Of The Site-Wide Variables][5]

I've added some descriptions to each:

|Site Variable| Description|
|-|-|
|hostname| Always `github.com`|,
|pages_hostname|Always `github.io`|
|api_url| Always `https://api.github.com`|
|help_url| `https://help.github.com`|,
|environment|Always `dotcom`|
|pages_env  |Always `dotcom`|,
|public_repositories| The Publisher's public repositories|
|organization_members| The members of the Publisher's Organization |
|build_revision| The build revision (the commithash) |
|project_title| The Name of the Repository|
|project_tagline| The repository description |
|owner_name| The Owner of the repository|
|owner_url | The Owner's public GitHub URL|
|owner_gravatar_url|The Owner's GitHub Avatar!|
|repository_url| The full URL for the repository |
|repository_nwo| The root-relative URL of the repository |
|repository_name| The name of the repository |
|zip_url| A URL to the zipped contents of the repository|: 
|tar_url| A URL to the tarball contents of the repository|
|clone_url| The URL to the git repo|
|releases_url| The URL for the Repository's releases|
|issues_url| The URL for the Repository's issues|
|wiki_url| The URL for the Repository's wikis|
|language| Unsure, but I'd guess it's the language ;-) |
|is_user_page| Unsure, but I'd guess this indicates if this is a page for a user|
|is_project_page| Unsure, but I'd guess this indicates if this was a project |
|show_downloads| If downloads should be displayed |
|url| The public URL or CNAME|
|baseurl|The root-relative base URL (most likely `/`)|
|contributors| Contributors to the Project |
|releases|Releases of the project|
|latest_release| The latest GitHub Release Object |
|private| If the repository is private or not|
|archived| If the repository has been archived |
|disabled| If the repository was disabled |

This content has also been put on [StackOverflow for posterity][6].

Hopefully this content saves the next person the time and effort to track this down.


  [1]: https://i.stack.imgur.com/GNvJX.png
  [2]: https://github.com/pages-themes/primer
  [3]: https://i.stack.imgur.com/Yxwln.png
  [4]: https://github.com/jekyll/github-metadata/
  [5]: https://github.com/jekyll/github-metadata/blob/main/docs/site.github.md
  [6]: https://stackoverflow.com/questions/74188444/what-site-variables-can-i-use-in-a-github-page/
