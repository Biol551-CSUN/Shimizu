### 20230223 Homework ###
### Load Library ###

library(tidyverse)
library(here)
library(lubridate)

### Data Analysis ###
ymd("2021-02-24")
datetimes<-c("02/24/2021 22:22:20",
             "02/25/2021 11:21:10",
             "02/26/2021 8:01:52")
datetimes <- mdy_hms (datetimes)

month(datetimes, label = TRUE)
day(datetimes)
hour(datetimes)
datetimes + hours(4)
datetimes + days(2) 


view(CondData)


CondData<-read_csv(here("Week_05","Data", "CondData.csv"))

CondData <- CondData %>%
  mutate(date = mdy_hms(date)) %>%  
  mutate(date = round_date(date, unit = "10 seconds"))   

view(CondData)

### Data Read in ###
DepthData<-read_csv(here("Week_05","Data", "DepthData.csv"))

DepthData <- DepthData %>%
  inner_join(CondData) %>% 
mutate(round_date(date, "2 minute")) %>%    
  group_by(date) %>%     
  summarise(mean_depth = mean(Depth, na.rm = TRUE),
            mean_temp = mean(Temperature, na.rm = TRUE),
            mean_salinity = mean(Salinity, na.rm = TRUE))

view(DepthData)

TimeTemp <- ggplot(data = DepthData,  
       mapping = aes(x = date,
                     y = mean_temp))+
  geom_point()+
  geom_smooth(method = "lm")+ 
  labs(x = "Time",     
       y = "Temp")

TimeTemp


ggsave(here("Week_05", "Output", "DepthData_homework.png"))  ##save data##
