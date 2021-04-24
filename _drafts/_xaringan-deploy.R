options(browser = "surf")
getwd()
rmarkdown::render(input = 'xaringan.Rmd',
                  output_format = 'xaringan::moon_reader',
                  output_file = "xaringan-prez.html",
                  output_dir = "../static/xaringan-prez/",
                  clean = FALSE)

# install.packages("pagedown")


# chrome print_requires chrome or derivates like brave

Sys.setenv(PAGEDOWN_CHROME = "/usr/bin/brave")
