library(highcharter)
# remotes::install_github("allisonhorst/palmerpenguins")
data(penguins, package = "palmerpenguins")

hc <- hchart(penguins, "scatter", hcaes(x = flipper_length_mm, y = bill_length_mm, group = species)) %>%
  hc_xAxis(title = list(text = "x Axis at top"))

# export_hc(hc, filename = "hc_is.js", as = "is")
# export_hc(hc, filename = "hc_vr.js", as = "variable", name = "objectname")
# export_hc(hc, filename = "hc_ct.js", as = "container", name = "#selectorid")

x <- rep(2015:2020,1)
y <- c(1:6)
group <- rep(c("A","B"),3)
df<-data.frame(x=x,y=y,group=group)
# OK
hchart(df,"scatter", hcaes(x=x,y=y,group=group))
