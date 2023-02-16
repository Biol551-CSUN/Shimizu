library(tidyverse)
library(here)


Chemdata <- read_csv(here("Week_04","data","chem_data_dictionary.csv"))

Chemdata%>%
  