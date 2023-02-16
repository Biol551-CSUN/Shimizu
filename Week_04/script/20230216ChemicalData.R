### Today we are going to practice tidy with biogeochemistry from Hawaii ####


library(tidyverse)
library(here)


ChemData <- read_csv(here("Week_04","data","chemicaldata_maunalua.csv"))
view(ChemData)
glimpse(ChemData)

ChemData_clean<-ChemData %>%
  drop_na() %>%
  separate(col = Tide_time,
           into = c("Tide","Time"),
           sep = "_",
           remove = FALSE) %>% # if i want to keep the Tide_time column
  unite(col = "Site_Zone",
        c(Site, Zone),
        sep = ".",
        remove = FALSE)

  
  
  filter(complete.cases(.)) #filters out everything that is not a complete row
View(ChemData_clean)


ChemData_long <- ChemData_clean%>%
  pivot_longer(cols = Temp_in:percent_sgd,
               names_to = "Variable",
               values_to = "Values")



ChemData_long%>%
  group_by(Variable,Site)%>%
  summarise(Torchick_means = mean(Values, na.rm = TRUE),
            Mudkip_var = var(Values, na.rm = TRUE))

view(ChemData_long)


ChemData_clean<-ChemData %>%
  drop_na() %>%
  separate(col = Tide_time,
           into = c("Tide", "Time"),
           sep = "_",
           remove = FALSE)%>%
  pivot_longer(col = Temp_in:percent_sgd,
               names_to = "Variables",
               values_to = "Values")%>%
  group_by(Variables, Site, Time)%>%
  summarise(mean_vals=mean(Values, na.rm = TRUE),
            var_vals=var(Values, na.rm=TRUE))%>%
write_csv(here("Week_04","output","summary.csv"))


view(ChemData_clean)
