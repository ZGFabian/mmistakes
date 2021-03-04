---
layout: single
clasess: wide
title: "Testing highcharts"
tags: [highcharts, js, jekyll]
category : [web, data]
---
`highcharter` library provides three option to export `hc` objects to formats that are useful to include them to websites: (1) container (2) is and (3) variable. 
<!--
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js">
</script>
-->
<script src="{{ site.baseurl }}/assets/js/custom/highcharts.js">
</script>
<script src="{{ site.baseurl }}/assets/js/custom/exporting.js">
</script>

<div style="min-width: 310px; height: 400px; margin: 0 auto">
<script src="{% link assets/js/custom/hc_vr.js %}"></script>
</div>


<br>


{: .full}
```r
library(highcharter)
# remotes::install_github("allisonhorst/palmerpenguins")
data(penguins, package = "palmerpenguins")
hc <- hchart(penguins, "scatter", hcaes(x = flipper_length_mm, y = bill_length_mm, group = species))
export_hc(hc, filename = "PATH/TO/hc_ct.js", as = "container", name = "#YOURselectorid")
```
{% raw %}
```
<div id="#YOURselectorid" style="min-width: 310px; height: 400px; margin: 0 auto">
</div>
<script src="{% link PATH/TO/hc_ct.js %}"></script>
```
{% endraw %}


