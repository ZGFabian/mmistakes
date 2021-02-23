---
title: "Severe deprivation rate in Hungary, 2005-2019"
output:
  md_document:
    variant: gfm 
    preserve_yaml: TRUE
excerpt: "I plotted EUROSTAT data with a few line of R codes using `eurostat` and `tidyverse`."
layout: single
categories:
  - data
tags: [ggplot, eurostat, R]
image: # brent-rambo.jpg # for open graph protocol
---

    ## ── Attaching packages ──────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse 1.3.0 ──

    ## ✔ ggplot2 3.3.3     ✔ purrr   0.3.4
    ## ✔ tibble  3.0.6     ✔ dplyr   1.0.4
    ## ✔ tidyr   1.1.2     ✔ stringr 1.4.0
    ## ✔ readr   1.4.0     ✔ forcats 0.5.0

    ## ── Conflicts ─────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

Name of the indicator: Severe material deprivation rate (population aged
18 and over) Indicator definition: Code of indicator: `ilc_mddd12`
EUROSTAT [Data
Explorer](http://appsso.eurostat.ec.europa.eu/nui/submitViewTableAction.do):
![screenshot](/assets/img/21-02-22-screenshot.png) EUROSTAT: [Data
Browser](https://ec.europa.eu/eurostat/databrowser/view/ilc_mddd12/default/table?lang=en)

References: [Tutorial for the eurostat R
package](http://ropengov.github.io/eurostat/articles/website/eurostat_tutorial.html)

Codes for the dataset can be searched also from the [Eurostat
database](https://ec.europa.eu/eurostat/data/database).

``` r
# Countries and Country Codes
as_tibble(eu_countries)
```

    ## # A tibble: 28 x 3
    ##    code  name     label                                           
    ##    <chr> <chr>    <chr>                                           
    ##  1 BE    Belgium  Belgium                                         
    ##  2 BG    Bulgaria Bulgaria                                        
    ##  3 CZ    Czechia  Czechia                                         
    ##  4 DK    Denmark  Denmark                                         
    ##  5 DE    Germany  Germany (until 1990 former territory of the FRG)
    ##  6 EE    Estonia  Estonia                                         
    ##  7 IE    Ireland  Ireland                                         
    ##  8 EL    Greece   Greece                                          
    ##  9 ES    Spain    Spain                                           
    ## 10 FR    France   France                                          
    ## # … with 18 more rows

``` r
t1<-search_eurostat("Severe material deprivation")
t1 %>%
  select(title, code)
```

    ## # A tibble: 19 x 2
    ##    title                                                              code      
    ##    <chr>                                                              <chr>     
    ##  1 Severe material deprivation rate by NUTS regions                   ilc_mddd21
    ##  2 Severe material deprivation rate by degree of urbanisation         ilc_mddd23
    ##  3 Severe material deprivation by level of activity limitation, sex … hlth_dm010
    ##  4 Severe material deprivation rate by age and sex                    ilc_mddd11
    ##  5 Severe material deprivation rate by most frequent activity status… ilc_mddd12
    ##  6 Severe material deprivation rate by income quintile and household… ilc_mddd13
    ##  7 Severe material deprivation rate by educational attainment level … ilc_mddd14
    ##  8 Severe material deprivation rate by broad group of citizenship (p… ilc_mddd15
    ##  9 Severe material deprivation rate by broad group of country of bir… ilc_mddd16
    ## 10 Severe material deprivation rate by tenure status                  ilc_mddd17
    ## 11 Severe material deprivation rate by NUTS regions                   ilc_mddd21
    ## 12 Severe material deprivation rate by degree of urbanisation         ilc_mddd23
    ## 13 Severe material deprivation rate for children by educational atta… ilc_mddd60
    ## 14 Severe material deprivation rate by age and sex                    ilc_mddd11
    ## 15 Severe material deprivation rate by broad group of country of bir… ilc_mddd16
    ## 16 Severe material deprivation rate of young people by sex, age and … yth_incl_…
    ## 17 Severe material deprivation rate by age and sex                    ilc_mddd11
    ## 18 Severe material deprivation rate by broad group of citizenship (p… ilc_mddd15
    ## 19 Severe material deprivation rate by broad group of country of bir… ilc_mddd16

``` r
df <- get_eurostat("ilc_mddd12", time_format = "num")
```

    ## Table ilc_mddd12 cached at /tmp/RtmpBPg8su/eurostat/ilc_mddd12_num_code_FF.rds

``` r
df <- df %>%
  filter(time >= 2005 & wstatus=="POP" &
         age == "Y_GE18" & geo == "HU" &
         sex == "T")
p1 <- df %>%
  ggplot(aes(time, values)) +
  geom_line()
p1
```

![](../assets/img/21-02-22/p1-1.png)<!-- -->
