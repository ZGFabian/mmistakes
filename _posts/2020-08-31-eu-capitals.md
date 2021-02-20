---
title: Adding European capitals to Eurostat map
subtitle: and Castello Cavalcanti (palette)
categories: data
tags: [ggplot, sf, eurostat, maps, capitals, Wes Anderson]
lang: en
---

![half-p2-capseu-def.png]({{ site.baseurl }}/assets/img/20-08-31-capitals/half-p2-capseu-def.png) 

One can easily draw a map for 37 "Eurostat countries" as it was demonstrated in this [post]({{ site.baseurl }}/2020-08-26-eurostat-maps/). However adding capital cities to the map can be tricky. The following example will use `{maps}` package for this purpose. The data at hand needs to be updated and cleaned to reflect recent political changes.


Steps: 

1. Download the Eurostat map on NUTS 0 level (to draw country borders only and to omit subregions),

	```r
	sf <- get_eurostat_geospatial(output_class = "sf", resolution = "60",
	                              nuts_level = "0")
	```

2. then add English country names to `{eurostat}` geospatial data using `{countrycode}` `countrycode()` function.

	```r
	sf$country <- countrycode(sf$CNTR_CODE, origin="eurostat", 
	                          destination = "country.name")
	```

3. Next comes the data cleaning part. We use `world.cities` data from `{maps}`. 
This data contains the name of the capitals, latitude and longitude codes, plus population size data. 
Even after appropriate filtering the two data frames having different row numbers. Check with `?setdiff`:

	```r
	setdiff(sf$country, capseu$country.etc)
	# [1] "Czechia"         "Montenegro"      "North Macedonia" "Serbia"         
	# [5] "United Kingdom" 
	>
	```
It is because (1) Czech Republic name changed to Czechia, (2) "Serbia and Montenegro" became "Serbia" and "Montenegro" and have different capitals, and (3) "UK" in `world.cities` data should be recoded to "United Kingdom". Even after these steps row numbers are still different. Solution: remove duplicates of Nicosia (as North-Cyprus is not recognized by the EU, and has the same capital with Cyprus).

4. Next, join filtered and cleaned world.cities data to Eurostat. Be sure that the resulted geospatial data preserving `sf` class

	```r
	capitals_eu <- left_join(sf, capseu, by=c("country"))
	```

5. and plot the map with two layers: `geom_sf()` for countries and `geom_points()` for capitals.

	```r
	p1 <- capitals_eu %>%
	  ggplot(aes(fill = country)) +
	  scale_fill_manual(values = pal) +
	  geom_sf(color = "dim grey", size = .1) +
	  geom_point(aes(x = long, y = lat, size = pop),
	             color = "black", alpha = 0.6)
	```

6. Add a custom style and a `wes_anderson` palette. A continuous palette can be generate like this:

	```r
	# ?wes_palette
	pal <- wes_palette("Cavalcanti1", 37, type = "continuous")
	```

The example above & the result presented below used [`Cavalcanti1`]({{ site.baseurl }}/assets/img/20-08-31-capitals/wesp-cavalcanti.png) palette, from the 2013 short film, [Castello Cavalcanti](https://youtu.be/b87B7zyucgI). 

[![screenshot]({{ site.baseurl }}/assets/img/20-08-31-capitals/cavalcanti-screenshot.png "open video"){: width="250" }{: .align-center}]({{ site.baseurl }}/assets/img/20-08-31-capitals/cavalcanti-screenshot.png)

7. Further aesthetics can be added via geom_text mapping to population size:

	```r
	ggrepel::geom_text_repel(data = capseu, aes(x = long,
	                                            y = lat,
	                                            size = pop,
	                                            label = labs,
	                                            family = "Ubuntu"),
	                              color = "black", alpha = 0.7) +
	  guides(size= FALSE)
	```


Result:

[![half-p1-capseu-def.png]({{ site.baseurl }}/assets/img/20-08-31-capitals/half-p1-capseu-def.png)]({{ site.baseurl }}/assets/img/20-08-31-capitals/half-p1-capseu-def.png)



Resources:

 - [R source code]({{ site.baseurl }}/assets/img/20-08-31-capitals/full-code-p1.R)
 - Capitals of 37 European countries [csv file]({{ site.baseurl }}/assets/img/20-08-31-capitals/eu-capitals.csv)
