plot1 <- ggplot(data=penguins,
       mapping = aes (x=bill_depth_mm,
                      y=bill_length_mm,
                      group = species,
                      color = species)) +
geom_point() +
  geom_smooth(method = "lm") +
  labs(x="Bill depth (mm)",
       y="Bill length (mm)") +
  scale_color_viridis_d() +
  scale_x_continuous(breaks = c(14,17,21),
  label = c("low","medium","high")) +
  scale_color_manual(values = beyonce_palette(44)) +
  coord_flip() + # flips x and y axes
  coord_fixed() + # fixed axes
  theme_bw() +
  theme(axis.title = element_text(size=20,
                                  color="red"),
  panel.background = element_rect(fill="gray"), 
  panel.grid = element_line(color="blue"))

ggsave(here("Week_03","output","penguin.png"),
       width = 7, height = 5)

  
?theme
  
  
  coord_polar("x") #makes the polar








install.packages('devtools')
install_github("dill/beyonce")
devtools::install_github("dill/beyonce")
library(beyonce)


