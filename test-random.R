load("vcfppR.RData")

library(hexSticker)
library(ggplot2)

library(showtext)
## Loading Google fonts (http://www.google.com/fonts)
font_add_google("Roboto")
font_add_google("Limelight")
font_add_google("Federo")
## Automatically use showtext to render text for future devices
showtext_auto()

names(o)

d <- data.frame(x = unlist(o), 
                pop = rep(names(o),times = sapply(o,length)))

p <- ggplot(d, aes(x = pop, y = x)) + 
  geom_boxplot() + labs(title="", x ="", y="")

p <- p + theme_classic()
p <- p + theme_transparent()

print(p)

sticker(p, package="vcfppR", p_family = "Roboto", p_color = "#237d1a",
        p_size=32, s_x=0.85, s_y=.65, s_width=1.3, s_height=1.3,
        filename="vcfppR.png", h_color = "#1f6918", h_fill = "#edaa4c", h_size = 2.2)

dev.off()

sticker("~/Downloads/quilt-logo.tiff", package="QUILT2", 
        p_size=20, s_x=0.8, s_y=.75, s_width=0.8, s_height=1.0,
        filename="QUILT2.png")

?sticker
