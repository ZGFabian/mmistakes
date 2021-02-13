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

Welcome to image alignment! The best way to demonstrate the ebb and flow of the various image positioning options is to nestle them snuggly among an ocean of words. Grab a paddle and let's get started.

![image-center]({{ site.baseurl }}/assets/img/site/image-alignment-580x300.jpg){: .align-center}

The image above happens to be **centered**.

![image-left]({{ site.baseurl }}/assets/img/site/image-alignment-150x150.jpg){: .align-left} The rest of this paragraph is filler for the sake of seeing the text wrap around the 150×150 image, which is **left aligned**.

As you can see there should be some space above, below, and to the right of the image. The text should not be creeping on the image. Creeping is just not right. Images need breathing room too. Let them speak like you words. Let them do their jobs without any hassle from the text. In about one more sentence here, we'll see that the text moves from the right of the image down below the image in seamless transition. Again, letting the do it's thing. Mission accomplished!

And now for a **massively large image**. It also has **no alignment**.

![no-alignment]({{ site.baseurl }}/assets/img/site/image-alignment-1200x4002.jpg)

The image above, though 1200px wide, should not overflow the content area. It should remain contained with no visible disruption to the flow of content.

![image-right]({{ site.baseurl }}/assets/img/site/image-alignment-300x200.jpg){: .align-right}


#### Markdown image resized
![Fox]({{ site.baseurl }}/assets/img/site/mrfox.jpg)

{: .notice--info}
Note: Just [certain markdown implementations](https://stackoverflow.com/questions/14675913/changing-image-size-in-markdown) support image resizing. This paragraph was formatted by `{: .notice--info}` liquid tag.

#### HTML image resized
<img src="{{ site.baseurl }}/assets/img/site/blabla-orange.png" alt="Blabla" width="50">

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
See this [page]({{ site.baseurl }}/_pages/media/video-header/).

### Splash pages

are cool.

{: .btn .btn--primary}
See example layout [here]({{ site.baseurl }}/_pages/media/splash-layout/).

Minimal mistake [documentation](https://mmistakes.github.io/minimal-mistakes/splash-page/).

### Feature row

Feature row, an extension of to splash layout is presented [here]({{ site.baseurl }}/post-archive-feature-rows/).


## Resources

[GitHub Flavored Markdown](https://github.github.com/gfm/)

