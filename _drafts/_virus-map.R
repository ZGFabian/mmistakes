setwd("/home/fabian/projects/2020/jekyll/mmistakes/_drafts/")
library(tidyverse)
library(rnaturalearthdata)
library(rnaturalearth)
library(countrycode)
library(kimberlite)


centroids <- read_csv("/home/fabian/projects/2020/blog/solar-energy/data/country_centroids_az8.csv") %>% select(iso_a2,Longitude,Latitude)
world <- ne_countries(scale = "medium", returnclass = "sf")
# plot(world)
jhu <- as_tibble(read.csv("https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/jhu/weekly_cases_per_million.csv"))
max(jhu$date)

cntrs <- jhu %>%
  filter(date == max(jhu$date)) %>%
  select(date, Serbia, Croatia, Slovenia, Austria, Slovakia, Czechia, Poland, Ukraine, Moldova, Romania, Hungary) %>%
  pivot_longer(Serbia:Hungary, names_to = "country", values_to = "case")

centroids$country <- countrycode(centroids$iso_a2,
            origin = "iso2c",
            destination = "iso.name.en")
centroids$country[centroids$country == "Moldova (the Republic of)"] <- "Moldova"
# ?codelist
centroids %>%
  filter(country == "Moldova")

# change Moldova and Croatia' Latitude
centroids$Latitude[centroids$country == "Moldova"] <- 47.35
centroids$Latitude[centroids$country == "Croatia"] <- 45.4

# centroids$Latitude

df <- cntrs %>%
  left_join(centroids, by = "country")

df %>%
  filter(country == "Czechia") %>%
  select(case)

max(df$case)

df2 <- df %>%
  mutate(czpct = round((case/max(case)*100), 0))

# grep("Moldova", world$name_en, value = TRUE)

world$name_en[world$name_en == "Czech Republic"] <- "Czechia"


mz <- c(paste(0),
        paste(round(max(df$case)/2)),
        paste(round(max(df$case),0)))
mz


p1 <- ggplot() +
  geom_sf(data = world %>% filter(name_en %in% cntrs$country),
          fill = "#eff7fa", color = "dark cyan") +
  coord_sf(xlim = c(9, 52), ylim = c(42, 55)) +
  geom_point(data = df2,
             aes(x = Longitude,
                 y = Latitude,
                 size = czpct),
             color = "dark cyan") +
  geom_text(data = df2, aes(x = Longitude, y = Latitude,
                            label = round(case, 0)),
            hjust = -0.3, vjust = -0.3) +
  geom_segment(data = df2, aes(x = Longitude,
                               y = Latitude,
                               yend = Latitude,
                               xend = 40 + czpct / 10),
               alpha = 0.6, linetype = "dashed",
               color = "dark cyan") +
  geom_segment(data = df2, aes(x = 40,
                               y = Latitude,
                               yend = Latitude,
                               xend = 40 + czpct / 10),
               color = "dark cyan", size = 3) +
  geom_text(data = df2,
            aes(x = 40 + czpct / 10,
                y = Latitude,
                label = iso_a2),
            vjust = 0.5,
            hjust = -0.7, size = 3,
            color = "dark cyan") +
  annotate(geom = "text", x = 45, y = 43, hjust = 0,
           label = paste("weekly new cases per million\n",
                         "points are corrected country centroids\n",
                         "point sizes are proportional to values\n",
                         max(jhu$date)),
           size = 3,
           family = "Hack",
           color = "dim gray") +
  scale_x_continuous(breaks = c(40, 45, 50),
                     labels = mz) +
  guides(size = FALSE) +
  theme_kimberlite() +
  labs(x = "", y = "",
    title = "COVID-19: Weekly new cases per million in selected East-Central-Europe countries",
    caption = "@magnachart\nData:OWID | JHU")
p1
ggsave("_tmp/case-map.png", p1, width = 12, height = 9, units = "in", dpi = 150)

p1 +
  theme(plot.background = element_rect(fill = "dim gray",
                                       color = "dim gray"))
  #      panel.background = element_rect(fill = "sandybrown",
  #                                      color =  "sandybrown"))
p1
