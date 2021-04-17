setwd("~/projects/2020/jekyll/mmistakes/_drafts/")
# knitr::knit(input = "xaringan.Rmd")
rmarkdown::render(input = 'xaringan.Rmd',
                  output_format = 'xaringan::moon_reader',
                  output_file = "xaringan-test.html",
                  output_dir = "../static/")

# list.dirs()
