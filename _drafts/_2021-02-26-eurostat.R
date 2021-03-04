## ---- setup, include=FALSE--------------------------------------------------------------------------------------------
#knitr::opts_chunk$set(fig.width = 7, fig.height = 7, fig.path="../assets/img/21-02-22-eurostat/")
#knitr::purl("2021-02-26-eurostat.Rmd", "_2021-02-26-eurostat.R")


## ---- libs, echo=TRUE, message=FALSE, results=FALSE-------------------------------------------------------------------
library(tidyverse)
library(eurostat)
# devtools::install_github("zgfabian/kimberlite")
library(kimberlite)
library(showtext)
library(grid)
library(patchwork)
library(ggthemes)

font_add_google("Gochi Hand", "gochi")
font_add_google("Schoolbell", "bell")
font_add_google("Caveat", "caveat")
showtext.auto()
## ---- p1, include=TRUE, message = FALSE-------------------------------------------------------------------------------
df <- get_eurostat("ilc_mddd12", time_format = "num")
v4 <- c("CZ", "HU", "PL", "SK")
df1 <- df %>%
  filter(time >= 2005 & wstatus == "POP" &
         age == "Y_GE18" & geo %in% v4 &
         sex == "T")
p1 <- df1 %>%
  ggplot(aes(time, values, color = geo, shape = geo)) +
  geom_line(size = 1) +
  geom_point(size = 3) +
  labs(# title = "Súlyos anyagi depriváció mértéke a V4 országokban, 2005-2019",
       subtitle = "a 18 évesnél idősebb népesség százalékában"
    #     caption = "adatforrás: Eurostat(ilc_mddd12)"
  ) +
  scale_color_wsj() +
  theme_wsj() +
  theme(axis.title = element_blank(), legend.title = element_blank(),
        text = element_text(family = "caveat", size = 22),
        plot.subtitle = element_text(size = 26, family = "caveat"),
        legend.text = element_text(size = 26),
        panel.grid.major.x = element_line(linetype = 3))
        )
p1

## ---- kbl, echo = FALSE, results="asis"-------------------------------------------------------------------------------
df1 %>%
  #  filter(geo == "HU") %>%
  pivot_wider(names_from = geo, values_from = values) %>%
  select(-wstatus, -age, -sex) %>%
  arrange(time) %>%
  knitr::kable(., caption = "SMDR between 2005-2019")


t1 <- df1 %>%
  #  filter(geo == "HU") %>%
  pivot_wider(names_from = geo, values_from = values) %>%
  select(-wstatus, -age, -sex) %>%
  arrange(time)
# write.csv(t1, "tmp/t1.csv")

t1$CZ*100/t1$CZ[[1]]
t1[,2]*100/t1$CZ[[1]]
t1[,2]*100/t1[[1,2]]
t2 <- cbind(t1[,1],
      t1[,2]*100/t1[[1,2]],t1[,3]*100/t1[[1,3]],
      t1[,4]*100/t1[[1,4]],t1[,5]*100/t1[[1,5]]
      )

t3 <- pivot_longer(t2, cols = c(CZ, HU, PL, SK), names_to = "geo", values_to = "values")
p2 <- t3 %>%
  ggplot(aes(time, values, color = geo, shape = geo)) +
  geom_line(size = 1) +
  geom_point(size = 3) +
  labs(# title = "Severe material deprivation rate in V4 countries, 2005-2019",
       subtitle = "2005=100"
    #       caption = "data source: Eurostat"
  ) +
  scale_y_continuous(position = "right") +
  scale_color_wsj() +
  theme_wsj() +
  theme(plot.subtitle = element_text(hjust = 1)) +
  theme(axis.title = element_blank(), legend.title = element_blank(),
        text = element_text(family = "caveat", size = 22),
        plot.subtitle = element_text(size = 26, family = "caveat"),
        legend.text = element_text(size = 26),
        panel.grid.major.x = element_line(linetype = 3))
p2

