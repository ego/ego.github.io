---
title: "OpenAI, ChatGPT, DALL·E 2, create image from text prompt"
description: "How to generate image with Artificial Intelligence"
keywords: "Artificial Intelligence,engineering,OpenAI,ChatGPT,DALL·E 2,Python"
date: 2023-01-08
categories:
  - ai
  - engineering 
  - OpenAI
tags:
  - ai
  - engineering
  - ChatGPT
  - DALL·E 2
  - Python
  - Rick and Morty
  - Python
  - openai
  - pathlib
  - artificial intelligence
  - CLI API
  - ChatGPT prompts
url: post/ai/openai-chatgpt-dall-e-2.html
---

# [This post is describe how to generate image from text prompt.](/post/ai/openai-chatgpt-dall-e-2.html)

[//]: # (Fix JS error about post-comments)
<pre class="post-comments" style="display:none"></pre>
<img src="/post/ai/dall-e-2.png"/>


<!--more-->


## How to use OpenAI

1. Go to the website openai.com and create user profile. 
2. Generate new **OPENAI_API_KEY**.
3. Use public [API](https://openai.com/api/)


## DALL·E 2

[DALL·E 2](https://openai.com/dall-e-2/) is a revolutionary [artificial intelligence](https://en.wikipedia.org/wiki/Artificial_intelligence) system
that can generate realistic images and artwork based on descriptions provided in natural language.

### Install OpenAI CLI

{{< highlight sh "linenos=table" >}}
pip install openai
export OPENAI_API_KEY=my-secret
{{< / highlight >}}

### OpenAI CLI create image
{{< highlight sh "linenos=table" >}}
openai api image.create -p "Artificial Intelligence, future, cyberpunk, with hex color 33FFE9 and color pink" -n 4
{{< / highlight >}}

<img src="/post/ai/openai_api_image.create.png" alt="" width="500"/>

[Docs api image.create](https://beta.openai.com/docs/guides/images/usage)

### OpenAI Python script create image

Some fun Python code to work with Rick and Morty and OpenAI Image API.

```python
import shutil
import pathlib
import openai
import requests  # pip install requests
from PIL import Image

HOME = str(pathlib.Path.home())
openai.api_key = "MY_SECRET_KEY"

def save_image(url, name):
    r = requests.get(url, stream=True)
    if r.status_code == 200:
        with open(f'{HOME}/Downloads/rick/{name}.png', 'wb') as f:
            r.raw.decode_content = True
            shutil.copyfileobj(r.raw, f) 


image_urls = []
prompts = [
    "Rick and Morty stuck in a time loop",
    "Rick and Morty sitting on a couch, looking frustrated",
]
for prompt in prompts:
    response = openai.Image.create(
      prompt=prompt,
      n=4,
      size="1024x1024"
    )
    for data in response['data']:
        image_urls.append(data['url'])

for i, url in enumerate(image_urls):
    save_image(url, i)
```

<img src="/post/ai/rick-and-morty-0.png" width="500" alt="Rick and Morty stuck in a time loop"/>
<img src="/post/ai/rick-and-morty-1.png" width="500" alt="Rick and Morty stuck in a time loop"/>
<img src="/post/ai/rick-and-morty-2.png" width="500" alt="Rick and Morty stuck in a time loop"/>
<img src="/post/ai/rick-and-morty-3.png" width="500" alt="Rick and Morty stuck in a time loop"/>
<img src="/post/ai/rick-and-morty-4.png" width="500" alt="Rick and Morty sitting on a couch, looking frustrated"/>
<img src="/post/ai/rick-and-morty-5.png" width="500" alt="Rick and Morty sitting on a couch, looking frustrated"/>
<img src="/post/ai/rick-and-morty-6.png" width="500" alt="Rick and Morty sitting on a couch, looking frustrated"/>
<img src="/post/ai/rick-and-morty-7.png" width="500" alt="Rick and Morty sitting on a couch, looking frustrated"/>

API [`openai.Image.create_edit`](https://beta.openai.com/docs/guides/images/edits) has some limitation, so we need to compress input image. Input images:

<img src="/post/ai/image_edit.png" width="500" />
<img src="/post/ai/image_mask.png" width="500" />

```python
foo = Image.open(f"{HOME}/Downloads/rick/image_edit.png")
foo = foo.resize((1080,1080),Image.LANCZOS)
foo.save(f"{HOME}/Downloads/rick/image_edit2.png", optimize=True, quality=75)

foo1 = Image.open(f"{HOME}/Downloads/rick/image_mask.png")
foo1 = foo1.resize((1080,1080),Image.LANCZOS)
foo1.save(f"{HOME}/Downloads/rick/image_mask2.png", optimize=True, quality=75)
```

Size optimized images:

<img src="/post/ai/image_edit2.png" width="500" />
<img src="/post/ai/image_mask2.png" width="500" />

and then we can make API call

```python
image_urls2 = []
response = openai.Image.create_edit(
  image=open(f"{HOME}/Downloads/rick/image_edit2.png", "rb"),
  mask=open(f"{HOME}/Downloads/rick/image_mask2.png", "rb"),
  prompt="Rick and Morty stuck in a time loop",
  n=4,
)
for data in response['data']:
    image_urls2.append(data['url'])

for i, url in enumerate(image_urls2):
    save_image(url, i)
```

<img src="/post/ai/rick-and-morty-mask-0.png" width="500" />
<img src="/post/ai/rick-and-morty-mask-1.png" width="500" />
<img src="/post/ai/rick-and-morty-mask-2.png" width="500" />
<img src="/post/ai/rick-and-morty-mask-3.png" width="500" />

Result is not so great but if you spend some time to create good prompt,
you will get better one.

<br/>

Links

* [OpenAI cookbook](https://github.com/openai/openai-cookbook)
* [Awesome chatgpt prompts](https://github.com/f/awesome-chatgpt-prompts)

<br/>
<br/>
