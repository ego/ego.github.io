---
title: "From Python Django to Clojure, authentication and hashers algorithm"
description: "This blog post describes how to rewrite whole authentication system from one language to another."
keywords: "Java,Clojure,Python,Django,AES,ECB,PKCS5Padding,Cryptography"
date: 2023-01-10
categories:
  - projects
  - Python
  - Clojure
  - Java
  - Django
  - Cryptography
  - AES
  - framework
tags:
  - Python
  - Clojure
  - Java 
  - Django
  - Cryptography
  - AES
  - authentication
  - session
  - cookies
  - framework
  - encrypt
  - decrypt
  - Cipher
url: post/projects/clojure-django.html
---

# [Project AES](/post/projects/clojure-django.html) #

Repository: https://github.com/ego/AES

This id old story, about that how we rewrite whole system from Python [Django](https://www.djangoproject.com) stack to [Clojure](https://clojure.org)
and do not break authentication. Users login easily to the new system with old cookies with no problems :smile:. 

[//]: # (Fix JS error about post-comments)
<pre class="post-comments" style="display:none"></pre>
<img src="/post/projects/django.png" alt="" width="500"/>

<!--more-->

## Motivation

Django has its own [authentication system](https://docs.djangoproject.com/en/4.1/topics/auth/customizing/#writing-an-authentication-backend) and cryptography for that.
Clojure web frameworks also has own.
Question, how to make users happy during new login?

## Copy authentication system algorithm :smile:
But in a new language in a new system.

## The algorithm
In that smooth time for Django it was `AES/ECB/PKCS5Padding 128/256 bits`
So we just need `Python/Clojure` `encrypt/decrypt` code. 

Python version\
File: [aes_ecb_pkcs5padding_128_256.py](https://github.com/ego/AES/blob/master/aes_ecb_pkcs5padding_128_256.py)

```python
#####################################################################
# Python encrypt/decrypt code for AES/ECB/PKCS5Padding 128/256 bits #
#                                                                   #
# 128bits == 16Bytes == 16 Chars.                                   #
# 256bits == 32Bytes == 32 Chars.                                   #
#####################################################################


import base64
from Crypto.Cipher import AES


CRYPT_KEY = '12345678912345678912345678912345'
_AES_CIPHER = AES.new(CRYPT_KEY)
_BLOCK_SIZE = _AES_CIPHER.block_size


def pad(s):
    len_pad = _BLOCK_SIZE - (len(s) % _BLOCK_SIZE)
    return s + (len_pad * chr(len_pad))


def unpad(s):
    return s[:-ord(s[-1])]


def encrypt(s):
    if not isinstance(s, basestring) or not s:
        return s
    pad_text = pad(s.encode('utf-8'))
    crypt_text = _AES_CIPHER.encrypt(pad_text)
    return base64.b64encode(crypt_text)


def decrypt(s):
    if not isinstance(s, basestring) or not s:
        return s
    try:
        crypt_text = base64.b64decode(s)
        pad_text = _AES_CIPHER.decrypt(crypt_text)
        text = unpad(pad_text).decode('utf-8')
    except (ValueError, TypeError, UnicodeEncodeError, UnicodeEncodeError):
        return s
    return text
```

Clojure version\
File: [aes_ecb_pkcs5padding_128_256.clj](https://github.com/ego/AES/blob/master/aes_ecb_pkcs5padding_128_256.clj)

```clojure
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python/Clojure encrypt/decrypt code for AES/ECB/PKCS5Padding 128/256 bits          ;;
;;                                                                                    ;;
;; Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy           ;;
;; http://www.oracle.com/technetwork/java/javase/downloads/jce-7-download-432124.html ;;
;;                                                                                    ;;
;; Copy local_policy.jar and US_export_policy.jar to the $JAVA_HOME/jre/lib/security  ;;
;; (Note: these jars will be already there so you have to overwrite them)             ;;
;;                                                                                    ;;
;; Ubuntu:                                                                            ;;
;; 1. Download and unzip                                                              ;;
;; 2. sudo cp -r UnlimitedJCEPolicy/* /usr/lib/jvm/java-8-oracle/jre/lib/security     ;;
;;                                                                                    ;;
;; AES/ECB/PKCS5Padding 128/256 bits                                                  ;;
;;                                                                                    ;;
;; 128bits == 16Bytes == 16 Chars.                                                    ;;
;; 256bits == 32Bytes == 32 Chars.                                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(import (java.security Key)
        (javax.crypto Cipher)
        (javax.crypto.spec SecretKeySpec)
        (org.apache.commons.codec.binary Base64))

(defn- to-bytes [s]
  (cond
    (string? s)     (.getBytes s "UTF-8")
    (sequential? s) (into-array Byte/TYPE (.getBytes s "UTF-8"))
    :else s))

(defn debase64 [s] (Base64/decodeBase64 (to-bytes s)))
(defn base64 [s] (Base64/encodeBase64String s))

(defn- ^Key secret-spec
  [^String s]
  (SecretKeySpec. (to-bytes s) "AES"))

(defn ^bytes encrypt
  [^String s ^String key]
  (let [cipher (doto (Cipher/getInstance "AES/ECB/PKCS5Padding")
                 (.init Cipher/ENCRYPT_MODE (secret-spec key)))]
    (.doFinal cipher (to-bytes s))))

(defn ^String decrypt
  [^bytes buf ^String key]
  (let [cipher (doto (Cipher/getInstance "AES/ECB/PKCS5Padding")
                 (.init Cipher/DECRYPT_MODE (secret-spec key)))]
    (String. (.doFinal cipher buf) "UTF-8")))

(defn encrypt->str [s key] (-> (encrypt s key) base64))
(defn decrypt->str [s key] (-> (decrypt (debase64 s) key)))
```


> Have fun!

<br/>
