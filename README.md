# Personal web blog at ego.systemdef.com

## Prerequisites
Make sure your were installed

  * [Git](https://git-scm.com/downloads)
  * [Hugo](https://github.com/gohugoio/hugo/releases/)



## Static site tool
[Hugo](https://gohugo.io)
[Github Hugo](https://github.com/gohugoio/hugo)
[Hugo quick start](https://gohugo.io/getting-started/quick-start/)



## Theme template

  * [All hugo themes](https://themes.gohugo.io)
  * [Hugo theme next](https://github.com/hugo-next/hugo-theme-next) current theme in use.
  * [Hugo theme next starter](https://github.com/hugo-next/hugo-theme-next-starter) current starter in use.
  * [Hugo theme bootstrap](https://themes.gohugo.io/themes/hugo-theme-bootstrap/)
  * [Hugo theme bootstrap github]https://github.com/razonyang/hugo-theme-bootstrap
  * [Hugo theme bootstrap skeleton](https://github.com/razonyang/hugo-theme-bootstrap-skeleton)
  * [Hugo theme bootstrap docs](https://hbs.razonyang.com/v1/en/docs/configuration/site/)


Click the green button which name call `Use this template`.
After do that click the green button which name call `Create repository from template`, then will create your site code automatic.

Remember that need use `git submodule` command to pull all things from `hugo-theme-next` at first time.

```
# First time
git submodule update --init --recursive
# Next time
git submodule update --remote --merge
```

### Update theme

```bash
./update-hugo-theme-next.sh

git add .
git commit -m "Update theme up to `cat themes/hugo-theme-next/VERSION`"
git push
```


## Local development
Just run

```bash
startup.sh
```
and visit [http://localhost:1414/](http://localhost:1414/).



## Deployment

### GitHub Pages

* [Github Pages](https://pages.github.com/)
* [Hugo hosting on github](https://gohugo.io/hosting-and-deployment/hosting-on-github/)
* Github Actions `.github/workflows/gh-pages.yml`
* Edit production config file `config/_default/params.yaml` before deploy, such as comment, analytis, share and so on.

Published to

  * [ego.github.io](https://ego.github.io)
  * [ego.systemdef.com](https://ego.systemdef.com)



## License

[MIT License](LICENSE)
