# rmarkdown::render("deprivation.Rmd", clean = FALSE)
knitr::knit("2021-02-26-eurostat.Rmd")



remotes::install_github("allisonhorst/palmerpenguins")
remotes::install_github("jbkunst/highcharter")
library(highcharter)
# remotes::install_github("allisonhorst/palmerpenguins")
data(penguins, package = "palmerpenguins")

hc <- hchart(penguins, "scatter", hcaes(x = flipper_length_mm, y = bill_length_mm, group = species))


export_hc(hc, filename = "hc_is.js", as = "is")
export_hc(hc, filename = "hc_vr.js", as = "variable", name = "objectname")
export_hc(hc, filename = "hc_ct.js", as = "container", name = "#selectorid")
