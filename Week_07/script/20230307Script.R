# Load libraries
library(tidyverse)
library(here)
library(maps)
library(mapdata)
library(mapproj)

# Read in data on population in California by county
popdata<-read_csv(here("Week_07","data","CApopdata.csv"))
#read in data on number of seastars at different field sites
stars<-read_csv(here("Week_07","data","stars.csv"))


# get data for the entire world
world<-map_data("world")
head(world)

view(world)

# get data for the USA
usa<-map_data("usa")
head(usa)


ggplot()+
  geom_polygon(data = world, aes(x = long, y = lat, group = group))


ggplot()+
  geom_polygon(data = world, 
               aes(x = long, y = lat, group = group),
               color = "black")


ggplot()+
  geom_polygon(data = world, 
               aes(x = long, 
                   y = lat, 
                   group = group, 
                   fill = region),
               color = "black") +
  guides(fill = FALSE)



ggplot()+
  geom_polygon(data = world, 
               aes(x = long, 
                   y = lat, 
                   group = group, 
                   fill = region),
               color = "black") +
  guides(fill = FALSE)


ggplot()+
  geom_polygon(data = world, 
               aes(x = long, 
                   y = lat, 
                   group = group,
                   fill = region),
               color = "black")+
  theme_minimal()+
  guides(fill = FALSE)+
  theme(panel.background = element_rect(fill = "lightblue"))


ggplot()+
  geom_polygon(data = world, 
               aes(x = long, 
                   y = lat, 
                   group = group,
                   fill = region),
               color = "black")+
  theme_minimal()+
  guides(fill = FALSE)+
  theme(panel.background = element_rect(fill = "lightblue"))+
  coord_map(projection = "mercator",
            xlim = c(-180,180))


ggplot()+
  geom_polygon(data = world, 
               aes(x = long,
                   y = lat,
                   group = group, 
                   fill = region),
               color = "black")+
  theme_minimal()+
  guides(fill = FALSE)+
  theme(panel.background = element_rect(fill = "lightblue"))+
  coord_map(projection = "sinusoidal",
            xlim = c(-180,180))


# Use the states dataset
# get data for states
states<-map_data("state")
head(states)


# Use the states dataset
CA_data<-states %>%
  filter(region == "california")
 

CA_data  


ggplot()+
  geom_polygon(data= CA_data,
               aes(x=long,
                   y= lat,
                   group=group))+
  coord_map()+
  theme_void()

# get data for counties
counties<-map_data("county")
head(counties)
# Look at the county data
head(counties)[1:3,] # only showing the first 3 rows for space

# Look at the county data
head(popdata)

view(popdata)

CApop_county<-popdata %>%
  select("subregion" = County, Population)  %>% # rename the county col
  inner_join(counties) %>%
  filter(region == "california") # some counties have same names in other states

view(CApop_county)


ggplot()+
  geom_polygon(data = CApop_county, 
               aes(x = long, 
                   y = lat, 
                   group = group,
                   fill = Population),
               color = "black")+
  coord_map()+
  theme_void()

ggplot()+
  geom_polygon(data = CApop_county, 
               aes(x = long, 
                   y = lat, 
                   group = group,
                   fill = Population),  
               color = "black")+
  coord_map()+
  theme_void() +
  scale_fill_gradient(trans = "log10")


ggplot()+
  geom_polygon(data = CApop_county, 
               aes(x = long, 
                   y = lat, 
                   group = group,
                   fill = Population),  
               color = "black")+
  geom_point(data = stars, # add a point at all my sites 
             aes(x = long, 
                 y = lat,
                 size = star_no))+ 
  coord_map()+
  theme_void() +
  scale_fill_gradient(trans = "log10")+
  labs(size = "# stars/m2") 
ggsave(here("Week_07","output","CApop.pdf"))

popdata
