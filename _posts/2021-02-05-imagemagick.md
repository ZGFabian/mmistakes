---
title: Anatomy of an ancient magick command
subtitle: Display a color palette with ImageMagick
layout: single
classes: wide
categories: linux
tags: [ImageMagick, color palette, convert, mogrify]
image: assets/img/21-02-05-imagemagick/rgb-pal.png
---

`ImageMagick` is a software suit to manipulate images mainly from command line interface (CLI)[^im]. It was created in 1987 and open-sourced in 1990. The `convert` command - among others - is a part of this application. Useful for converting, resizing an image and also useful to blur, crop, flip and much more. The full list of command line options is available [here](https://imagemagick.org/script/command-line-options.php). 

This is a CLI code example - that means to be exectuted from a terminal - how to display a color palette:

``` 
convert -size 100x100 \
        label:" RGB colors" \
        canvas:red xc:#00ff00 xc:rgb\(0,0,255\) \
        +append rgb-pal.png
```

![rgb-pal.png]({{ site.baseurl }}/assets/img/21-02-05-imagemagick/rgb-pal.png){: .align-center }

![im-convert.svg]({{ site.baseurl }}/assets/img/21-02-05-imagemagick/im-convert.svg)

Some more details on command syntax:

- `convert` vs. `mogrify`: "It’s worth pointing out that Imagemagick has two main commands for modifying images. The main difference is that `convert` tends to be for working on individual images, whereas `mogrify` is for batch processing multiple files. Another key distinction is that convert is designed to modify an image and output to a separate file. Mogrify on the other hand will quite happily change the original file, unless you specify a separate output location. Be careful not to modify images without a backup!" Source: [deparkes](https://deparkes.co.uk/2015/03/16/useful-imagemagick-commands/)

- A backslash ("\\" character) permits the command to span over multiple lines. It is a so called "escape" character that invokes an alternative interpretation on the following characters in a character sequence.

- `canvas` and `xc` are synonymous, later is the legacy format that meant "X Constant Image".
- `label` is a simple text operator, its options are documented [here](https://legacy.imagemagick.org/Usage/text/).
- +\|- append: Join canvas images horizontally (+), or vertically (-). 

Finally lets take a look at another example:

```
convert -background "d45500ff" -fill blue \
        -font Candice -pointsize 72 label:"Happy End" \
         happy-end.png
```
that outputs this prehistoric true type font face:

![HE]({{ site.baseurl }}/assets/img/21-02-05-imagemagick/happy-end.png){: .align-center }
        
[^im]:Official website is [imagemagick.org](https://imagemagick.org). The current release is ImageMagick 7.0.11-0. Legacy 6.0 documentation is maintained [here](https://legacy.imagemagick.org).

Resources:

- [ImageMagick v6 Examples -- Canvas Creation](https://legacy.imagemagick.org/Usage/canvas/)

