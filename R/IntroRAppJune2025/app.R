# ==============================================================================
# Comprehensive R Introduction App - June 2025
# Covers: R Basics, Tidyverse, Popular Libraries, and Key Language Constructs
# ==============================================================================

# Load required libraries
suppressPackageStartupMessages({
  library(shiny)
  library(shinydashboard)
  library(DT)
  library(plotly)
  library(dplyr)
  library(ggplot2)
  library(tidyr)
  library(readr)
  library(stringr)
  library(lubridate)
  library(purrr)
  library(forcats)
  library(leaflet)
  library(corrplot)
  library(jsonlite)
  library(httr)
  library(knitr)
  library(kableExtra)
})

# Source helper functions
source("r_basics.R")
source("tidyverse_demo.R")
source("popular_libraries.R")
source("language_constructs.R")
source("analysis_functions.R")

# UI Definition
ui <- dashboardPage(
  dashboardHeader(title = "R Programming Comprehensive Guide - June 2025"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("R Basics", tabName = "basics", icon = icon("play")),
      menuItem("Data Types & Structures", tabName = "datatypes", icon = icon("database")),
      menuItem("Tidyverse Ecosystem", tabName = "tidyverse", icon = icon("broom")),
      menuItem("Popular Libraries", tabName = "libraries", icon = icon("puzzle-piece")),
      menuItem("Language Constructs", tabName = "constructs", icon = icon("code")),
      menuItem("Data Visualization", tabName = "visualization", icon = icon("chart-bar")),
      menuItem("Statistical Analysis", tabName = "statistics", icon = icon("calculator")),
      menuItem("Real-world Examples", tabName = "examples", icon = icon("rocket"))
    )
  ),
  
  dashboardBody(
    tags$head(
      tags$style(HTML("
        .content-wrapper, .right-side {
          background-color: #f4f4f4;
        }
        .box {
          margin-bottom: 20px;
        }
        pre {
          background-color: #f8f8f8;
          border: 1px solid #ddd;
          border-radius: 4px;
          padding: 10px;
          font-size: 12px;
        }
      "))
    ),
    
    tabItems(
      # R Basics Tab
      tabItem(tabName = "basics",
        fluidRow(
          box(width = 12, title = "R Basics Overview", status = "primary", solidHeader = TRUE,
            h3("Welcome to R Programming!"),
            p("R is a powerful language for statistical computing and graphics. Let's explore the fundamentals."),
            
            h4("1. Basic Operations"),
            verbatimTextOutput("basic_operations"),
            
            h4("2. Variable Assignment"),
            verbatimTextOutput("variable_assignment"),
            
            h4("3. Basic Functions"),
            verbatimTextOutput("basic_functions"),
            
            actionButton("run_basics", "Run Basic Examples", class = "btn-primary")
          )
        )
      ),
      
      # Data Types Tab
      tabItem(tabName = "datatypes",
        fluidRow(
          box(width = 6, title = "Data Types", status = "info", solidHeader = TRUE,
            verbatimTextOutput("data_types_demo")
          ),
          box(width = 6, title = "Data Structures", status = "info", solidHeader = TRUE,
            verbatimTextOutput("data_structures_demo")
          )
        ),
        fluidRow(
          box(width = 12, title = "Data Frame Example", status = "success", solidHeader = TRUE,
            DT::dataTableOutput("sample_dataframe")
          )
        )
      ),
      
      # Tidyverse Tab
      tabItem(tabName = "tidyverse",
        fluidRow(
          box(width = 12, title = "Tidyverse Ecosystem", status = "warning", solidHeader = TRUE,
            h3("Core Tidyverse Libraries"),
            tags$ul(
              tags$li(strong("dplyr:"), "Data manipulation"),
              tags$li(strong("ggplot2:"), "Data visualization"),
              tags$li(strong("tidyr:"), "Data tidying"),
              tags$li(strong("readr:"), "Data import"),
              tags$li(strong("purrr:"), "Functional programming"),
              tags$li(strong("stringr:"), "String manipulation"),
              tags$li(strong("forcats:"), "Factor handling"),
              tags$li(strong("lubridate:"), "Date/time manipulation")
            )
          )
        ),
        fluidRow(
          box(width = 6, title = "Data Manipulation (dplyr)", status = "primary", solidHeader = TRUE,
            verbatimTextOutput("dplyr_demo")
          ),
          box(width = 6, title = "Data Visualization (ggplot2)", status = "primary", solidHeader = TRUE,
            plotOutput("ggplot_demo")
          )
        ),
        fluidRow(
          box(width = 12, title = "Pipe Operator Magic", status = "success", solidHeader = TRUE,
            verbatimTextOutput("pipe_demo")
          )
        )
      ),
      
      # Popular Libraries Tab
      tabItem(tabName = "libraries",
        fluidRow(
          box(width = 4, title = "Shiny (Web Apps)", status = "primary", solidHeader = TRUE,
            p("Create interactive web applications"),
            tags$code("library(shiny)"),
            br(), br(),
            sliderInput("sample_slider", "Sample Slider:", 1, 100, 50),
            textOutput("slider_output")
          ),
          box(width = 4, title = "Leaflet (Maps)", status = "success", solidHeader = TRUE,
            p("Interactive maps"),
            leafletOutput("sample_map", height = "200px")
          ),
          box(width = 4, title = "Plotly (Interactive Plots)", status = "info", solidHeader = TRUE,
            p("Interactive visualizations"),
            plotlyOutput("plotly_demo", height = "200px")
          )
        ),
        fluidRow(
          box(width = 12, title = "Popular R Libraries Overview", status = "warning", solidHeader = TRUE,
            verbatimTextOutput("libraries_overview")
          )
        )
      ),
      
      # Language Constructs Tab
      tabItem(tabName = "constructs",
        fluidRow(
          box(width = 6, title = "Control Structures", status = "primary", solidHeader = TRUE,
            verbatimTextOutput("control_structures")
          ),
          box(width = 6, title = "Functions", status = "success", solidHeader = TRUE,
            verbatimTextOutput("functions_demo")
          )
        ),
        fluidRow(
          box(width = 6, title = "Loops and Apply Functions", status = "info", solidHeader = TRUE,
            verbatimTextOutput("loops_apply")
          ),
          box(width = 6, title = "Error Handling", status = "warning", solidHeader = TRUE,
            verbatimTextOutput("error_handling")
          )
        )
      ),
      
      # Visualization Tab
      tabItem(tabName = "visualization",
        fluidRow(
          box(width = 6, title = "ggplot2 Gallery", status = "primary", solidHeader = TRUE,
            selectInput("plot_type", "Choose Plot Type:",
                       choices = c("Scatter Plot", "Bar Chart", "Histogram", "Box Plot", "Line Chart")),
            plotOutput("dynamic_plot")
          ),
          box(width = 6, title = "Correlation Matrix", status = "info", solidHeader = TRUE,
            plotOutput("correlation_plot")
          )
        )
      ),
      
      # Statistics Tab
      tabItem(tabName = "statistics",
        fluidRow(
          box(width = 6, title = "Descriptive Statistics", status = "success", solidHeader = TRUE,
            verbatimTextOutput("descriptive_stats")
          ),
          box(width = 6, title = "Statistical Tests", status = "warning", solidHeader = TRUE,
            verbatimTextOutput("statistical_tests")
          )
        ),
        fluidRow(
          box(width = 12, title = "Linear Regression Example", status = "primary", solidHeader = TRUE,
            verbatimTextOutput("regression_demo"),
            plotOutput("regression_plot")
          )
        )
      ),
      
      # Real-world Examples Tab
      tabItem(tabName = "examples",
        fluidRow(
          box(width = 12, title = "Real-world Data Analysis Example", status = "success", solidHeader = TRUE,
            p("Let's analyze a real dataset using multiple R concepts together."),
            verbatimTextOutput("realworld_analysis")
          )
        ),
        fluidRow(
          box(width = 6, title = "Data Summary", status = "info", solidHeader = TRUE,
            DT::dataTableOutput("analysis_table")
          ),
          box(width = 6, title = "Insights Visualization", status = "primary", solidHeader = TRUE,
            plotOutput("insights_plot")
          )
        )
      )
    )
  )
)

# Server Logic
server <- function(input, output, session) {
  
  # R Basics
  output$basic_operations <- renderText({
    paste(
      "# Basic arithmetic operations",
      "5 + 3   # Addition: 8",
      "10 - 4  # Subtraction: 6", 
      "6 * 7   # Multiplication: 42",
      "15 / 3  # Division: 5",
      "2^3     # Exponentiation: 8",
      "17 %% 5 # Modulo: 2",
      sep = "\n"
    )
  })
  
  output$variable_assignment <- renderText({
    paste(
      "# Variable assignment",
      "x <- 10              # Preferred assignment",
      "y = 20               # Alternative assignment", 
      "z <<- 30             # Global assignment",
      "name <- 'John'       # Character variable",
      "is_student <- TRUE   # Logical variable",
      sep = "\n"
    )
  })
  
  output$basic_functions <- renderText({
    demonstrate_basic_functions()
  })
  
  # Data Types and Structures
  output$data_types_demo <- renderText({
    demonstrate_data_types()
  })
  
  output$data_structures_demo <- renderText({
    demonstrate_data_structures()
  })
  
  output$sample_dataframe <- DT::renderDataTable({
    create_sample_dataframe()
  }, options = list(pageLength = 10))
  
  # Tidyverse Demos
  output$dplyr_demo <- renderText({
    demonstrate_dplyr()
  })
  
  output$ggplot_demo <- renderPlot({
    demonstrate_ggplot()
  })
  
  output$pipe_demo <- renderText({
    demonstrate_pipes()
  })
  
  # Popular Libraries
  output$slider_output <- renderText({
    paste("Slider value:", input$sample_slider)
  })
  
  output$sample_map <- renderLeaflet({
    demonstrate_leaflet()
  })
  
  output$plotly_demo <- renderPlotly({
    demonstrate_plotly()
  })
  
  output$libraries_overview <- renderText({
    demonstrate_popular_libraries()
  })
  
  # Language Constructs
  output$control_structures <- renderText({
    demonstrate_control_structures()
  })
  
  output$functions_demo <- renderText({
    demonstrate_functions()
  })
  
  output$loops_apply <- renderText({
    demonstrate_loops_apply()
  })
  
  output$error_handling <- renderText({
    demonstrate_error_handling()
  })
  
  # Visualization
  output$dynamic_plot <- renderPlot({
    create_dynamic_plot(input$plot_type)
  })
  
  output$correlation_plot <- renderPlot({
    create_correlation_plot()
  })
  
  # Statistics
  output$descriptive_stats <- renderText({
    demonstrate_descriptive_stats()
  })
  
  output$statistical_tests <- renderText({
    demonstrate_statistical_tests()
  })
  
  output$regression_demo <- renderText({
    demonstrate_regression()
  })
  
  output$regression_plot <- renderPlot({
    create_regression_plot()
  })
  
  # Real-world Examples
  output$realworld_analysis <- renderText({
    perform_realworld_analysis()
  })
  
  output$analysis_table <- DT::renderDataTable({
    create_analysis_table()
  }, options = list(pageLength = 10))
  
  output$insights_plot <- renderPlot({
    create_insights_plot()
  })
}

# Run the application
shinyApp(ui = ui, server = server)
