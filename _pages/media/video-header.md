---
layout: single
title: Video in header
lang: en
header:
  video:
    id: V1LhC1zGouc?t=15
    provider: youtube
---

## YAML Front matter

```Yaml
layout: single
title: Video in header
lang: en
header:
  video:
    id: QyZeJr5ppm8?start=231
    provider: youtube
```

{%  highlight liquid %}
{: .notice--info}
{% endhighlight %}

{: .notice--info}
The video id appended with `?start=15` element, so the clip starts at 0:15.

A variation of the same clip is here:


``` html
{% include video id="evVUx8V7vP0" provider="youtube" %}
```

{% include video id="evVUx8V7vP0" provider="youtube" %}

  
