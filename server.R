
library(shiny)
library(ggplot2)
library(gridExtra)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
        
        # random sampling 1000 values from weibull distribution with shape 
        # paramter (a) and scale parameter (b)
        
        
        pt1 <- reactive({
                if (!input$donum1) return(NULL)
                set.seed(123)
                sim <- rweibull(1000, input$a, input$b)
                plot(ecdf(sim),main="Empirical cumulative distribution", 
                     xlab = "x", ylab = "ECDF")
        })
        pt2 <- reactive({
                if (!input$donum2) return(NULL)
                set.seed(123)
                sim <- rweibull(1000, input$a, input$b)
                plot(density(sim),main="Frequency distribution",xlab = "x", ylab = "Frequency", 
                     ylim=c(0,2.2))
                polygon(density(sim), col="red", border="blue")
        })
        
        output$plotgraph = renderPlot({pt()})
        output$plotgraph1 = renderPlot({pt1()})
        output$plotgraph2 = renderPlot({pt2()})       
})
