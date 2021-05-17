---
layout: single
title: Liquid syntax to list all post in a given categories
categories: web
tags: [jekyll, liquid]
classes: wide
---

This liquid snippet will list all posts that contains "data visualization" category in Jekyll front matter. It also adds icons for tags and plot types. Cf. [this page]({{ site.baseurl }}/_pages/cats/data-vis/)

{: .full}
{% raw %}
```liquid
{% for post in site.posts %}
  <ul>
      {% if post.categories contains 'data visualization' %}
        <li><a href='{{ site.baseurl }}{{ post.url }}'>{{ post.title }}</a>: 
          <div><i class="fas fa-fw fa-tags" aria-hidden="true"></i>&nbsp;<b>Tags:</b>
            <i>{{ post.tags | join: ", " | downcase }}</i>.
          </div>  
          <div><i class="far fa-chart-bar" aria-hidden="true"></i>&nbsp;<b>Plots:</b>
            <i>{{ post.plots | join: ", " }}</i>
          </div>
        </li>
      {% endif %}
  </ul>
{% endfor %}
```
{% endraw %}