---
layout: posts 
title: Over or below the grey lines
subtitle: Mortality in Hungary and in the USA during the pandemic
categories: data
tags: [ggplot, COVID-19, mortality, Hungary, USA, EUROMOMO]
lang: en
image: hu-mortality-w36-small.png
# featured-image-alt: Number of death in HU 
comments: true
date: 2020-10-12
---
Comparison of current and past mortality data shows the net death cost of current pandemic. Hungarian data on the bulk number of total deaths for the first eight months were positive. "Positive" is in a sense of time and space comparisons. 


Kieran Healy (@kjhealy) recently [tweeted](https://twitter.com/kjhealy/status/1313276959263162368){:target="blank"} and [published](https://kieranhealy.org/blog/archives/2020/09/24/us-excess-mortality/){:target="_blank"} some shocking charts on US weekly mortality numbers that showed the high cost of current pandemic in terms of mortality surplus. Compared to previous years the overall picture looks like this (*Figure 1*): 

### Figure 1
![fig1](/assets/img/20-10-07-mortality/USAmortality.jpg)

He added then: "Everyone under that red line was a real person. Hundreds of thousands of people are dead, and every one of them was as real as you. Brave or fearful, weak or tough, flamboyant or shy, the virus doesn't give a shit." It was directed toward those who do not believe the mortal nature of COVID-19.

I have plotted a similar chart for Hungary using [weekly mortality data from the Central Statistical Office](https://www.ksh.hu/docs/hun/xstadat/xstadat_evkozi/e_wnh004a.html){:target="_blank"}. 

The overall picture of 2020 mortality is still favorable (*Figure 2*) - the red line is under the grey ones at the time of the writing of this post. However, take a look at the infection curve which begun to rise precipitously (*Figure 3*) in Hungary and in its neighbours while the curve seems to be flattening in the US. 
### Figure 2
[![Hungary-weekly-mortality](/assets/img/20-10-07-mortality/hu-mortality-w36-2020-10-12.png)](/assets/img/20-10-07-mortality/hu-mortality-w36-2020-10-12.png)

### Figure 3
[![Hungary-new-cases
](/assets/img/20-10-07-mortality/c19-cases-2020-10-12.png)](/assets/img/20-10-07-mortality/c19-cases-2020-10-12.png)

Figure 4 shows the monthly mortality rates per thousands. Data is from the CSO STADAT [1.1 table](https://www.ksh.hu/docs/hun/xstadat/xstadat_evkozi/e_wdsd001a.html){:target="_blank"}.

### Figure 4
[![Hungary-mortality-rates
](/assets/img/20-10-07-mortality/hu-mortality-rate-2020-10-12.png)](/assets/img/20-10-07-mortality/hu-mortality-rate-2020-10-12.png)

Note that Figures 1, 2 and 4 comparing historical trends within one country and doesn't tell us much about cross-country differences.

With different methodologies similar comparisons are available for European countries from the [EUROMOMO](https://www.euromomo.eu/graphs-and-maps) project. 

Sources:

- [R-script](/assets/img/20-10-07-mortality/weekly-mortality.R) 

Data:

- [weekly rates](/assets/img/20-10-07-mortality/weekly-total-deaths.csv)) 
- [monthly rates](/assets/img/20-10-07-mortality/monthly-deaths.csv).
