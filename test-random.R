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
  geom_boxplot() + labs(title="SNP & INDEL & FILTER=PASS", x ="", y="")

p <- p + theme_classic()
p <- p + theme_transparent()

sticker(p, package="vcfppR", p_family = "Limelight",
        p_size=20, s_x=0.9, s_y=.7, s_width=1.3, s_height=1.1,
        filename="vcfppR.png", h_fill = "red", h_color = "orange")
dev.off()
