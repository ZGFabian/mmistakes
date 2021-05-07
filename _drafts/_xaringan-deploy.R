options(browser = "surf")
getwd()
rmarkdown::render(input = 'xaringan.Rmd',
                  output_format = 'xaringan::moon_reader',
                  output_file = "xaringan-prez.html",
                  output_dir = "../static/xaringan-prez/",
                  clean = FALSE)


# install.packages("pagedown")

# Download from: https://github.com/gnab/remark/tree/gh-pages/downloads
# xaringan::summon_remark(version = "0.14.1", to = "../assets/js/")

?xaringan::moon_reader
# chrome_print requires chrome or derivates like brave

Sys.setenv(PAGEDOWN_CHROME = "/usr/bin/brave")
# weird port error
# pagedown::chrome_print("../static/xaringan-prez/xaringan-prez.html")
# if url specified, output should be set unless it is working folder.
pagedown::chrome_print("http://127.0.0.1:4000/mmistakes/static/xaringan-prez/xaringan-prez.html",
                       output = "../static/xaringan-prez/xaringan-prez.pdf")
