#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#
# Note: this file must be named app.R EVERY TIME
library(shiny)
library(ggplot2)
library(dplyr)

bcl <- read.csv("bcl-data.csv")
# Define UI for application that draws a histogram
ui <- fluidPage(
  titlePanel("BC Liquor Prices"),

  sidebarLayout(
    sidebarPanel(
      sliderInput("priceInput", "Price", 0, 100, c(25,40), pre = "$"),
      radioButtons("typeInput", "Product Type", choices = c("BEER","REFRESHMENT","SPIRITS","WINE"), selected = "WINE"),
      selectInput("countryInput", "Country", choices = c("CANADA","FRANCE", "ITALY"))
    ),
  mainPanel(
    plotOutput("coolplot"),
    br(), br(), #adding Whitespace
    tableOutput("results")

  )
  ),
)

# Define server logic required to draw a histogram
server <- function(input, output) {

  filtered <- reactive({ bcl %>%
    filter(Country == input$countryInput,
           Price >= input$priceInput[1],
           Price <= input$priceInput[2],
           Type == input$typeInput)
  })

  output$coolplot <- renderPlot({
    ggplot(filtered(), aes(x = Alcohol_Content)) + geom_histogram()
  })

  output$results <- renderTable({
    filtered()
  })

}

# Run the application
shinyApp(ui = ui, server = server)
