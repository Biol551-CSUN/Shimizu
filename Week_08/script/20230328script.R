library(tidyverse)
library(here)
library(patchwork)
library(ggrepel)
library(gganimate)
library(magick)
library(palmerpenguins)

# plot 1
p1<-penguins%>%
  ggplot(aes(x=body_mass_g,
             y=bill_length_mm,
             color=species))+
  geom_point()

p1



#plot 2

p2<-penguins%>%
  ggplot(aes(x=sex,
             y=body_mass_g,
             color=species))+
  geom_jitter(width=0.2)

p2


p1+p2+
  plot_layout(guides='collect')+  # makes 
  plot_annotation(tag_levels='I')  # add labels

p1/p2+
  plot_layout(guides='collect')+  # when the  
  plot_annotation(tag_levels='I') # add labels

view(mtcars)


ggplot(mtcars, aes(x=wt,
                   y=mpg,
                   label = rownames(mtcars)))+
  geom_text()+ #creates a text label
  geom_point(color="red")

ggplot(mtcars, aes(x=wt,
                   y=mpg,
                   label = rownames(mtcars)))+
  geom_text_repel()+ #repels the text away from the point
  geom_point(color="red")

geom_label_repel() # adds a box on your words


penguins%>%
  ggplot(aes(x=body_mass_g,
             y=bill_length_mm,
             color=species)) +
  geom_point()+
  transition_states(year, #what are we animating by
                    transition_length = 2, # the relativelength of the transition.
                    state_length = 1, # the transution length
                    )+
  ease_aes("sine-in-out")+
  ggtitle('Year: {closest_state}')+
  anim_save(here("Week_08","output","myfirstgif.gif"))

penguin<-image_read("https://pngimg.com/uploads/penguin/pinguin_PNG9.png")
penguin

penguins %>%
  ggplot(aes(x = body_mass_g, 
             y = bill_depth_mm, 
             color = species)) +
  geom_point()+
  ggsave(here("Week_08","output","penguinplot.png"))

penplot<-image_read(here("Week_08","output","penguinplot.png"))
out <- image_composite(penplot, penguin, offset = "+70+30")
out


remotes::install_github("andrewheiss/sourrr")
library(sourrr)
build_recipe(final_weight = 900, hydration = 0.75)
