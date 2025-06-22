# ==============================================================================
# Popular R Libraries Demonstrations
# ==============================================================================

demonstrate_leaflet <- function() {
  library(leaflet)
  
  # Create a sample map with markers
  map <- leaflet() %>%
    addTiles() %>%
    addMarkers(
      lng = c(-74.0059, -0.1276, 2.3522, 139.6917), 
      lat = c(40.7128, 51.5074, 48.8566, 35.6895),
      popup = c("New York", "London", "Paris", "Tokyo"),
      label = c("NYC", "LON", "PAR", "TOK")
    ) %>%
    setView(lng = 0, lat = 30, zoom = 2)
  
  return(map)
}

demonstrate_plotly <- function() {
  library(plotly)
  library(ggplot2)
  
  # Create a sample plotly visualization
  df <- data.frame(
    x = 1:10,
    y = (1:10)^2 + rnorm(10, 0, 10),
    group = rep(c("A", "B"), 5)
  )
  
  p <- ggplot(df, aes(x = x, y = y, color = group)) +
    geom_point(size = 3) +
    geom_line() +
    labs(title = "Interactive Plotly Example") +
    theme_minimal()
  
  # Convert to plotly for interactivity
  ggplotly(p)
}

demonstrate_popular_libraries <- function() {
  output <- paste(
    "# Popular R Libraries Ecosystem",
    "",
    "# === Data Manipulation & Analysis ===",
    "library(dplyr)      # Grammar of data manipulation",
    "library(tidyr)      # Tidy data principles",
    "library(data.table) # Fast data manipulation",
    "library(dtplyr)     # dplyr backend for data.table",
    "",
    "# === Data Import/Export ===",
    "library(readr)      # Fast reading of rectangular data",
    "library(readxl)     # Read Excel files",
    "library(haven)      # SPSS, Stata, SAS files",
    "library(jsonlite)   # JSON parser",
    "library(xml2)       # XML parser",
    "library(httr)       # HTTP requests",
    "",
    "# === Data Visualization ===",
    "library(ggplot2)    # Grammar of graphics",
    "library(plotly)     # Interactive plots",
    "library(leaflet)    # Interactive maps",
    "library(DT)         # Interactive tables",
    "library(corrplot)   # Correlation matrices",
    "library(ggthemes)   # Additional ggplot themes",
    "library(gganimate)  # Animated plots",
    "",
    "# === Web Applications ===",
    "library(shiny)      # Web applications",
    "library(shinydashboard) # Dashboard layouts",
    "library(flexdashboard)  # R Markdown dashboards",
    "",
    "# === Statistical Modeling ===",
    "library(caret)      # Classification and regression",
    "library(randomForest) # Random forest algorithm",
    "library(glmnet)     # Regularized linear models",
    "library(survival)   # Survival analysis",
    "library(nlme)       # Mixed-effects models",
    "",
    "# === Machine Learning ===",
    "library(tidymodels) # Unified ML framework",
    "library(torch)      # Deep learning",
    "library(tensorflow) # TensorFlow interface",
    "library(reticulate) # Python integration",
    "",
    "# === Time Series ===",
    "library(forecast)   # Time series forecasting",
    "library(tsibble)    # Tidy time series",
    "library(lubridate)  # Date/time manipulation",
    "",
    "# === Text Analysis ===",
    "library(stringr)    # String manipulation",
    "library(tm)         # Text mining",
    "library(tidytext)   # Tidy text analysis",
    "library(quanteda)   # Quantitative text analysis",
    "",
    "# === Functional Programming ===",
    "library(purrr)      # Functional programming tools",
    "library(furrr)      # Parallel purrr",
    "",
    "# === Database Connectivity ===",
    "library(DBI)        # Database interface",
    "library(odbc)       # ODBC connectivity",
    "library(RPostgreSQL) # PostgreSQL",
    "library(RSQLite)    # SQLite",
    "",
    "# === Reproducible Research ===",
    "library(rmarkdown)  # Dynamic documents",
    "library(knitr)      # Document generation",
    "library(here)       # Project-relative paths",
    "library(usethis)    # Package development",
    "",
    "# === Performance ===",
    "library(Rcpp)       # C++ integration",
    "library(parallel)   # Parallel computing",
    "library(doParallel) # Parallel backends",
    "",
    "# Example: Using multiple libraries together",
    "library(dplyr)",
    "library(ggplot2)", 
    "library(plotly)",
    "",
    "plot <- mtcars %>%",
    "  mutate(efficiency = ifelse(mpg > 20, 'High', 'Low')) %>%",
    "  ggplot(aes(x = wt, y = mpg, color = efficiency)) +",
    "  geom_point(size = 3) +",
    "  labs(title = 'Car Weight vs MPG') +",
    "  theme_minimal()",
    "",
    "# Make it interactive",
    "ggplotly(plot)",
    sep = "\n"
  )
  return(output)
}
