library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Patent Applications"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput("checkGroup", 
                         label = h3("Country"), 
                         choices = list("US" = 'United States', 
                                        "Japan" = 'Japan', 
                                        "UK" = 'United Kingdom',
                                        'France' = 'France',
                                        'Russia' = 'Russian Federation',
                                        'China' = 'China',
                                        'Germany' = 'Germany'
                                        ),
                         selected = 'US')
      ,
      selectInput("select", 
                  label = h3("Data Type"),
                  choices = list("Absolute" = 1, 
                                 "Normalized" = 2
                                 ), 
                  selected = 'Absolute')
    )
    ,
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      p("Based on data from World Bank.")
    )
  )
)
)
