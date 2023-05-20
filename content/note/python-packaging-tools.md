---
title: "Python Packaging Tools"
keywords: "python,packaging,tools"
date: 2023-05-19

categories:
  - note
tags:
  - python
  - packaging
  - tools
url: "note/python-packaging-tools.html"
---
[//]: # (Post ID: 650930045f2a4cc3874083b72bf75b90)

# [A note on Python Packaging Tools](/note/python-packaging-tools.html)

You can start from here

* [Python Packaging Tool recommendations](https://packaging.python.org/en/latest/guides/tool-recommendations/)
* [Packaging Python Projects](https://packaging.python.org/en/latest/tutorials/packaging-projects/)
* [The Packaging Flow](https://packaging.python.org/en/latest/flow/)
* [Key tools](https://packaging.python.org/en/latest/key_projects/)

Bootstrap process of creating new Python Package

* [poetry](https://github.com/python-poetry/poetry)
* [pip-tools](https://github.com/jazzband/pip-tools)
* [hatch](https://github.com/pypa/hatch)
  * [hatch intro](https://hatch.pypa.io/latest/intro/)
* [pdm](https://github.com/pdm-project/pdm/)
  * [pdm into](https://pdm.fming.dev/latest/)
* [flit](https://flit.pypa.io/en/latest/)
* [pyscaffold](https://github.com/pyscaffold/pyscaffold)

**poetry** nice and modern.
**pip-tools** I had cooked it before, good but require a lot of actions.
**hatch** and **pdm** did not suit me, I tried but no results.

Lets discovery **pyscaffold**

```shell
python3 -m venv .env
source .env/bin/activate

pip install --upgrade pyscaffold[all]
putup -i new_project

git tag v0.1.0
tox -e docs
tox -e build
tox -e publish -- --repository pypi
```

Awesome! Python package is published =)

Very nice but a little bit outdated.
If add modern stack, it will be the best bootstrapping tool for Python ecosystem!

Hint: give you an idea for tooling development.
