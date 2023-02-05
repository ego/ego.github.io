{{- $title := replace .Name "-" " " | title -}}
{{- $url := replace .Name " " "-" | lower | urlize | safeURL -}}
{{- $path := strings.TrimSuffix "/" .File.Dir -}}
{{- $tags := (split .Name "-") -}}
---
draft: true
title: "{{ $title }}"
keywords: "{{ replace .Name "-" "," | lower }}"
date: {{ .Date | time.Format "2006-01-02" }}
categories:
  - {{ index (split .File.Dir "/") 0 }}
tags:
{{- range $tags -}}
{{ . | urlize | printf "\n  - %s" }}
{{- end }}
url: "{{ $path }}/{{ $url }}.html"
---
[//]: # (Post ID: {{ .File.UniqueID }})
# [A note on {{ $title }}](/{{ $path }}/{{ $url }}.html)
