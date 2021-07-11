# install.package("pacman")
pacman::p_load(ggplot2, magick) # this will load (and install if required) libraries
p <- ggplot(mtcars, aes(wt, mpg, color = as.factor(cyl))) +
  geom_point()
p
dev.off()
ggsave("p.png", p)
## Saving 7 x 7 in image
system(command = "file p.png")
## p.png: PNG image data, 2100 x 2100, 8-bit colormap, non-interlaced
system(command = "identify p.png")
## p.png PNG 2100x2100 2100x2100+0+0 8-bit sRGB 256c 45338B 0.000u 0:00.015

## show saved file size and other info
file.size(pattern = "p.png") ## in 45511 B (byte)
file.info(pattern = "p.png") ## other file info (group, modiification time, etc)

## the following command throws:
## Error: The 'image' argument is not a magick image object.
image_resize(image = "p.png", geometry = "800x800")
# first we should create an image object by reading
im1 <- image_read(path = "p.png")
im2 <- image_resize(image = im1, geometry = "800x800")
print(im2)
# X11 only
image_display(im2)
image_write(im2, path = "p_resized.png")
system("xdg-open p_resized.png")
## System dependent
options(browser = "firefox")
image_browse(image = im2)
## running system command from imagemagick tool:
system("convert -geometry 800x p.png p_800x.png")
