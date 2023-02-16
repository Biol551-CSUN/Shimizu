### Today we are going to plot penguin data ###

### Load Libraries ###
library(tidyverse)
library(palmerpenguins)
library(here)


### Load Data #####
# The data is part of the package and is called penguins
glimpse(penguins)

filter(.data = penguins, 
       sex == "female")

filter(.data = penguins,
       year == "2008")

filter(.data = penguins,
       body_mass_g > 5000,
       sex == "female")

filter (.data = penguins,
        year == "2008" |
        year == "2009")

filter (.data = penguins,
        island != "Dream")

filter (.data = penguins,
        species == "Adelie" |
        species == "Gentoo")


#### c() means 


### when i want to 
filter(.data=penguins,
       body_mass_g )


##### Add a new column converting body mass in g to kg and save the new dataframe

data2 <- mutate(.data=penguins,
                #### body_mass_kg = body_mass_g/1000,
                ### bill_length_depth = bill_length_mm/bill_depth_mm,
                after_2008 = ifelse(year>2008, "After 2008", "Before 2008"))

view(data2)



data3 <- mutate(.data=penguins,
                mudkip = flipper_length_mm + body_mass_g)
view(data3)


data4 <- mutate(.data=penguins,
                chicken = ifelse(body_mass_g > 4000, "big", "small"))


view(data4)


Torchick <- penguins %>%
  filter(sex == "female")%>%
  mutate(log_mass = log(body_mass_g))

view(Torchick)



treeko <- penguins %>% # use penguin dataframe
  filter(sex == "female") %>% #select females
  mutate(log_mass = log(body_mass_g)) %>% #calculate log biomass
  select(Species = species, island, sex, log_mass) ## selects the column

view(treeko)

pikachu <- penguins%>%
  group_by(island, sex) %>%
  summarize(mean_flipper = mean(flipper_length_mm, na.rm = TRUE),
            min_flipper = min(flipper_length_mm, na.rm = TRUE))%>%
  drop_na()

view(pikachu)

#### na.rm = TRUE removes the NAs 
#### group_by = groups the column
#### drop_na = drops all the NAby column or whole thing 

penguins%>%
  drop_na(sex)%>%
  ggplot()


install.packages("devtools")
library(devtools)
devtools::install_github("jollist/dadjokeapi")
library("dadjoke")


hollywood <- penguins%>%
  drop_na()%>%
  group_by(species, island, sex)%>%
  summarize(mean_body_mass_g = mean(body_mass_g, na.rm = TRUE),
            varience_body_mass = var(body_mass_g, na.rm = TRUE))





ggsave()


northridge <- penguins%>%
  drop_na()%>%
  filter(sex == "female")%>%
  mutate(log_body_mass_g = log(body_mass_g))%>%
  select(species, island, sex, log_body_mass_g)%>%
  ggplot(mapping = aes(x=species, 
                       y =log_body_mass_g)) +
  geom_boxplot() +
  labs(x="species",
       y="log body mass")
  



northridge







  
  