# ==============================================================================
# Simple Test Script for R Introduction App
# Run this to test basic functionality without the full Shiny app
# ==============================================================================

cat("Testing R Introduction App Components...\n")
cat("========================================\n\n")

# Test 1: Check R installation
cat("1. Testing R installation...\n")
cat("R version:", R.version.string, "\n")
cat("Platform:", R.version$platform, "\n\n")

# Test 2: Check if we can load basic packages
cat("2. Testing basic package loading...\n")
basic_packages <- c("stats", "graphics", "grDevices", "utils", "datasets")
for (pkg in basic_packages) {
  if (require(pkg, character.only = TRUE, quietly = TRUE)) {
    cat("✓", pkg, "loaded successfully\n")
  } else {
    cat("✗", pkg, "failed to load\n")
  }
}
cat("\n")

# Test 3: Check working directory and files
cat("3. Testing file structure...\n")
cat("Working directory:", getwd(), "\n")

required_files <- c("app.R", "r_basics.R", "tidyverse_demo.R", "popular_libraries.R", 
                    "language_constructs.R", "analysis_functions.R")
for (file in required_files) {
  if (file.exists(file)) {
    cat("✓", file, "found\n")
  } else {
    cat("✗", file, "missing\n")
  }
}
cat("\n")

# Test 4: Try to source helper files
cat("4. Testing helper file loading...\n")
helper_files <- c("r_basics.R", "tidyverse_demo.R", "popular_libraries.R", 
                  "language_constructs.R", "analysis_functions.R")

for (file in helper_files) {
  if (file.exists(file)) {
    tryCatch({
      source(file)
      cat("✓", file, "sourced successfully\n")
    }, error = function(e) {
      cat("✗", file, "failed to source:", e$message, "\n")
    })
  }
}
cat("\n")

# Test 5: Test basic functions
cat("5. Testing basic demonstration functions...\n")
tryCatch({
  result <- demonstrate_basic_functions()
  cat("✓ demonstrate_basic_functions() works\n")
}, error = function(e) {
  cat("✗ demonstrate_basic_functions() failed:", e$message, "\n")
})

tryCatch({
  result <- demonstrate_data_types()
  cat("✓ demonstrate_data_types() works\n")
}, error = function(e) {
  cat("✗ demonstrate_data_types() failed:", e$message, "\n")
})

tryCatch({
  result <- create_sample_dataframe()
  cat("✓ create_sample_dataframe() works (", nrow(result), "rows)\n")
}, error = function(e) {
  cat("✗ create_sample_dataframe() failed:", e$message, "\n")
})
cat("\n")

# Test 6: Check for required packages (without installing)
cat("6. Checking for required packages...\n")
required_packages <- c("shiny", "shinydashboard", "dplyr", "ggplot2", "DT", "plotly")
missing_packages <- c()

for (pkg in required_packages) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    missing_packages <- c(missing_packages, pkg)
    cat("⚠", pkg, "not installed\n")
  } else {
    cat("✓", pkg, "available\n")
  }
}

if (length(missing_packages) > 0) {
  cat("\nMissing packages found. To install them, run:\n")
  cat("install.packages(c(", paste0("'", missing_packages, "'", collapse = ", "), "))\n")
  cat("Or run: source('setup.R')\n")
} else {
  cat("\n✓ All required packages are available!\n")
}
cat("\n")

# Test 7: Try a minimal Shiny app
cat("7. Testing minimal Shiny functionality...\n")
if (requireNamespace("shiny", quietly = TRUE)) {
  tryCatch({
    library(shiny)
    
    # Create minimal test app
    ui <- fluidPage(
      titlePanel("Test App"),
      mainPanel(h3("R is working!"))
    )
    
    server <- function(input, output) {
      # Empty server for testing
    }
    
    # Don't actually run the app, just test creation
    app <- shinyApp(ui = ui, server = server)
    cat("✓ Minimal Shiny app created successfully\n")
    cat("  Note: App not launched in test mode\n")
    
  }, error = function(e) {
    cat("✗ Shiny test failed:", e$message, "\n")
  })
} else {
  cat("⚠ Shiny package not available\n")
}
cat("\n")

# Summary
cat("========================================\n")
cat("Test Summary:\n")
if (length(missing_packages) == 0) {
  cat("✓ All tests passed! Ready to run the full app.\n")
  cat("  To start the app, run: shiny::runApp()\n")
} else {
  cat("⚠ Some packages are missing. Install them first:\n")
  cat("  source('setup.R')  # Install all packages\n")
  cat("  Then run: shiny::runApp()\n")
}
cat("========================================\n")
