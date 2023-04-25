# Loading the libraries
library(tidyverse)
library(here)
library(tidytuesdayR)
library(janitor)

# loading the data
intertidal_data <- read_csv(here("Week_11","data","intertidaldata.csv")) # loads the Data
intertidal_data_latitude <- read.csv(here("Week_11", "data","intertidaldata_latitude.csv"))
view(intertidal_data) # views the data
view(intertidal_data_latitude)

# going to work with intertidal_data figuring out how much algae there are in each site.


intertidal_data_scripps_dana_point_crystal_cove <- intertidal_data%>% # loads the data that I want 
  filter(Site == "Scripps")%>% # filters out the data that is needed
  mutate(Quadrat= str_replace_all(Quadrat, pattern = "[0-9]|\\.", replacement = "")) %>% # replaces all of the numbers and periods in the 
  mutate(Quadrat= str_trim(Quadrat))%>%
  mutate(Quadrat= factor(Quadrat, levels = c("Low", "Mid", "High")))

algae_area_per_site <- intertidal_data_scripps_dana_point_crystal_cove%>%
  drop_na()%>%
  ggplot(aes(x = Quadrat, y = Algae))+
  geom_col()+
  labs(x= "The Tide Reach", y = "Amounts of Algae in the Area") 
  

algae_area_per_site


