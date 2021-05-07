---
layout: single
title: "Xaringan presentation in a Jekyll site"
subtitle: "with (uhmm...) xaringan (with a theme)"
categories: [web, rstats]
tags: [Jekyll, xaringan, presentation]
excerpt: The xaringan R package is an R Markdown extension based on the remark.js JavaScript library to generate HTML5 presentations.
---

![naruto](../assets/img/etc/naruto-xaringan.jpg)

{: .notice--info }
>tl;dr -> [open xaringan presentation]({{ site.baseurl }}/static/xaringan-prez/xaringan-prez.html)

## What is Jekyll?
<img src="{{ site.baseurl }}/assets/img/etc/jekyll-logo.jpg" alt="xaringan-logo" style="float:right;height:100px;">
[Jekyll](http://jekyllrb.com) is a static website generator. I use it for my personal website at [zgfabian.github.com](http://zgfabian.github.io). 

## What is Xaringan?
<img src="{{ site.baseurl }}/assets/img/etc/xaringan-logo.png" alt="xaringan-logo" style="float:right;height:100px;">
The `xaringan` R package is an R Markdown extension based on the JavaScript library [remark.js](https://remarkjs.com) to generate HTML5 presentations of a different style. 

>*The name “xaringan” came from [Sharingan](http://naruto.wikia.com/wiki/Sharingan) in the Japanese manga and anime “Naruto.” The word was deliberately chosen to be difficult to pronounce for most people (unless you have watched the anime), because its author (me) loved the style very much, and was concerned that it would become too popular. The concern was somewhat naive, because the style is actually very customizable, and users started to contribute more themes to the package later.* - [Yihui Xie](https://bookdown.org/yihui/rmarkdown/xaringan.html), the author of Xaringan (and many more) R package


>*"The Sharingan is an ability that allows a ninja to copy, by mere sight, their opponents' techniques while gaining incredible reflexes and perceptive abilities."* - [Urban Dictionary](https://www.urbandictionary.com/define.php?term=The%20Sharingan)


# Xaringan overview

```r
# install
install.packages("xaringan")
# list available theme (+font) names
names(xaringan:::list_css())
```

## Some features of Xaringan

- Based on Rmarkdown and require some html, css and optimally js knowledge
- online and offline presentations
- pdf output with other packages (e.g. `pagedown`) or system tools ([See details here.](https://github.com/yihui/xaringan/wiki/Export-Slides-to-PDF))
- slide separator: ``
- incremental reveal separator: `--`
- presenter notes separator: `???`


# Advanced features
- Highlight styles for code blocks via [highlight.js](https://github.com/gnab/remark/wiki/Configuration#highlighting). (cf. in YAML `highlightStyle`)
- to create custom xaringan themes [`xaringanthemer`](https://cran.r-project.org/web/packages/xaringanthemer/vignettes/xaringanthemer.html) package is at your hand
- and [`xaringanExtra`](https://pkg.garrickadenbuie.com/xaringanExtra/) package is for advanced effects and layouts
- for more output formats, use [`xaringanBuilder`](https://github.com/jhelvy/xaringanBuilder). It can produce even gifs that everybody love (Not really.)


# Configuration in Jekyll

Xaringan presentations are [Rmarkdown]() files with [YAML](https://en.wikipedia.org/wiki/YAML) front-matter. I configured Jekyll to exclude them from rendering. Cf. Jekyll's `_config.yml`:

```yaml
exclude:
  - "*.Rmd" 
```

We render Rmarkdown files to html output. By this setup jekyll will not have to deal directly with markdown files. One potential drawback is that you can not use liquid tags (such as {% raw %}`{{ site.baseurl }}`{% endraw %}). You have to use only **Rmarkdown**, **html** and pay attention to **YAML** syntax. (`ymlthis` package can provide assistance to format and structure Rmarkdown's yaml front-matter.) 


# Locate and pin your `remark.js`

- `remark.js` is served from a locally project folder. (In my case on [`minimal-mistake` Jekyll theme](https://github.com/mmistakes/minimal-mistakes) it is `./assets/js/` folder)

```
output:
  xaringan::moon_reader:
    chakra: ../assets/js/remark-latest.min.js
```

Note: Mind your `remark.js` version. Xariangan provides a dedicated function, (`summon_remark`) to download the proper version of the `remark.js` script to your local disk, so you can render slides offline. You need to change the `chakra` argument of `moon_reader()` accordingly. 

{: .full}
```r
xaringan::summon_remark(version = "0.14.1", to = "../assets/js/")
```

{: .full}
```yaml
output:
  xaringan::moon_reader:
    seal: false
    css: [default, rutgers, rutgers-fonts]
    lib_dir: ../static/xaringan-prez/libs
    chakra: ../../assets/js/remark-0.14.1.min.js # pinned version
```

# Fine tuning

Remember that in yaml front matter every paths are relative. More importantly `lib_dir:` relative to `rmarkdown::render`'s `input:` file's directory, while `chakra:` is relative to `output_dir`. 

an exampe: html header customization for proper favicon display should be specified in front-matter like this:
 
```yaml
output:
  xaringan::moon_reader:
    includes:
      in_header: ../_includes/head/favicon-xaringan.html
```

and contents of `favicon-xaringan.html` would be:

{: .full}
```html
<link rel="apple-touch-icon" sizes="180x180" href="{{ site.baseurl }}/assets/img/site/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="{{ site.baseurl }}/assets/img/site/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="{{ site.baseurl }}/assets/img/site/favicon-16x16.png">
<link rel="manifest" href="{{ site.baseurl }}/assets/img/site/site.webmanifest">
<link rel="mask-icon" href="../../assets/img/site/safari-pinned-tab.svg" color="#5bbad5">
<meta name="msapplication-TileColor" content="#da532c">
<meta name="theme-color" content="#ffffff">
```

# Xaringan outside Rstudio?

[Doom Emacs](https://github.com/hlissner/doom-emacs) + [Emacs Speaks Statistics](https://ess.r-project.org/) (ESS)) and Xaringan preview in [Surf](https://surf.suckless.org/) browser as an #rstat IDE

![doom]({{ site.baseurl }}/assets/img/etc/emacs-xaringan.png)


# Further resources

- [remarkjs.com - website](https://remarkjs.com/)
- [xaringan in the Rmarkdown book](https://bookdown.org/yihui/rmarkdown/xaringan.html)
- [R Markdown Reference Guide]( https://www.rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf)
- [Google fonts](https://fonts.google.com/about)

# Other presentation tools

There are many alternatives to Xaringan. Some have rmd support. Just to mention some:
- Beamer - good old Latex
- Standalone remark.js - a complicated xaringan minus Rmd
- [Reveal.js](https://revealjs.com) - for js (and org-mode) gurus
- Sozi, SVG-based zoom-in/out Prezi-like tool even in Inkscape or as standalone app. 
- LibreOffice Impress and MS Powerpoint for office suite addicts


