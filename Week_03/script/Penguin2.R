library(palmerpenguins)
library(tidyverse)
library(here)
install.packages('palettetown')
library(palettetown)
glimpse(penguins)

#######################################


ggplot(data=penguins,
       mapping = aes (x=bill_depth_mm,
                      y=bill_length_mm,
                      group = species,
                      color = species))


ggplot (data=penguins, 
        mapping = aes (x=sex ))



ggplot(data=penguins,
       mapping = aes (x=body_mass_g,
                      y=species,
                      group = species,
                      color = species)) +
  geom_point() +
  geom_smooth(method = "") +
  labs(x="Body mass (g)",
       y="species") +
  scale_color_viridis_d() +
  scale_x_continuous((label = c("small","average","big"))) +
  scale_color_manual(values = beyonce_palette(44)) +
  coord_flip() + # flips x and y axes
  coord_fixed() + # fixed axes
  theme_bw() +
  theme(axis.title = element_text(size=20,
                                  color="red"),
        panel.background = element_rect(fill="gray"), 
        panel.grid = element_line(color="blue"))
