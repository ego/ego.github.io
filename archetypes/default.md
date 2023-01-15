---
title: "{{ replace .Name "-" " " | title }}"
description: "{{ .Name }}"
keywords: "{{replace .Name "-" ","}}"

date: {{ .Date | time.Format "2006-01-02" }}
lastmod: {{ .Date | time.Format "2006-01-02" }}

categories:
  - {{ index (split .File.Dir "/") 1 }}
tags:
  - {{ index (split .File.Dir "/") 1 }}

url: "{{ strings.TrimSuffix "/" .File.Dir }}.html"

---

# [This post is describe ](/{{ strings.TrimSuffix "/" .File.Dir }}.html)
[//]: # (Post ID: {{ .File.UniqueID }})

[//]: # (Fix JS error about post-comments)
<pre class="post-comments" style="display:none"></pre>
<img src="/{{ strings.TrimSuffix "/" .File.Dir }}.png" width="500" />

<!--more-->

Short description here. [Previous posts](/post/{category}/post-name.html)

## {{ replace .Name "-" " " | title }}


## Next


<br/>

**Footnotes**

Some images are generated with OpenAI DALL·E 2
```shell
openai api image.create -p "Inside the future space shuttle, macbook, monitor. Pink and blue and light green colors" -n 4
```

<br/>
Have fun, Ego!
<br/>
<br/>
