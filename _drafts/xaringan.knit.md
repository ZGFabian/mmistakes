---
title: "Xaringan in a Jekyll site"
subtitle: "with (uhmm...) xaringan (with a theme)"
author: "zgfabian"
date: "2021-04-24"
categories: [web, R]
tags: [Jekyll, xaringan, Rstat]
output:
  xaringan::moon_reader:
    seal: false
    css: [default, rutgers, rutgers-fonts]
    lib_dir: ../static/xaringan-prez/libs
    chakra: ../../assets/js/remark-latest.min.js
    includes:
      in_header: ../_includes/head/favicon-xaringan.html
    nature:
      highlightStyle: zenburn
      countIncrementalSlides: false
---

class: center, middle, inverse

.left-column[![naruto](../../assets/img/etc/naruto-xaringan.jpg)]
.right-column[
# Xaringan in a Jekyll site

## .center[Made with Xaringan Rstat package]
<br><br><br><br><br>


.right[Zoltán Fábián]
.right[2021-04-24]
]
---
class: inverse

# Basics

## What is Jekyll?

[Jekyll](http://jekyllrb.com) is a static website generator. I use it for my personal website at [zgfabian.github.com](http://zgfabian.github.io). 

<img src="../../assets/img/etc/jekyll-logo.jpg" alt="xaringan-logo" style="float:right;height:100px;"></br>
--

## What is Xaringan?
<img src="../../assets/img/etc/xaringan-logo.png" alt="xaringan-logo" style="float:right;height:100px;">
The `xaringan` R package is an R Markdown extension based on the JavaScript library [remark.js](https://remarkjs.com) to generate HTML5 presentations of a different style. It's been developed by [Yihui Xie](https://yihui.org/en/).


---
class: middle, inverse


>*The name “xaringan” came from [Sharingan](http://naruto.wikia.com/wiki/Sharingan) in the Japanese manga and anime “Naruto.” The word was deliberately chosen to be difficult to pronounce for most people (unless you have watched the anime), because its author (me) loved the style very much, and was concerned that it would become too popular. The concern was somewhat naive, because the style is actually very customizable, and users started to contribute more themes to the package later.* - [Yihui Xie](https://bookdown.org/yihui/rmarkdown/xaringan.html), the author of Xaringan (and many more) R package
<br><br><br>

>*"The Sharingan is an ability that allows a ninja to copy, by mere sight, their opponents' techniques while gaining incredible reflexes and perceptive abilities."* - [Urban Dictionary](https://www.urbandictionary.com/define.php?term=The%20Sharingan)

---
# Xaringan overview


```r
# install
install.packages("xaringan")
# list available theme (+font) names
names(xaringan:::list_css())
```

## Some features of Xaringan

- Based on Rmarkdown and require some html, css and optimally js knowledge
- Built-in css themes and theme customisation made easy with `xaringanthemer` package
- online and offline presentations
- pdf output with other packages (e.g. `pagedown`) or system tools ([See details here.](https://github.com/yihui/xaringan/wiki/Export-Slides-to-PDF))
- slide separator: `---`
- incremental reveal separator: `--`
- presenter notes separator: `???`

---
# Header
- to create custom xaringan themes [`xaringanthemer`](https://cran.r-project.org/web/packages/xaringanthemer/vignettes/xaringanthemer.html) package is at your hand
- [`xaringanExtra` package](https://pkg.garrickadenbuie.com/xaringanExtra/) for advanced effects and layouts
- for more output formats, use [`xaringanBuilder`](https://github.com/jhelvy/xaringanBuilder). It can produce even gifs that everybody love (Not really.)

---
# Configuration in Jekyll

Xaringan presentations are [Rmarkdown]() files. I configured Jekyll to exclude them from rendering. Cf. Jekyll's `_config.yml`:

```
exclude:
  - "*.Rmd" 
```

# File locations

- `remark.js` is served from a project folder. (In my case on [`minimal-mistake` Jekyll theme](https://github.com/mmistakes/minimal-mistakes) it is `./assets/js/` folder)

```
output:
  xaringan::moon_reader:
    chakra: ../assets/js/remark-latest.min.js
```
Note: Mind your `remark.js` version. Xariangan provides a dedicated function, (`summon_remark`) to download the proper version of the `remark.js` script to your local disk, so you can render slides offline. You need to change the `chakra` argument of `moon_reader()` accordingly. 

---
Remember that in yaml front matter every paths are relative. More importantly `lib_dir:` relative to `rmarkdown::render`'s `input:` file's directory, while `chakra:` is relative to `output_dir`. 
- header customization for proper favicon display

`Xaringan Rmd yaml front matter`
 
```
output:
  xaringan::moon_reader:
    includes:
      in_header: ../_includes/head/favicon-xaringan.html
```

---
class: middle, center

# Doom Emacs + ESS + Surf preview

Doom Emacs + Emacs Speaks Statistics (ESS)) and Xaringan preview in Surf browser as an IDE

```
![doom ess screenshot](../../assets/img/etc/emacs-xaringan.png)
```

---
# Further resources

- [remarkjs.com - website](https://remarkjs.com/)

- xaringan in the Rmarkdown book - https://bookdown.org/yihui/rmarkdown/xaringan.html

- https://www.rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf

---
# Other presentation tools

- Beamer

- Standalone remark.js

- Reveal.js

- Sozi, SVG-based zoom-in/out Prezi-like tool

- Horribile dictu: Powerpoint


