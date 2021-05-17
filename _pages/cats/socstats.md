---
layout: single
title: Social statistics related contents
classes: wide
---

with listings of tags ...

{% for page in site.pages %}
  <ul>
      {% if page.categories contains 'social statistics' %}
        <li><a href='{{ site.baseurl }}{{ page.url }}'>{{ page.title }}</a>: 
        	<div><i class="fas fa-fw fa-tags" aria-hidden="true"></i>&nbsp;<b>Tags:</b>
            <i>{{ page.tags | join: ", " | downcase }}</i>
          </div>  
        </li>
      {% endif %}
  </ul>
{% endfor %}
<br>
{% for post in site.posts %}
  <ul>
      {% if post.categories contains 'social statistics' %}
        <li><a href='{{ site.baseurl }}{{ post.url }}'>{{ post.title }}</a>: 
        	<div><i class="fas fa-fw fa-tags" aria-hidden="true"></i>&nbsp;<b>Tags:</b>
            <i>{{ post.tags | join: ", " | downcase }}</i>
          </div>  
        </li>
      {% endif %}
  </ul>
{% endfor %}