install.packages("lubridate")

library(tidyverse)
library(here)
library(lubridate)


now() # what time is it now
now(tzone = "EST") #what time is it on the east coast
now()
today()
am(now()) #is it morning
leap_year(now()) 
ymd_hm("2023-02-23 13:15")
datetimes<-c("02/24/2021 22:22:20",
             "02/25/2021 11:21:10",
             "02/26/2021 8:01:52")

datetimes <- mdy_hms(datetimes)

month(datetimes)

month(datetimes, label = TRUE, abbr = FALSE)

day(datetimes)

datetimes + days(2)

CondData <- read_csv(here("Week_05", "data","CondData.csv"))

view(CondData)   
