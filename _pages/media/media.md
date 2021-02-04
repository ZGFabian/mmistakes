---
layout: single
title: Media demo
permalink: /media/
lang: en
toc: true
gallery:
  - url: /assets/img/site/mrfox.jpg
    image_path: /assets/img/site/mrfox.jpg
    alt: "placeholder image 1"
    title: "Mr. Fox"
  - url: /assets/img/20-10-07-mortality/hu-mortality-w36-2020-10-12.png
    image_path: /assets/img/20-10-07-mortality/hu-mortality-w36-2020-10-12.png
    alt: "Mortality HU - effect of pandemic"
    title: "Mortality HU - effect of pandemic"
  - url: /assets/img/site/blabla-orange.png
    image_path: /assets/img/site/blabla-orange.png
    alt: "Blabla"
    title: "Blabla by Fanni"
gallery-two:
  - url: /assets/img/site/mrfox.jpg
    image_path: /assets/img/site/mrfox.jpg
    alt: "placeholder image 1"
    title: "Mr. Fox"
  - url: /assets/img/20-10-07-mortality/hu-mortality-rate-2020-10-12.png
    image_path: /assets/img/20-10-07-mortality/hu-mortality-rate-2020-10-12.png
    alt: "hu-mortality-rate-2020-10-12.png"
    title: "hu-mortality-rate-2020-10-12.png"
  - url: /assets/img/20-10-07-mortality/hu-mortality-w36-2020-10-12.png
    image_path: /assets/img/20-10-07-mortality/hu-mortality-w36-2020-10-12.png
    alt: "Mortality HU - effect of pandemic"
    title: "Mortality HU - effect of pandemic"
  - url: /assets/img/site/blabla-orange.png
    image_path: /assets/img/site/blabla-orange.png
    alt: "Blabla"
    title: "Blabla by Fanni"
---
## Some "[helpers](https://mmistakes.github.io/minimal-mistakes/docs/helpers/)"

### Images
#### Markdown image resized
![Fox](/assets/img/site/mrfox.jpg)

{: .notice--info}
Note: Just [certain markdown implementations](https://stackoverflow.com/questions/14675913/changing-image-size-in-markdown) support image resizing. This paragraph was formatted by `{: .notice--info}` liquid tag.

#### HTML image resized
<img src="/assets/img/site/blabla-orange.png" alt="Blabla" width="50">

#### Liquid figure with caption
{% include figure image_path="/assets/img/site/mrfox.jpg" alt="this is a placeholder image" caption="Wes Anderson's movie" %}
{: .notice--warning}
Note: There is plugin called [`jekyll-image-size`](https://github.com/generalui/jekyll-image-size) that can do the resizing without any CSS. This paragraph was formatted by `{: .notice--warning}` liquid tag.

### Image galleries

#### Basic
{% include gallery caption="This is a sample gallery with **Markdown support**." %}

#### Full conttainer width 
(`class="full"`)
{% include gallery class="full" caption="This is another sample gallery with *Markdown support*." %}

#### Half-layout with unique id 
(`layout="half`) (`id="gallery-two"`)
{% include gallery id="gallery-two" layout="half" caption="This is a sample gallery with **Markdown support**." %}

### Embedded video content

{% include video id="mhO7wSAoQCI" provider="youtube" %}
{: .notice--info}
**Tip:** if you’d like to start the video at a particular timestamp, you can append ?start=110 (for instance) to the video id in order to have the video start at 1:50.
**Note:** Vimeo and google drive contents are also supported.

### Just embed an iframe as html (Coub example)
<iframe src="//coub.com/embed/2mts8f?muted=false&autostart=false&originalSize=false&startWithHD=false" frameborder="0" width="640" height="360" allow="autoplay"></iframe>

### Video in header

{: .btn .btn--primary}
See this [page](/_pages/media/video-header/).

### Splash pages

are cool.

{: .btn .btn--primary}
See example layout [here](/_pages/media/splash-layout/).

Minimal mistake [documentation](https://mmistakes.github.io/minimal-mistakes/splash-page/).

### Feature row

Feature row, an extension of to splash layout is presented [here](/post-archive-feature-rows/).


## Resources

[GitHub Flavored Markdown](https://github.github.com/gfm/)

