### Library data ###
install.packages("lubridate")
library(tidyverse)
library(here)
library(lubridate)

### Data analysis ###
ymd("2021-02-24")
datetimes<-c("02/24/2021 22:22:20",
             "02/25/2021 11:21:10",
             "02/26/2021 8:01:52")
datetimes <- mdy_hms (datetimes)

month(datetimes, label = TRUE)
day(datetimes)
hour(datetimes)
datetimes + hours(4)
datetimes + days(2) ## adds 2 days ###







view(CondData)


###Data read in ####
CondData<-read_csv(here("Week_05","Data", "CondData.csv"))

CondData <- CondData %>%
  mutate(Date = mdy_hm(Date)) %>%  ## correcting date and time format ###
  round_date(CondData, "10 seconds")   ### rounding to 10s #

### read in the Data ###
DepthData<-read_csv(here("Week_05","Data", "DepthData.csv"))

DepthData <- DepthData %>%
  mutate(Date = mdy_hm(Date)) %>%
  
  inner_join(CondData) %>% ##### joining the data #### 

### renaming the new joined data to save confusion ###
mutate(Date = round_date(Date, "2 minute")) %>%     ### rounding date ###
  group_by(Date) %>%      ### group by date so can produce plot ###
  
  summarise(mean_depth = mean(Depth, na.rm = TRUE),
            mean_temp = mean(TempInSitu, na.rm = TRUE),
            mean_salinity = mean(Salinity, na.rm = TRUE))

ggplot(data = DepthData,  ## produce plot ##
       mapping = aes(x = Date,
                     y = mean_temp,
                     color = Date))+
  
  geom_point()+
  geom_smooth(method = "lm")+ #line of best fit##
  labs(x = "Time",     #axis titles##
       y = "Temp")

ggsave(here("Week_05", "Output", "DepthData_homework.png"))  ##save data##
