library(tidyverse)
library(here)

tuesdata <- tidytuesdayR::tt_load(2021, week = 7)
income_mean<-tuesdata$income_mean
income_mean <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2021/2021-02-09/income_mean.csv')

fruits<-factor(c("Apple", "Grape", "Banana"))
fruits


test<-c("A", "1", "2")
as.numeric(test)

test<-factor(test) # covert to factor
as.numeric(test)

glimpse(starwars)

s_count<-starwars %>% 
  filter(!is.na(species)) %>% # remove the NAs
  mutate(species = fct_lump(species, n = 3)) %>%
  count(species)

# if youu want the visualization tto be in increaseing order then use fact_reorder
s_count%>%
  ggplot(aes(x= fct_reorder(species,n), y = n))+
  geom_col()

# if you want the visualization tto be in decreasing order then use .desc = TRUE

s_count %>%
  ggplot(aes(x = fct_reorder(species, n, .desc = TRUE), y = n))+ # reorder the factor of species by n
  geom_col() +
  labs(x = "Species")


glimpse(income_mean)

total_income<-income_mean %>%
  group_by(year, income_quintile)%>%
  summarise(income_dollars_sum = sum(income_dollars))%>%
  mutate(income_quintile = factor(income_quintile)) # make it a factor

total_income%>%
  ggplot(aes(x = year, y = income_dollars_sum, color = fct_reorder2(income_quintile, year, income_dollars_sum)))+
  geom_line()+
  labs(color = "income_quantile")


starwars_clean<-starwars %>% 
  filter(!is.na(species)) %>% # remove the NAs
  count(species, sort = TRUE) %>%
  mutate(species = factor(species)) %>% # make species a factor
  filter(n>3) # only keep species that have more than 3
starwars_clean

levels(starwars_clean$species)

# if you want to dop the eztra levels then use drop na

starwars_clean<-starwars %>% 
  filter(!is.na(species)) %>% # remove the NAs
  count(species, sort = TRUE) %>%
  mutate(species = factor(species)) %>% # make species a factor
  filter(n>3)%>% # only keep species that have more than 3
  droplevels()

# when you want to rename the level for example human to humanoid then 
# mutate = fct_recode(new name = old names) 

starwars_clean<-starwars %>% 
  filter(!is.na(species)) %>% # remove the NAs
  count(species, sort = TRUE) %>%
  mutate(species = factor(species)) %>% # make species a factor 
  filter(n>3)  %>% # only keep species that have more than 3 
  droplevels() %>% # drop extra levels 
  mutate(species = fct_recode(species, "Humanoid" = "Human"))


charcter 