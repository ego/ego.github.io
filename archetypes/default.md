{{- $title := replace .Name "-" " " | title -}}
{{- $url := replace .Name " " "-" | lower | urlize | safeURL -}}
{{- $path := strings.TrimSuffix "/" .File.Dir -}}
{{- $tags := (split (index (split .File.Dir "/") 2) "-") -}}
---
draft: true
title: "{{ $title }}"
keywords: "{{ replace .Name "-" "," | lower }}"
date: {{ .Date | time.Format "2006-01-02" }}
categories:
  - {{ index (split .File.Dir "/") 0 }}
  - {{ index (split .File.Dir "/") 1 }}
tags:
{{- range $tags -}}
{{ . | urlize | printf "\n  - %s" }}
{{- end }}
url: "{{ $path }}/{{ $url }}.html"
---
[//]: # (Post ID: {{ .File.UniqueID }})
# [In this post we will exploring the essential overview and details of the {{ $title }}](/{{ $path }}/{{ $url }}.html)

[//]: # (Fix JS error about post-comments)
<pre class="post-comments" style="display:none"></pre>
<img src="/{{ $path }}/assets/preview.png" width="500"  alt="{{ $title }}"/>

<!--more-->

## {{ $title }}


### Getting Started
Post summary, motivation, what?


## Problem definition and background
Why?


## Know-how 

### Research and development

### Solution and Ideas


## Conclusions


## See also

* []()


## References

* []()


## Tools and artifacts

```shell
# Auto generate keywords and tags for post.
./tools/post-keywords-tags.py

# Publish post.
./scripts/release.sh
```

<br/>
Have fun, Ego!
<br/>
<br/>
