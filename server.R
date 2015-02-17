library(shiny)
library(ggplot2)
library(dplyr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  data <- read.csv("raw.csv")
  normalized <- summarise(group_by(data, country), base=min(applications, na.rm=TRUE))
  data <- merge(data, normalized, by=c('country'))
  data$normalized <- data$applications / data$base
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlot({
    if(input$select == 1){
    qplot(year, applications, 
          data=filter(data, country %in% input$checkGroup), 
          color=country, 
          geom=c('line'),
          main='Number of Patent Applications',
          xlab='Year',
          ylab='Number of Applications'
          )
    } else {
      qplot(year, normalized, 
            data=filter(data, country %in% input$checkGroup), 
            color=country, 
            geom=c('line'),
            main='Patent Application Trend',
            xlab='Year',
            ylab='Normalized Number of Applications'
      )
    }
  })
})
