# Personal web blog at ego.systemdef.com

## Prerequisites
Make sure your were installed

  * [Git](https://git-scm.com/downloads)
  * [Hugo](https://github.com/gohugoio/hugo/releases/)



## Static site tool
[Hugo](https://gohugo.io)
[Github Hugo](https://github.com/gohugoio/hugo)
[Hugo quick start](https://gohugo.io/getting-started/quick-start/)



## Theme templates

  * [All hugo themes](https://themes.gohugo.io)
  * [Hugo theme next](https://github.com/hugo-next/hugo-theme-next) current theme in use.
  * [Hugo theme next starter](https://github.com/hugo-next/hugo-theme-next-starter) current starter in use.
  * [Hugo theme bootstrap](https://themes.gohugo.io/themes/hugo-theme-bootstrap/)
  * [Hugo theme bootstrap github]https://github.com/razonyang/hugo-theme-bootstrap
  * [Hugo theme bootstrap skeleton](https://github.com/razonyang/hugo-theme-bootstrap-skeleton)
  * [Hugo theme bootstrap docs](https://hbs.razonyang.com/v1/en/docs/configuration/site/)


### Current Theme

  [Upgraded Ego Hugo theme Next](https://github.com/ego/hugo-theme-next)

Click the green button which name call `Use this template`.
After do that click the green button which name call `Create repository from template`, then will create your site code automatic.

Remember that need use `git submodule` command to pull all things from `hugo-theme-next` at first time.

```
# First time
git submodule add https://github.com/ego/hugo-theme-next.git themes/hugo-theme-next
git submodule update --init --recursive
# Next time
git submodule update --remote --merge
```


### Update Theme

```bash
./scripts/update-ego-hugo-theme-next.sh
git add .
git commit -m "Update theme up to `cat themes/hugo-theme-next/VERSION`"
git push
```


### Update forked customized Theme

Update [ego/hugo-theme-next](https://github.com/ego/hugo-theme-next) from [upstream/hugo-theme-next](https://github.com/hugo-next/hugo-theme-next)

Main branch is `main`

```shell
git remote add upstream https://github.com/hugo-next/hugo-theme-next.git
git fetch --all
git checkout develop/ego
git merge upstream/main
git push origin develop/ego
```


## Local development
Just run

```bash
./scripts/hugo-run-server.sh
```
and visit [http://localhost:1414/](http://localhost:1414/).


## New Post
It is recommended to use the following Hugo command to quickly create a new post

```bash
# Note
hugo new note/{full-url}.md

# Template
hugo new {root-category}/{second-category}/{main-tags}/{full-url}.md --debug --verbose

# Engineering
hugo new engineering/git/code-stats-metrics/code-stats-metrics-analytics-and-tools.md \
  && mkdir -p engineering/git/code-stats-metrics/assets

# Projects
hugo new projects/{main-category}/{main-tags}/{full-url}.md

# AI
hugo new ai/{main-category}/{main-tags}/{full-url}.md

# Open source
hugo new open-source/{main-category}/{main-tags}/{full-url}.md

# Courses
hugo new courses/{main-category}/{main-tags}/{full-url}.md

# Books
hugo new books/{main-category}/{main-tags}/{full-url}.md
```
> **Note**
> By defalut `hugo new` command will create new post under `content` root directory, so in here `posts` were you custom subfolder in `content` directory.

Archetypes are content template files.
[Archetypes](https://gohugo.io/content-management/archetypes/)

All front matter parameter's description in post as below:


```yml
---
title: "{{ replace .Name "-" " " | title }}"
description: "{{ .Name }}"
keywords: "{{replace .Name "-" ","}}"
date: {{ .Date }}
lastmod: {{ .Date }}
categories:
  -
tags:
  -
# Post's origin author name
author:
# Post's origin link URL
link:
# Image source link that will use in open graph and twitter card
imgs:
# Expand content on the home page
expand: true
# It's means that will redirecting to external links
extlink:
# Disabled comment plugins in this post
comment:
  enable: false
# Disable table of content int this post
# Notice: By default will automatic build table of content
# with h2-h4 title in post and without other settings
toc: false
# Absolute link for visit
url: "{{ lower .Name }}.html"
# Sticky post set-top in home page and the smaller nubmer will more forward.
weight: 1
# Support Math Formulas render, options: mathjax, katex
math: mathjax
# Enable chart render, such as: flow, sequence, classes etc
mermaid: true

# Custom page params:
js:
  - "1.js"
---
```


## Deployment

### GitHub Pages

* [Github Pages](https://pages.github.com/)
* [Hugo hosting on github](https://gohugo.io/hosting-and-deployment/hosting-on-github/)
* Github Actions `.github/workflows/gh-pages.yml`
* Edit production config file `config/_default/params.yaml` before deploy, such as comment, analytis, share and so on.

Published to

  * [ego.github.io](https://ego.github.io)
  * [ego.systemdef.com](https://ego.systemdef.com)


Make the release.

```bash
./scripts/release.sh
```

## Tools

### Custom shortcode templates

- [shortcode templates](https://gohugo.io/templates/shortcode-templates/)
- [syntax highlighting](https://gohugo.io/content-management/syntax-highlighting/)

## Code from file

```markdown
{{< read_code src="post/engineering/bit-computing-compilers-and-hardware/logic_gate_full_adder_8_bit.py" hl_lines="4-8" >}}
```

### PyScript

```markdown
{{< read_code src="/note/test.py" >}}

{{< expand_block "<b style='color: #5bd3eb;'>REPL test.py</b>" >}}

{{< iframe_srcdoc >}}
{{< pyscript/js >}}

{{< pyscript/py-repl >}}
{{< read_file src="/note/test.py" >}}
{{< /pyscript/py-repl >}}

{{< /iframe_srcdoc >}}
{{< /read_code >}}

{{< /expand_block >}}
```

[iframe](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe)


### Python venv

```bash
python3 -m venv .env
source .env/bin/activate
pip install -r requirements.txt
```

Auto generate  keywords and tags for post.

```bash
./tools/post-keywords-tags.py
```


## GoHugo documentation

  * [Page variables](https://gohugo.io/variables/page/)
    Usefully for post template `archetypes/default.md`


## License

[MIT License](LICENSE)
