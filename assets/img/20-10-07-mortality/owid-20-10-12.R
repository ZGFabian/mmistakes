here::here()
output_dir <- paste0("charts-", Sys.Date())
dir.create(output_dir)

# COVID-19 daily new cases plot with custom theme
# Data source: https://ourworldindata.org/
library(tidyverse)
library(showtext)
ow <- read_csv("https://raw.githubusercontent.com/owid/covid-19-data/master/public/data/owid-covid-data.csv")
glimpse(ow)
cf <- c("Hungary", "Czech Republic", "Slovakia", "United States",
        "Austria", "Croatia", "Slovenia", "Serbia",
        "Romania", "Ukraine")
df <-  ow %>%
  select(location, date, new_cases) %>%
  filter(location %in% cf & date > "2020-03-15")
head(df)
p <- df %>%
  ggplot(aes(x = date, y = new_cases)) +
  geom_col(alpha = 0.4) +
  geom_smooth(method = "loess", se = FALSE) +
  scale_y_continuous(name = "daily new cases on log10 scale", trans = "log10") +
  facet_wrap(~ location, nrow = 2)
p
# Create a new theme
theme_grey_b <- function(base_size = 10, base_family = "") {
    theme_bw() %+replace%
    theme(
      text = element_text(family = "Georgia"),
      panel.grid.major  = element_line(color = "white"),
      panel.background = element_rect(fill = "lightgrey"),
      panel.border = element_rect(color = "lightgrey", fill = NA),
      title = element_text(color = "#005577"),
      axis.line = element_line(color = "lightgrey"),
      axis.ticks = element_line(color = "lightgrey"),
      axis.text = element_text(color = "#005577"),
      axis.title = element_text(face = "bold", size = 12, color = "#005577"),
      strip.background = element_rect(color = "#005577", fill = "#005577"),
      strip.text.x = element_text(size = 11, color = "white")
      )
}
p <- p + theme_grey_b()
p <- p + labs(title = "Trend and number of daily new COVID-19 cases",
         subtitle = paste("Selected countries since 2020-03-16 plotted on", Sys.Date()),
         caption = "@ZoltanGFabian / Data source: ourworldindata.org")
p

png_name <- paste0(output_dir, "/c19-cases-", Sys.Date(), ".png")
jpg_name <- paste0(output_dir, "/c19-cases-", Sys.Date(), ".jpg")
ggsave(png_name, p, width = 25, height = 20, units = "cm")
ggsave(jpg_name, p, width = 25, height = 20, units = "cm")
library(magick)
png_img <- image_read(png_name)
print(png_img)
image_display(png_img)
options(browser = "sxiv")
image_browse(png_img)
png350 <- image_scale(png_img, "350")
image_browse(png350)
print(png350)
# system('zsh -c "convert c19-cases.png -resize 350 c19-cases-small.png"')
sessionInfo()
