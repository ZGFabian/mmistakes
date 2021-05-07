---
layout: single
---


<h1>Example plot types in "data visualization" category</h1>

{% capture site_tags %}
	{% for tag in site.tags %}
		{{ tag | first | downcase }}#{{ tag | first }}
		{% unless forloop.last %},
		{% endunless %}
	{% endfor %}
{% endcapture %}
{% assign tag_hashes = site_tags | split:',' | sort %}

<ul class="list-group">
	{% for hash in tag_hashes %}
	  {% assign keyValue = hash | split: '#' %}
	  {% capture tag_word %}{{ keyValue[1] | strip_newlines }}{% endcapture %}
	  <li class="list-group-item">
	    {{ tag_word }}
	    <span class="">{{ site.tags[tag_word].size }}</span>
	  </li>
	{% endfor %}
</ul>
