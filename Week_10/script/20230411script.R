### Kenta Shimizu ###
### 2023-04-11 ###


#### Load Libraries ######
library(tidyverse)
library(reprex) 
library(datapasta) 
library(styler) 


### Data Analysis ###
mpg %>%
  ggplot(aes(x = displ, y = hwy))%>%
  geom_point(aes(color = class))

### Load Data ###
data <- tibble::tribble(
  ~lat,    ~long, ~star_no,
  33.548, -117.805,      10L,
  35.534, -121.083,       1L,
  39.503, -123.743,      25L,
  32.863,  -117.24,      22L,
  33.46, -117.671,       8L
)

data