ggsave("p2.png", width = 8, height = 6, units = "in", dpi = 200)


toc <- get_eurostat_toc()

toc %>%
  DT::datatable(width="100%",class='compact stripe hover row-border order-column',
                rownames=FALSE,options= list(paging = TRUE, searching = TRUE,info=TRUE))


pw <- p1 + p2 +
  plot_layout(guides = "collect")
pw <- pw + plot_annotation(
       title = "Súlyos anyagi depriváció a V4 országokban, 2005-2019",
       caption = "Adatforrás: Eurostat (ilc_mddd12)") &
  theme(plot.title = element_text(family = "caveat", size = 36, face = "bold", colour = "#972d15"),
        plot.caption = element_text(family = "caveat", size = 22, colour = "#972d15"),
        legend.position = "bottom")
pw

ggsave("tmp/depriv.svg", pw, width = 15, height = 9, dpi = 200)

g1 <- grid::textGrob("Hello World", gp = gpar(fontfamily = "caveat", fontsize = 20))
g2 <- grid::grid.circle(gp = gpar(fill='red'))

g1+g2
pw  g1

p1 +



library(grid)
vp <- viewport(width=0.5, height=0.5, clip  = "on")
grid.circle(0.5,0,r=0.5, gp = gpar(fill = 'red'), vp = vp)

     clip.demo <- function(i, j, clip1, clip2) {
       pushViewport(viewport(layout.pos.col=i,
                              layout.pos.row=j))
       pushViewport(viewport(width=0.6, height=0.6, clip=clip1))
       grid.rect(gp=gpar(fill="white"))
       grid.circle(r=0.55, gp=gpar(col="red", fill="pink"))
       popViewport()
       pushViewport(viewport(width=0.6, height=0.6, clip=clip2))
       grid.polygon(x=c(0.5, 1.1, 0.6, 1.1, 0.5, -0.1, 0.4, -0.1),
                    y=c(0.6, 1.1, 0.5, -0.1, 0.4, -0.1, 0.5, 1.1),
                    gp=gpar(col="blue", fill="light blue"))
       popViewport(2)
     }

     grid.newpage()
     grid.rect(gp=gpar(fill="grey"))
     pushViewport(viewport(layout=grid.layout(2, 2)))
     clip.demo(1, 1, FALSE, FALSE)
     clip.demo(1, 2, TRUE, FALSE)
     clip.demo(2, 1, FALSE, TRUE)
     clip.demo(2, 2, TRUE, TRUE)
     popViewport()
     # Demonstrate turning clipping off
     grid.newpage()
     pushViewport(viewport(w=.5, h=.5, clip="on"))
     grid.rect()
     grid.circle(r=.6, gp=gpar(lwd=10))
     pushViewport(viewport(clip="inherit"))
     grid.circle(r=.6, gp=gpar(lwd=5, col="grey"))
     pushViewport(viewport(clip="off"))
     grid.circle(r=.6)
     popViewport(3)
     # Demonstrate vpList, vpStack, and vpTree
     grid.newpage()
     tree <- vpTree(viewport(w=0.8, h=0.8, name="A"),
                    vpList(vpStack(viewport(x=0.1, y=0.1, w=0.5, h=0.5,
                                            just=c("left", "bottom"), name="B"),
                                   viewport(x=0.1, y=0.1, w=0.5, h=0.5,
                                            just=c("left", "bottom"), name="C"),
                                   viewport(x=0.1, y=0.1, w=0.5, h=0.5,
                                            just=c("left", "bottom"), name="D")),
                           viewport(x=0.5, w=0.4, h=0.9,
                                    just="left", name="E")))
     pushViewport(tree)
     for (i in LETTERS[1:5]) {
       seekViewport(i)
       grid.rect()
       grid.text(current.vpTree(FALSE),
                 x=unit(1, "mm"), y=unit(1, "npc") - unit(1, "mm"),
                 just=c("left", "top"),
                 gp=gpar(fontsize=8))
     }
