# Title: National Highway Traffic Safety Administration Data Exploration Dashboard
# Purpose: Understanding highway safety and contributors to highway safety is of high importance to researchers. This dashboards allows for the exploration of chosen crash test statistics within the NHTSA database for 2024. The data for 2024 was chosen as this is the most up to date data and downloading the data for each year would be an incredibly large dataset, so we are sticking with 2024 for our purposes.
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.

#install.packages("DT")

library(shiny)
library(ggplot2)
library(dplyr)
library(DT)


acc_data <- read.csv("accident.csv")

# Define UI for application that draws a histogram
ui <- fluidPage(
  titlePanel("United States 2024 Crash Statistics Dashboard"),

  sidebarLayout(
    sidebarPanel(
      p("Understanding highway safety and contributors to highway safety is of high importance to injury biomechanics researchers. This dashboards allows for the exploration of chosen crash test statistics within the NHTSA database for 2024. Choose a light setting and enter State name to enable data visualization."),
      radioButtons("lightingInput", "LGT_CONDNAME", choices = c("Dark - Not Lighted", "Daylight", "Dusk"), selected = "Daylight"),
      textInput("stateInput", "STATENAME", value = "", placeholder = "e.g. Alabama")
    ),
  mainPanel(
    plotOutput("plot"),
    br(), br(), #adding Whitespace
    DT::dataTableOutput("results")

  )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

  filtered <- reactive({ acc_data %>%
    filter(STATENAME == input$stateInput,
           LGT_CONDNAME == input$lightingInput)
  })

  output$plot <- renderPlot({

    plot_dat <- filtered() %>%
      group_by(MONTHNAME) %>%
      summarise( sum_fatals = sum(FATALS, na.rm = TRUE))

    ggplot(plot_dat, aes(x = MONTHNAME,y = sum_fatals)) + geom_col()
  })

  output$results <- DT::renderDT({

    filt_table <- filtered() %>%
      arrange(match(MONTHNAME, month.name)) %>%
      select(MONTHNAME, DAY, LATITUDE,LONGITUD, FATALS) %>%
      DT::datatable(options = list(pageLength = 5,lengthMenu = c(5, 10, 20, 30, 40, 50)))
  })

}

# Run the application
shinyApp(ui = ui, server = server)
