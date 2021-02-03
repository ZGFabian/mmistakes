# inspired by https://github.com/kjhealy/us_mortality_cdc
# https://kieranhealy.org/blog/archives/2020/09/24/us-excess-mortality/
# cf. https://twitter.com/kjhealy/status/1313276959263162368
# @kjhealy - Kieran Healy

library(tidyverse)
# library(extrafont)
# install.packages("showtext")
library(showtext)


here::here()
output_dir <- paste0("charts-", Sys.Date())
dir.create(output_dir)
# data source: https://www.ksh.hu/docs/hun/xstadat/xstadat_evkozi/e_wnh004a.html
# STADAT 1.2. Halálozások száma nemek és korcsoportok szerint, hetente(1/6)
# Note: I converted the downloaded xls outside R
df <- read.csv("data/weekly-total-deaths.csv")

df$Year <- as.character(df$Year)
df$Week <- as.integer(df$Week)
theme_grey_b <- function(base_size = 10, base_famiy = "") {
    theme_bw() %+replace%
    theme(
      text = element_text(family = "Hack"),
      panel.grid.major  = element_line(color = "white"),
      panel.background = element_rect(fill = "lightgrey"),
      panel.border = element_rect(color = "lightgrey", fill = NA),
      title = element_text(color = "#005577"),
      axis.line = element_line(color = "lightgrey"),
      axis.ticks = element_line(color = "lightgrey"),
      axis.text = element_text(color = "#005577"),
      axis.title = element_text(face = "bold", size = 12, color = "#005577"),
      strip.background = element_rect(color = "#005577", fill = "#005577"),
      strip.text.x = element_text(size = 11, color = "white"),
      legend.position = "top"
      )
}

# mycolors <- c(rep("gray70", 5), "firebrick")
p <- df %>%
  mutate(yr_ind = Year %in% "2020") %>%
  ggplot(aes(x = Week, y = Deaths, group = Year, color = yr_ind)) +
  geom_line(aes(size = yr_ind)) +
  scale_size_manual(values = c(0.7, 1.5)) +
  scale_color_manual(values = c("gray60", "firebrick"), labels = c("2015-2019", "2020")) +
  scale_y_continuous(labels = scales::comma) +
  scale_x_continuous(name = NULL,
                     breaks = c(8, 22, 35, 48),
                     labels = c("March", "June", "September", "December"),
                     minor_breaks = c(1,4,8,13,17,22,26,30,35,39,43,48,52),
                     limits = c(1,53))

p <- p + labs(title = "Weekly mortality in Hungary (2015-2020)",
            subtitle = "2020 data are for Weeks 1 to 36",
            y = "Total Deaths",
            caption = "@zoltangfabian / Data source: ksh.hu")
p <- p + guides(color = guide_legend(title = "Years"), size = "none")
p <- p + theme_grey_b()
p
png_name <- paste0(output_dir, "/hu-mortality-w36-", Sys.Date(), ".png")
jpg_name <- paste0(output_dir, "/hu-mortality-w36-", Sys.Date(), ".jpg")
ggsave(png_name, p, width = 25, height = 20, units = "cm")
ggsave(jpg_name, p, width = 25, height = 20, units = "cm")
library(magick)
png_img <- image_read(png_name)
print(png_img)
# image_display(png_img)
options(browser = "sxiv")
image_browse(png_img)
png350 <- image_scale(png_img, "350")
image_browse(png350)
print(png350)
image_write(image = png350, path = paste0(output_dir, "/hu-mortality-w36-small.png"))

df2 <- read.csv("data/monthly-deaths.csv")
glimpse(df2)
df2$Month
# Avoid sorting alphabetically - fix levels.
df2$Month <- factor(df2$Month, levels = unique(df2$Month))


# df2$Year <- as.character(df2$Year)
p2 <- df2 %>%
  mutate(yr_ind = Year %in% 2020) %>%
  ggplot(aes(x = Month, y = Rate_per_K, group = Year, color = yr_ind)) +
  geom_line(aes(size = yr_ind)) +
  scale_size_manual(values = c(0.7, 1.5)) +
  scale_color_manual(values = c("gray60", "firebrick"), labels = c("2015-2019", "2020")) +
  scale_y_continuous(labels = scales::comma) +
  scale_x_discrete(name = NULL, breaks = c("January", "March",
                                           "June", "September", "December"))
p2

p2 <- p2 + labs(title = "Monthly mortality rate in Hungary (2015.01-2020.08)",
#            subtitle = "2020 data are till August",
            y = "Deaths Rate per Thousands",
            caption = "@zoltangfabian / Data source: ksh.hu")
p2 <- p2 + guides(color = guide_legend(title = "Years"), size = "none")
p2 <- p2 + theme_grey_b()
p2
png_name <- paste0(output_dir, "/hu-mortality-rate-", Sys.Date(), ".png")
jpg_name <- paste0(output_dir, "/hu-mortality-rate-", Sys.Date(), ".jpg")
ggsave(png_name, p2, width = 25, height = 20, units = "cm")
ggsave(jpg_name, p2, width = 25, height = 20, units = "cm")
png_img <- image_read(png_name)
print(png_img)
# image_display(png_img)
# options(browser = "sxiv")
image_browse(png_img)
png350 <- image_scale(png_img, "350")
image_browse(png350)
print(png350)
image_write(image = png350, path = paste0(output_dir, "/hu-mortality-rate-small.png"))
