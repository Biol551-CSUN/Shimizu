library(tidyverse)
library(here)
library(lubridate)

graph_CondData <- read_csv(here("Week_05","data","CondData.csv"))


graph_CondData <- graph_CondData%>%
mutate(Date = mdy_hm(Date))
  
  ##  mutate(date = as.character(date),
         date = myd)


view(graph_CondData)

  
