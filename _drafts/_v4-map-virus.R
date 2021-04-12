library(tidyverse)


library(eurostat)
library(sf)
library(countrycode)
library(kimberlite)
library(ggrepel)
library(wesanderson)
sf <- get_eurostat_geospatial(output_class = "sf", resolution = "60",
                              nuts_level = "0")

class(sf)

jhu <- as_tibble(read.csv("https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/jhu/weekly_cases_per_million.csv"))
max(jhu$date)
cntrs <- jhu %>%
  filter(date == "2021-03-14") %>%
  select(date, Serbia, Croatia, Slovenia, Austria, Slovakia, Czechia, Poland, Ukraine, Romania, Hungary) %>%
  pivot_longer(Serbia:Hungary, names_to = "country", values_to = "case")


names(sf)
head(sf)
sf$country <- countrycode(sf$CNTR_CODE, origin="eurostat",
                           destination = "country.name")

cntrs$country
sf <- sf %>%
  filter(country %in% cntrs$country)

df <- left_join(sf, cntrs, by = "country")

ll <- read.csv(file = "~/Downloads/country_centroids_az8.csv")
ll <- as_tibble(ll)
glimpse(ll)
grep("C*", unique(ll$name), value = TRUE)


ll2 <- ll %>%
  select(country = name, Longitude, Latitude) %>%
  filter(country %in% df$country | country == "Czech Rep.")

ll2[(ll2$country == "Czech Rep."),]$country <- "Czechia"

df2 <- left_join(df, ll2, by = "country")

df2

# devtools::install_github("yutannihilation/ggsflabel")
library(ggsflabel)
pal <- wes_palette("Cavalcanti1", 37, type = "continuous")
p1 <- df %>%
  ggplot(aes(fill = as.factor(case))) +
  scale_fill_kimberlite() +
  geom_sf(color = "dimgray", size = 0.1) +
  geom_sf_label(aes(label = round(case, 0))) +
  theme(legend.position = "none", axis.title = element_blank(),
        plot.title = element_text(size = 20, family = "Hack")) +
  labs(# title = "Új COVID-19 esetek az előző hét napban összesítve egy millió főre vetítve",
       subtitle = "2021-03-14, adatforrás: OWID/JHU")
p1



p2 <- df2 %>%
  mutate(country = fct_reorder(country, Latitude)) %>%
  ggplot(aes(x = country, y = as.factor(Latitude), fill = case)) +
  scale_fill_kimberlite(discrete = FALSE) +
  geom_col(size = 0.1) +
  coord_flip() +
  geom_label(aes(label = round(case, 0))) +
  theme_kimberlite(family = "Hack") +
  theme(legend.position = "none",
        axis.title = element_blank()) +
  labs(# title = "Új COVID-19 esetek az előző hét napban összesítve egy millió főre vetítve",
       subtitle = "2021-03-14, adatforrás: OWID/JHU")
p2

p1 + p2 +
  plot_layout(widths = c(2, 1), heights = c(2, 1), nrow = 1, ncol = 2)





install.packages("CoordinateCleaner")
library(CoordinateCleaner)
?cc_cap()

# install.packages("ggpubr")
library(ggpubr)
ggarrange(p1,p2)

library(patchwork)
layout <- c(
  area(t = 0, l = 1, b = 0, r = 4),
  area(t = 0, l = 5, b = 0, r = 7)
)
plot(layout)
p1 + p2 +
  plot_layout(design = layout)

p1 <- ggplot(mtcars) + geom_point(aes(mpg, disp))
p2 <- ggplot(mtcars) + geom_boxplot(aes(gear, disp, group = gear))
p3 <- ggplot(mtcars) + geom_bar(aes(gear)) + facet_wrap(~cyl)

     layout <- c(
       area(1, 1),
       area(1, 3, 3),
       area(3, 1, 3, 2)
     )

     # Show the layout to make sure it looks as it should
     plot(layout)

     # Apply it to a patchwork
     p1 + p2 + p3 + plot_layout(design = layout)
