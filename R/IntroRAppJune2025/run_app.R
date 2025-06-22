# ==============================================================================
# Quick Start Script for R Introduction App
# ==============================================================================

# Quick function to run the setup and start the app
quick_start <- function() {
  cat("🚀 Quick Start: R Introduction App\n")
  cat("==================================\n\n")
  
  # Check if we're in the right directory
  if (!file.exists("app.R")) {
    cat("❌ app.R not found in current directory.\n")
    cat("Please navigate to the app directory first:\n")
    cat("setwd('c:/Proj/Languages/R/IntroRAppJune2025')\n")
    return(invisible())
  }
  
  # Check if R is properly installed
  r_version <- try(R.version.string, silent = TRUE)
  if (inherits(r_version, "try-error")) {
    cat("❌ R is not properly installed or configured.\n")
    cat("Please install R from: https://cran.r-project.org/\n")
    cat("And RStudio from: https://posit.co/downloads/\n")
    return(invisible())
  }
  
  # Check if key packages are installed
  key_packages <- c("shiny", "dplyr", "ggplot2")
  missing_packages <- key_packages[!sapply(key_packages, requireNamespace, quietly = TRUE)]
  
  if (length(missing_packages) > 0) {
    cat("📦 Some required packages are missing.\n")
    cat("Running setup script...\n\n")
    source("setup.R")
    cat("\n")
  }
  
  # Start the app
  cat("🌟 Starting the R Introduction App...\n")
  cat("The app should open in your default web browser.\n")
  cat("If it doesn't, look for the URL in the console output.\n\n")
  
  # Launch the Shiny app
  shiny::runApp(launch.browser = TRUE)
}

# Display welcome message
cat("Welcome to the Comprehensive R Introduction App!\n")
cat("===============================================\n\n")
cat("This app covers:\n")
cat("• R Basics & Data Types\n")
cat("• Tidyverse Ecosystem\n") 
cat("• Popular R Libraries\n")
cat("• Language Constructs\n")
cat("• Data Visualization\n")
cat("• Statistical Analysis\n")
cat("• Real-world Examples\n\n")

cat("To get started, run: quick_start()\n")
cat("Or simply run: shiny::runApp()\n\n")

cat("For setup issues, run: source('setup.R')\n")
cat("For help, see: README.md\n\n")

# If running this script directly, start the app
if (interactive() && file.exists("app.R")) {
  cat("Auto-starting the app...\n")
  quick_start()
}
