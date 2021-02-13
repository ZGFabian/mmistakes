---
layout: splash
title: Splash layout demo page
lang: en
permalink: /splash-layout/
header:
  image: /assets/img/site/splash-fractal.png
  image_description: "A fractal image as splash"
---
## Splash layout demo page

Look, there is no sidebar, so it is a really a "single" page layout. The nice splash image was cut out from a fractal picture presented in this [post]({{ site.baseurl }}/2021-02-04-fractals).

Put these into YAML front matter[^1] 

``` 
---
layout: splash
header:
  image: /assets/URL.png
  image_description: "A description of the image" 
---
```

Minimal mistake [documentation](https://mmistakes.github.io/minimal-mistakes/splash-page/).

[^1]: What is YAML front matter? YAML is a human-readable markup language. However its name come from the abbreviation "YAML Ain't Markup Language". With it, you can create easily readable documents that can be consumed by a variety of programming languages including ruby and R. Jekyll processes any YAML front matter block that is in the first few lines of markdown files between triple dashed lines (`---``). 


