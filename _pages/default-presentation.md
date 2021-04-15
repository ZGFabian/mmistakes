---
layout: presentation
title: HTML presentation with remark.js demo
permalink: /default-presentation/
categories: [jekyll, remark.js]
tags: [presentation, html, markdown]
remark-css: default 
---

.center
# HTML presentation with remark.js

.center[.red.bold[*] Important footnote]

??? 

Notes jkdsajljdsalj

---

# Documentation

1. remark.js [homepage](https://remarkjs.com/)
2. remark.js [project pages](https://github.com/gnab/remark) and link to [wiki](https://github.com/gnab/remark/wiki)
3. Using remark.js with jekyll [(instruction on wiki)](https://github.com/gnab/remark/wiki/Using-with-Jekyll)

[NOTE]: Note that you need active internet connection to access remark.js script file

---

# My own configuration

1. Downloaded [remark-latest.min.js](https://gnab.github.io/remark/downloads/remark-latest.min.js) to `assets/js`* folder.
2. Added a line to `_includes/footer/custom.html`
3. 

```html
<!-- start custom footer snippets -->
{% if page.layout == "presentation" %}
<script type="text/javascript" src="{{ site.baseurl  }}/assets/js/remark-latest.min.js"></script>
{% endif %}
[...]
</body>
</html>
<!-- end custom footer snippets -->
```

`* You should have to give `{{ site.baseurl }}` in your `_config.yml`, if you deploy to a github.com project page.
