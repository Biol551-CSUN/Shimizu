#loading library
library(shiny)
library(tidyverse)

ui<-fluidPage(
  sliderInput(inputId = "num", # ID name for the input
              label = "Choose a number", # Label above the input
              value = 25, min = 1, max = 100 # values for the slider
  ),
  textInput(inputId = "title", # new Id is title
            label = "Write a title",
            value = "Histogram of Random Normal Values"
  ),
  plotOutput("type"), # creates a title for the output
  verbatimTextOutput("stats") # create a space for stats
)

server<-function(input,output){
  data<-reactive({
    tibble(x = rnorm(input$num)) # 100 random normal points
  })
  output$type<-  #type comes from the plot output "type"
    renderPlot({  # {} allows us to put all our R code in one nice chunck
      ggplot(data(), aes(x = x))+ # make a histogram
        geom_histogram()+
        labs(title = input$title) #Add a new title
    })
  output$stats <- renderPrint({
    summary(data()) # calculate summary stats based on the numbers
  })
}
shinyApp(ui = ui, server = server)

# ui<-fluidPage(
# Inputs functions,
# Outputs functions)



