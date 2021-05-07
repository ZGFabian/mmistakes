---
layout: single
---


<h1>Example plot types in "data visualization" category</h1>

{% for post in site.posts %}
  <ul>
      {% if post.categories contains 'data visualization' %}
        <li><a href='{{ site.baseurl }}{{ post.url }}'>{{ post.title }}</a>: 
        	<i class="far fa-chart-bar" aria-hidden="true">&nbsp;</i>: 
        	{% for plots in post.plots %}
        		<span class="page__taxonomy-item small">{{ post.plots | split: ', ' }}</span>
        	{% endfor %}
        </li>
      {% endif %}
  </ul>
{% endfor %}

