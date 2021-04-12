library(tidyverse)
library(ggthemes)
library(ggfx)
library(ggtext)
library(kimberlite)
# Weekly confirmed new cases per million OWID/JHU
# Az új fertőzöttek száma hetente*, egy millió főre vetítve
# A megelőző hét nap értékei összesítve

# "For all global data sources on the pandemic, daily data does not necessarily refer to the number of new confirmed cases on that day – but to the cases reported on that day.Since reporting can vary significantly from day to day – irrespectively of any actual variation of cases – it is helpful to look at changes from week to week. This provides a slightly clearer picture of where the pandemic is accelerating, slowing, or in fact reducing. The maps shown here provide figures on weekly and biweekly confirmed cases: one set shows the number of confirmed cases per million people in the previous seven (or fourteen) days (the weekly or biweekly cumulative total); the other set shows the growth rate over these periods." (https://ourworldindata.org/grapher/weekly-covid-cases-per-million-people?stackMode=absolute&time=latest&country=CAN~FRA~DEU~IND~GBR~USA&region=World)

jhu <- as_tibble(read.csv("https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/jhu/weekly_cases_per_million.csv"))
jhu$date <- as.Date(jhu$date)
glimpse(jhu)
jhu4 <- jhu %>%
  select(date, Czechia, Hungary, Poland, Slovakia) %>%
  pivot_longer(cols = c(Czechia, Hungary, Poland, Slovakia),
               names_to = "geo", values_to = "values")

jhu4 %>%
  group_by(geo) %>%
  summarise(mean=mean(values, na.rm=TRUE), n=n())



jhu4 %>%
  ggplot(aes(x=date, y=values, group=geo, color=geo)) +
  geom_line()


p <- jhu %>%
  select(date, Czechia, Hungary, Poland, Slovakia) %>%
  filter(date >= "2020-11-10") %>%
  ggplot(aes(x=date)) +
  geom_col(aes(y = Hungary), fill = "#02441d") +
  with_blur(
    geom_line(aes(y = Czechia), color = "#972d15", size = 3),
      sigma = unit(1, 'mm')
    ) +
    with_blur(
    geom_line(aes(y = Poland), color = "#f47735", size = 3),
      sigma = unit(1, 'mm')
    ) +
    with_blur(
    geom_line(aes(y = Slovakia), color = "#005577", size = 3),
      sigma = unit(1, 'mm')
    ) +
#  theme_wsj() +
  theme_kimberlite() +
  labs(title = "Cummulative weekly new COVID-19 cases per million",
       subtitle = "<span style='color:#02441d'>**Hungary**</span> compared to <span style='color:#972d15;'>**CZ**</span>, <span style='color:#f47735';>**PL**</span> and <span style='color:#005577;'>**SK**</span> since 2020-11-10",
       caption = "<span style='color:white;'>**data source: OWID|JHU**</span>") +
#  scale_x_date(date_breaks = "4 weeks", date_labels = "%Y-%m-%d") +
  scale_x_date(breaks = as.Date(c("2020-11-10", "2020-12-10", "2021-01-10", "2021-02-10", "2021-03-05"))) +
  theme(
#    plot.title.position = "plot",
    plot.subtitle = element_textbox_simple(
#      size = 13,
      lineheight = 1,
      padding = margin(5.5, 5.5, 5.5, 5.5),
      margin = margin(0, 0, 5.5, 0),
      fill = "lightgrey"
    ),
    plot.caption = element_textbox(
      size = 12,
      lineheight = 1,
      padding = margin(5.5, 5.5, 5.5, 5.5),
      margin = margin(0, 0, 5.5, 0),
      fill = "#005577"
    ),
    axis.title = element_blank()
  )
p

labelDF <- data.frame(
  x = as.Date(c("2021-02-20", "2021-02-20", "2021-02-20")),
  y = c(4100, 1500, 500),
  labels = c("CZ", "SK", "HU")
)



max(jhu$date)
# alpha(c("#02441d", "#972d15", "#f47735", "#005577"), alpha = 0.8)

p2 <- jhu %>%
  select(date, Czechia, Hungary, Poland, Slovakia) %>%
  filter(date >= "2020-11-10") %>%
  ggplot(aes(x=date)) +
  geom_area(aes(y = Czechia), fill = "#972d15", alpha = 0.8) +
  geom_area(aes(y = Poland), fill = "#f47735", alpha = 0.8) +
  geom_area(aes(y = Slovakia), fill = "#005577", alpha = 0.8) +
  geom_col(aes(y = Hungary), fill = "#02441d", alpha =0.8, show.legend = TRUE) +
  scale_x_date(breaks = as.Date(c("2020-11-10", "2020-12-10", "2021-01-10", "2021-02-10", "2021-03-10"))) +
  labs(title = "Cummulative weekly new COVID-19 cases per million",
      subtitle = "<span style='color:#02441d'>**Hungary**</span> compared to <span style='color:#972d15;'>**CZ**</span>, <span style='color:#f47735';>**PL**</span> and <span style='color:#005577;'>**SK**</span> since 2020-11-10",
      caption = "<span style='color:white;'>**@magnachart (data source: OWID|JHU)**</span>",
      fill = "name1") +
  theme_kimberlite() +
  theme(axis.title = element_blank(),
        plot.subtitle = element_textbox_simple(
        lineheight = 1,
        padding = margin(5.5, 5.5, 5.5, 5.5),
        margin = margin(0, 0, 5.5, 0),
        fill = "lightgrey"
        ),
        plot.caption = element_textbox(
        size = 12,
        lineheight = 1,
        padding = margin(5.5, 5.5, 5.5, 5.5),
        margin = margin(0, 0, 5.5, 0),
        fill = "#005577"
        )
  )
