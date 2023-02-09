### Grammer of graphics #####
aes = ashethics
ggplot = coding data


x= column name 
y= 
  
install.packages("palmerpenguins")
library(tidyverse)
library(palmerpenguins)


ggplot(data = penguins,
       mapping = aes(x = bill_depth_mm, # 
                     y = bill_length_mm,
                     color = species, 
                     size = body_mass_g,
                     alpha = flipper_length_mm)) +
  geom_point() +
  labs(title = "Bill depth and length",
       subtitle = "Dimension for Adelie, Chinstrap, and Gentoo Penguin",
       x = "Bill depth (mm)", y = "Bill length (mm)",
       color = "Species",
       caption = "Source: Palmer Station") +
  scale_color_viridis_d() +
  facet_grid(sex~species) +
  guides(color = FALSE)

ggplot()

