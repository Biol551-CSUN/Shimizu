### I am learning how to ggplot
### Created by: Nicole Ayala
### Created on: 2023-02-09
#####################################################################
### Load libraries #######
library(tidyverse)
library(palmerpenguins)
library(here)
library(ggpubr)
library('devtools')
### time to use ggplot ###### 
glimpse(penguins)
ggplot(data = penguins, 
       mapping = aes(x = flipper_length_mm, 
                     y = species,
                     fill = species)) + 
  geom_boxplot() +
  coord_flip() +
  labs(x = "Flipper Length (mm)", y = "Species", title = "Flipper Length in Various Species") +
  scale_fill_manual(values = beyonce_palette(3)) +
  # theme_cleveland() +
  theme(axis.title = element_text(size = 14,
                                  color = "red"),
        panel.background = element_rect(fill = "beige"))


ggsave(here("Week_03","Output","penguin2.png"))
