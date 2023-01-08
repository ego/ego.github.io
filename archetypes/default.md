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
  -

# Image source link that will use in open graph and twitter card
#imgs:
# Expand content on the home page
#expand: true
# Sticky post set-top in home page and the smaller nubmer will more forward.
#weight: 1
---

{{ .Name }}

<!--more-->
