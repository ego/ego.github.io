---
title: "How to fix GitHub repository language"
description: "How to fix GitHub, repository language."
keywords: "github,repository,programming languages"
date: 2023-01-08

categories:
  - engineering
  - GitHub
tags:
  - GitHub
  - git-settings
  - linguist
url: post/engineering/github-repository-language.html
---

# [How to fix GitHub repository code language if you have a question :smile:](/post/engineering/github-repository-language.html)

<img src="/post/engineering/GitHub_repository_code_language.png" alt="" width="500"/>

<!--more-->


Create file in the root directory of git repository `.gitattributes`

{{< highlight txt "linenos=table,hl_lines=1,linenostart=1" >}}
themes/* linguist-vendored
{{< / highlight >}}

GitHub use Linguist project to detect blob languages.

Links
* [File gitattributes](https://git-scm.com/docs/gitattributes)
* [Read more about Linguist overrides](https://github.com/github/linguist/blob/master/docs/overrides.md)
* [Changing the Repo Language Shown](https://dev.to/katkelly/changing-your-repo-s-language-in-github-5gjo)
