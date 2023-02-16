### Homework for 20230216 Penguin Plot using %>%  ######
### Library open ########
library(tidyverse)
library(palmerpenguins)
library(here)
library(ggplot2)
library()

#### Load Data ################

glimpse(penguins)

hollywood <- penguins%>%
  drop_na()%>%
  group_by(species, island, sex)%>%
  summarize(mean_body_mass_g = mean(body_mass_g, na.rm = TRUE),
            varience_body_mass = var(body_mass_g, na.rm = TRUE))


view(hollywood)





northridge <- penguins%>%
  drop_na()%>%
  filter(sex == "female")%>%
  mutate(log_body_mass_g = log(body_mass_g))%>%
  select(species, island, sex, log_body_mass_g)
  
  ggplot(data = northridge, 
         mapping = aes(x=island, 
                       y =log_body_mass_g)) +
  geom_boxplot() +
  labs(x="island",
       y="log body mass")
  
  ggsave(here("Homework","output","Island_and_log_body_mass_output.png"))




view(northridge)