p2
ggsave("_tmp/v4v.svg", p2, width = 15, height = 11, dpi = 320)
ggsave("_tmp/v4v.png", p2, width = 15, height = 11, dpi = 320)


jhu %>%
  select(date, Czechia, Hungary, Poland, Slovakia) %>%
  filter(date >= "2020-11-10") %>%
  ggplot(aes(x=date)) +
#  geom_area(aes(y = Czechia), fill = "#972d15", alpha = 0.8) +
  geom_area(aes(y = Poland), fill = "#f47735", alpha = 0.8) +
#  geom_area(aes(y = Slovakia), fill = "#005577", alpha = 0.8) +
  geom_col(aes(y = Hungary), fill = "#02441d", alpha =0.8, show.legend = TRUE) +
  scale_x_date(breaks = as.Date(c("2020-11-10", "2020-12-10", "2021-01-10", "2021-02-10", "2021-03-05"))) +
  labs(title = "Cummulative weekly new COVID-19 cases per million",
      subtitle = "<span style='color:#02441d'>**Hungary**</span> compared to <span style='color:#972d15;'>**CZ**</span>, <span style='color:#f47735';>**PL**</span> and <span style='color:#005577;'>**SK**</span> since 2020-11-10",
      caption = "<span style='color:white;'>**@magnachart (data source: OWID|JHU)**</span>",
      fill = "name1") +
  theme_kimberlite() +
  theme(axis.title = element_blank(),
        plot.subtitle = element_textbox_simple(
        lineheight = 1,
        padding = margin(5.5, 5.5, 5.5, 5.5),
        margin = margin(0, 0, 5.5, 0),
        fill = "lightgrey"
        ),
        plot.caption = element_textbox(
        size = 12,
        lineheight = 1,
        padding = margin(5.5, 5.5, 5.5, 5.5),
        margin = margin(0, 0, 5.5, 0),
        fill = "#005577"
        )
  )





str(p)
rlang::last_error()
rlang::last_trace()

ggsave("_tmp/v4v.svg", p, width = 15, height = 11, dpi = 320)
ggsave("_tmp/v4v.png", p, width = 15, height = 11, dpi = 320)


tail(jhu)
library(gridtext)
gridtext::textbox_grob
jhu4 %>%
  filter(date >= "2020-11-10") %>%
  ggplot(aes(date, values, group = geo, fill = geo, color = geo)) +
#  geom_col(alpha = 0.9) +
  geom_line() +
  theme_wsj() +
  scale_color_wsj(palette = "rgby")
#  scale_fill_wsj(palette = "rgby")

wsj_pal(palette = "rgby")(4)
?guides()
?scale_color_wsj




remotes::install_github("thomasp85/ggfx")

# library(ggfx)
vignette(package = "ggfx")

ggplot(mtcars, aes(x = mpg, y = disp)) +
  with_blur(
    geom_point(),
    sigma = unit(1, 'mm')
  ) +
  geom_smooth()

p <- ggplot(mtcars, aes(x = mpg, y = disp)) +
  geom_point() +
  geom_smooth()
with_blur(p, sigma = unit(1, 'mm'))

library(grid)
circle_left <- circleGrob(x = 0.25, y = 0.5, r = 0.2)
circle_right <- with_blur(circleGrob(x = 0.75, y = 0.5, r = 0.2),
                          sigma = unit(1, 'mm'))
grid.newpage()
grid.draw(circle_left)
grid.draw(circle_right)



?ggfx

jhu4 %>%
  filter(date > "2020-09-01") %>%
  ggplot(aes(x=date, y=values, group=geo, color=geo, size=geo)) +
  scale_color_wsj() +
  theme_wsj() +
  scale_x_date(breaks = "4 weeks", minor_breaks = "1 weeks") +
  geom_line() +
  scale_size_manual(values = c(1.5,3,1.5,1.5))

jhu4 %>%
  filter(geo == "Hungary" & date >= "2021-02-01")

ggplot(mtcars, aes(disp, mpg)) +
  geom_point() +
  labs(
    title = "<b>Fuel economy vs. engine displacement</b><br>
    <span style = 'font-size:10pt'>Lorem ipsum *dolor sit amet,*
    consectetur adipiscing elit, **sed do eiusmod tempor incididunt** ut
    labore et dolore magna aliqua. <span style = 'color:red;'>Ut enim
    ad minim veniam,</span> quis nostrud exercitation ullamco laboris nisi
    ut aliquip ex ea commodo consequat.</span>",
    x = "displacement (in<sup>3</sup>)",
    y = "Miles per gallon (mpg)<br><span style = 'font-size:8pt'>A measure of
    the car's fuel efficiency.</span>"
  ) +
  theme(
    plot.title.position = "plot",
    plot.title = element_textbox_simple(
      size = 13,
      lineheight = 1,
      padding = margin(5.5, 5.5, 5.5, 5.5),
      margin = margin(0, 0, 5.5, 0),
      fill = "cornsilk"
    ))
