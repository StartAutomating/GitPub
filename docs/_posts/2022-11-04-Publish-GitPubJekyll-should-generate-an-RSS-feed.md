---

title: Publish GitPubJekyll should generate an RSS feed
author: StartAutomating
sourceURL: https://github.com/StartAutomating/GitPub/issues/57
tag: How To
---
RSS should make a comeback.

It's a really simple syndication format, and it fills an important niche on the internet: opt-in notification.

If a site has an RSS feed in a public URL, and person or program can find out what's happening with that site.

[GitPub already allows you to take posts from a variety of sources](https://gitpub.start-automating.com/2022/10/10/Introducing-GitPub/), and now GitPub helps you generate an RSS feed for all of your posts.

This will happen automatically if you're using the [Recommended GitPub Workflow](https://gitpub.start-automating.com/2022/10/25/Recommended-GitPub-Workflow/).

The feed will then be found at the root of your GitHub Page, for example, here's the [RSS feed for GitPub](https://gitpub.start-automating.com/rss.xml).

### How does this work?

By default, GitHub pages publishes content with [Jekyll](https://jekyllrb.com/).  Jekyll, in turn, uses [Liquid Template Language](https://shopify.github.io/liquid/) to generate a bunch of static pages.  Liquid is quite cool and enables us to generate basically any type of text based document _including RSS_.

This [wonderful post by John Vincent](https://www.johnvincent.io/jekyll/rss-feed-with-jekyll/) shows how we can generate an RSS feed with Jekyll / Liquid, and it's pretty close to the default settings use in GitPub's [Publish-GitPubJekyll](https://gitpub.start-automating.com/Publish-GitPubJekyll/) function.

### How do I use it?

This is easier done than said.  Basically, follow the steps in created the [Recommended GitPub Workflow](https://gitpub.start-automating.com/2022/10/25/Recommended-GitPub-Workflow/) and you'll be set up in seconds.

Hope this Helps,

James
