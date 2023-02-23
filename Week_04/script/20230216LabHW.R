library(tidyverse)
library(here)
chemicaldata_manualua.csv
chem_data_dictionary.csv


Chemdata <- read_csv(here("Week_04","data","chem_data_dictionary.csv"))
view(Chemdata)


  
  ChemData_clean <- ChemData %>%
  drop_na() %>% 
  separate(col = Tide_time, 
           into = c("Tide","Time"), 
           sep = "_", 
           remove = FALSE) %>%
  pivot_longer(cols = Temp_in:percent_sgd, 
               names_to = "Variables", 
               values_to = "Values") %>% 
  group_by(Variables, Site, Time) %>% 
  summarise(mean_vals = mean(Values, na.rm = TRUE)) %>%
  pivot_wider(names_from = Variables, 
              values_from = mean_vals) %>%
    ggplot(aes(x = Temp_in, y = Time)) +
    geom_col()

ggsave(here("Homework","output","Time vs Temperature graph.png"))
ChemData_clean




