---
layout: single
title: Web development related contents
classes: wide
---

with listings of tags ...

{% for post in site.posts %}
  <ul>
      {% if post.categories contains 'web' %}
        <li><a href='{{ site.baseurl }}{{ post.url }}'>{{ post.title }}</a>: 
        	<div><i class="fas fa-fw fa-tags" aria-hidden="true"></i>&nbsp;<b>Tags:</b>
            <i>{{ post.tags | join: ", " | downcase }}</i>
          </div>  
        </li>
      {% endif %}
  </ul>
{% endfor %}