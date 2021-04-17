setwd("~/projects/2020/jekyll/mmistakes/_drafts/")

rmarkdown::render(input = 'xaringan.Rmd',
                  output_format = 'xaringan::moon_reader',
                  output_file = "xaringan-test.html",
                  output_dir = "../static/")


names(xaringan:::list_css())


# list.dirs()
