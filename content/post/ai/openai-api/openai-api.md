---
title: "OpenAI, ChatGPT, DALL·E 2 API"
description: "How to use openai Artificial Intelligence API"
keywords: "Artificial Intelligence,engineering,OpenAI,ChatGPT,DALL·E 2,Python,Bash"

date: 2023-01-11
lastmod: 2023-01-11

categories:
  - ai
  - engineering 
  - OpenAI
tags:
  - ai
  - engineering 
  - openai
  - API
  - ChatGPT
  - DALL·E 2
  - Python
  - artificial intelligence
  - ChatGPT prompts

url: post/ai/openai-api.html

---

# [This post is describe how to use openai API.](/post/ai/openai-api.html)

[//]: # (Fix JS error about post-comments)
<pre class="post-comments" style="display:none"></pre>
<img src="/post/ai/openai_api_image.create.png" width="500" />


<!--more-->


## How to use OpenAI API

[First off all read the preview post](/post/ai/openai-chatgpt-dall-e-2.html)

ChatGPT prompt

```shell
curl https://api.openai.com/v1/completions \
-H 'Content-Type: application/json' \
-H "Authorization: Bearer $OPENAI_API_KEY" \
-d '{
"model": "text-davinci-003",
"prompt": "Generate Python script for downloading from official websites and combining all logos for Android, iOS, Windows, macOS, Linux, WEB frontend and backend",
"max_tokens": 3000,
"temperature": 0
}'
```

DALL·E 2 API

```shell
openai api image.create -p "Image with Android logo, ios logo, macos logo, linux logo, windows logo at the center" -n 4
```

<br/>
<br/>
Have fun, Ego!
<br/>
<br/>
