---
layout: single
title: Data visualization contents
classes: wide
---

with listings of tags and plot types ...

{% for post in site.posts %}
  <ul>
      {% if post.categories contains 'data visualization' %}
        <li><a href='{{ site.baseurl }}{{ post.url }}'>{{ post.title }}</a>: 
        	<div><i class="fas fa-fw fa-tags" aria-hidden="true"></i>&nbsp;<b>Tags:</b>
            <i>{{ post.tags | join: ", " | downcase }}</i>
          </div>  
          <div><i class="far fa-chart-bar" aria-hidden="true"></i>&nbsp;<b>Plots:</b>
            <i>{{ post.plots | join: ", " }}</i>
          </div>
        </li>
      {% endif %}
  </ul>
{% endfor %}