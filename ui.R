
library(shiny)
library(ggplot2)
library(gridExtra)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Weibull distribution plots"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        h4("This is an application that allows user to see how the shape of Weibull distribution changes when we modify their parameters, i.e. shape parameter (a) and scale parameter (b)."),
        sliderInput("a","Shape parameter (a)",min=0.1,max=6,value=1),
        sliderInput("b","scale parameter (b)",min=1,max=10,value=1),
        checkboxInput("donum1", "Plot of empirical cumulative distribution function (ECDF)", value = T),
        checkboxInput("donum2", "Plot of frequency distribution function", value = T)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
        fluidRow(
                h5("How the application run:"),
                h6("1 - Take a value of shape parameter (a) in slider"),
                h6("2 - Take a value of scale parameter (b) in slider"),
                h6("3 - The programe will random sample 1000 values of Weibull distribution with given a and b"),
                h6("4 - Calculation and make 2 plots of Weibull distribution, i.e. Empirical cumulative distribution function (ECDF) and frequency distribution function"),
                h6("You can chose to show/not show these plots by check/uncheck the checkbox"),
            splitLayout(cellWidths = c("50%", "50%"), plotOutput("plotgraph1"), plotOutput("plotgraph2"))
        )
    )
  )
))
