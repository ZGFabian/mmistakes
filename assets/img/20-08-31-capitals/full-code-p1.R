library(tidyverse)
library(eurostat)
library(countrycode)  #iso3 to eurostat
library(sf)
library(maps) # world.cities
# library(gt) # tables
library(wesanderson)

sf <- get_eurostat_geospatial(output_class = "sf", resolution = "60",
                              nuts_level = "0")

?get_eurostat_geospatial
sf$country <- countrycode(sf$CNTR_CODE, origin="eurostat",
                          destination = "country.name")
sf %>% 
  count(country)

dim(sf)
# ?world.cities {maps}
data("world.cities")
capseu <- world.cities %>%
  filter(capital == 1) %>%
  filter(country.etc %in% sf$country)
setdiff(sf$country, capseu$country.etc)
# "Czechia", "Montenegro","North Macedonia", "Serbia", "United Kingdom" are
# missing from capseu
table(capseu$country.etc)

capseu <- capseu %>%
  filter(pop != 42372)

filter(world.cities, name == "London" & country.etc == "UK")
filter(world.cities, name == "Podgorica")
filter(world.cities, country.etc == "Serbia and Montenegro")
filter(world.cities, name == "Belgrade")
filter(world.cities, name == "Skopje")

capseu <- capseu %>% bind_rows(filter(world.cities,
                                      name == "London" & country.etc == "UK"))
capseu$country.etc[capseu$country.etc=="UK"] <- "United Kingdom"

capseu <- capseu %>% bind_rows(filter(world.cities, name == "Podgorica"))
capseu$country.etc[capseu$name == "Podgorica"] <- "Montenegro"

capseu <- capseu %>% bind_rows(filter(world.cities, name == "Belgrade"))
capseu$country.etc[capseu$name == "Belgrade"] <- "Serbia"

capseu <- capseu %>% bind_rows(filter(world.cities, name == "Prague"))
capseu$country.etc[capseu$name == "Prague"] <- "Czechia"

capseu <- capseu %>% bind_rows(filter(world.cities, name == "Skopje"))
capseu$country.etc[capseu$name == "Skopje"] <- "North Macedonia"

table(capseu$country.etc)
setdiff(sf$country, capseu$country.etc)

colnames(capseu)[1] <- "capital_name"
colnames(capseu)[2] <- "country"

capseu$capital <- NULL
write.csv(capseu,
          "~/projects/2020/map/capitals/outputs/eu-capitals.csv")

capitals_eu <- left_join(sf, capseu, by=c("country"))

my_theme <- function() {
  theme_bw() %+replace%
    theme(
      text = element_text(family = "Ubuntu Mono"),
      panel.grid.major  = element_line(color = "white"),
      panel.background = element_rect(fill = "lightgrey"),
      panel.border = element_rect(color = "lightgrey", fill = NA),
      title = element_text(color = "#2E3436"),
      axis.line = element_line(color = "lightgrey"),
      axis.ticks = element_line(color = "lightgrey"),
      axis.text = element_text(color = "#005577"),
      axis.title = element_blank(),
      strip.background = element_rect(color = "#005577", fill = "#005577"),
      strip.text.x = element_text(size = 11, color = "white")
    )
}
capseu$labs <- capseu$capital_name
capseu$labs[capseu$pop < 1000000] <- ""


title <- paste("Capitals of the European countries")
# plot map

# ?wes_palette
pal <- wes_palette("Cavalcanti1", 37, type = "continuous")

p1 <- capitals_eu %>%
  ggplot(aes(fill = country)) +
  scale_fill_manual(values = pal) +
  geom_sf(color = "dim grey", size = .1) +
  geom_point(aes(x = long, y = lat, size = pop),
             color = "black", alpha = 0.6) +
  xlim(c(-22, 44)) +
  ylim(c(35, 70)) +
  guides(fill = FALSE) +
  labs(title = title,
       subtitle = "(Cities 1 million+ population are labelled)",
       caption = "Data source: {eurostat}, {maps} / plot: @zoltangfabian") +
  my_theme() +
  theme(
    plot.title = element_text(family = "ETBembo")
  )

p1 <- p1 + 
ggrepel::geom_text_repel(data = capseu, aes(x = long,
                                            y = lat,
                                            size = pop,
                                            label = labs,
                                            family = "Ubuntu"),
                              color = "black", alpha = 0.7) +
  guides(size= FALSE)


p1

setwd("~/projects/2020/map/capitals/outputs/")
# dpi=screen -> resolution 572 x4 06
ggsave("p1-capseu-screen.png", p1,
       dpi = "screen")

ggsave("p1-capseu-def.png", p1)
# Image size      : 2384 x 1693
system("exiv2 p1-capseu-def.png")
system("convert p1-capseu-def.png -resize 50% half-p1-capseu-def.png")
# 1192x847 1192x847+0+0 8-bit sRGB 252659B
system("identify half-p1-capseu-def.png")
