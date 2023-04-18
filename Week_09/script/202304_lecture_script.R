library(tidyverse)

df<- tibble::tibble(
  a = rnorm(10), # draws 10 random values from a normal distribution
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)
-

head(df)

df<-df %>%
  mutate(a = (a-min(a, na.rm = TRUE))/(max(a, na.rm = TRUE)-min(a, na.rm = TRUE)))

head(df)

Tempf_to_c <- function(temp_F){
  temp_C <- (temp_F-32) * 5 / 9
  return(temp_C)
}

Tempf_to_c(42)

Tempf_to_c(100)

Tempc_to_k <- function(temp_k){
  temp_k <- (temp_C + 273.15)
  return(temp_C)
}

library(palmerpenguins)
library(PNWColors)

myplot<-function(data, x, y){ 
  pal<-pnw_palette("Lake",3, type = "discrete") # my color palette 
  ggplot(data, aes(x = {{x}}, y = {{y}} , color = island))+
    geom_point()+
    geom_smooth(method = "lm")+ # add a linear model
    scale_color_manual("Island", values=pal)+   # use pretty colors and change the legend title
    theme_bw()
}

myplot(data= penguins, x = body_mass_g, y= bill_length_mm)

a <- 4
b <- 5

if (a > b) { # my question
  f <- 20 # if it is true give me answer 1
} else { # else give me answer 2
  f <- 10
}

myplot<-function(data = penguins, x, y ,lines=TRUE ){ # add new argument for lines
  pal<-pnw_palette("Lake",3, type = "discrete") # my color palette 
  ggplot(data, aes(x = {{x}}, y = {{y}} , color = island))+
    geom_point()+
    geom_smooth(method = "lm")+ # add a linear model
    scale_color_manual("Island", values=pal)+   # use pretty colors and change the legend title
    theme_bw()
}

myplot<-function(data = penguins, x, y, lines=TRUE ){ # add new argument for lines
  pal<-pnw_palette("Lake",3, type = "discrete") # my color palette 
  if(lines==TRUE){
    ggplot(data, aes(x = {{x}}, y = {{y}} , color = island))+
      geom_point()+
      geom_smooth(method = "lm")+ # add a linear model
      scale_color_manual("Island", values=pal)+   # use pretty colors and change the legend title
      theme_bw()
  }
  else{
    ggplot(data, aes(x = {{x}}, y = {{y}} , color = island))+
      geom_point()+
      scale_color_manual("Island", values=pal)+   # use pretty colors and change the legend title
      theme_bw()
  }
}  


library(emokid)
mymood()
mymood()
mymood()

