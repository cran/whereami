## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(whereami)

## ----eval = FALSE-------------------------------------------------------------
#  # Global variables can go here
#  n <- 200
#  
#  
#  # Define the UI
#  ui <- bootstrapPage(
#    numericInput('n', 'Number of obs', n),
#    plotOutput('plot')
#  )
#  
#  
#  # Define the server code
#  server <- function(input, output) {
#    output$plot <- renderPlot({
#      cat_where(whereami())
#      hist(runif(input$n))
#    })
#  }
#  
#  # Return a Shiny app object
#  shinyApp(ui = ui, server = server)

