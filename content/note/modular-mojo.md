---
title: "Modular Mojo"
keywords: "modular,mojo"
date: 2023-05-08

categories:
  - note
tags:
  - modular
  - mojo
url: "note/modular-mojo.html"
---
[//]: # (Post ID: 4e016cd3e05383b9082161d192967b81)

# [A note on Modular Mojo](/note/modular-mojo.html)


(Modular AI Mojo)[https://www.modular.com/mojo]


Mojo 🔥 — a new programming language for all AI developers.

Mojo combines the usability of Python with the performance of C, unlocking unparalleled programmability of AI hardware and extensibility of AI models.

[Why Mojo?](https://docs.modular.com/mojo/why-mojo.html)


"Mojo may be the biggest programming language advance in decades."

"Language that’s as elegant as Python and as fast as expert-written C, allows me to use one language to write everything from the application server, to the model architecture and the installer too, and lets me debug and profile my code directly in the language in which I wrote it."


* [Mojo programming manual](https://docs.modular.com/mojo/programming-manual.html)
* [Mojo roadmap](https://docs.modular.com/mojo/roadmap.html)
* [ModularML GitHub](https://github.com/modularml/mojo)
* [Mojo launch](https://www.fast.ai/posts/2023-05-03-mojo-launch.html)
* [jax](https://jax.readthedocs.io/en/latest/)
* [Chris Lattner](https://en.wikipedia.org/wiki/Chris_Lattner)
* [Modular](https://www.modular.com)


The taste of Mojo:

```Python
$ cat hello.🔥
def main():
    print("hello world")
    for x in range(9, 0, -3):
        print(x)
$ mojo hello.🔥
hello world
9
6
3
$
```

```Python
def your_function(a, b):
    let c = a
    # Uncomment to see an error:
    # c = b  # error: c is immutable

    if c != b:
        let d = b
        print(d)

your_function(2, 3)
```

```Python
def sort(v: ArraySlice[Int]):
  for i in range(len(v)):
    for j in range(len(v) - i - 1):
      if v[j] > v[j + 1]:
        swap(v[j], v[j + 1])
```


```Python
struct MyPair:
  var first: Int
  var second: F32

  def __init__(self, first: Int, second: F32):
    self.first = first
    self.second = second
```


```Python
struct HeapArray:
    var data: Pointer[Int]
    var size: Int
    var cap: Int

    fn __init__(self&):
        self.cap = 16
        self.size = 0
        self.data = Pointer[Int].alloc(self.cap)

    fn __init__(self&, size: Int, val: Int):
        self.cap = size * 2
        self.size = size
        self.data = Pointer[Int].alloc(self.cap)
        for i in range(self.size):
            self.data.store(i, val)

    fn __copyinit__(self&, other: Self):
        self.cap = other.cap
        self.size = other.size
        self.data = Pointer[Int].alloc(self.cap)
        for i in range(self.size):
            self.data.store(i, other.data.load(i))

    fn __del__(owned self):
        self.data.free()

    fn dump(self):
        print_no_newline("[")
        for i in range(self.size):
            if i > 0:
                print_no_newline(", ")
            print_no_newline(self.data.load(i))
        print("]")
```


Waiting for the first public compiler version from Chris Lattner and Modular Mojo team.
