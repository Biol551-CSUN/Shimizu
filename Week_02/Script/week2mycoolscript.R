### This is my first script. I am learning how to import data.
### Created by: Kenta Shimizu
### created on: 2023-02-02
###########################################
### Load libraries ##############################################
library(tidyverse)

libary("here")

### Read in data #################################

WeightData<-read_csv(here("Week_02","data","weightdata.csv"))

### Data Analysis #############################

head(WeightData)
tail(WeightData)
view(WeightData)
glimspe(WeightData)