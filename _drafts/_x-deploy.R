options(browser = "surf")
rmarkdown::render(input = 'xaringan.Rmd',
                  output_format = 'xaringan::moon_reader',
                  output_file = "xaringan-test.html",
                  output_dir = "../static/")

# install.packages("pagedown")


# chrome print_requires chrome or derivates like brave

Sys.setenv(PAGEDOWN_CHROME = "/usr/bin/brave")
pagedown::chrome_print("https://zgfabian.github.io/mmistakes/static/xaringan-test.html")
