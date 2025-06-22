# ==============================================================================
# Setup Script for R Introduction App
# Run this script first to install all required packages
# ==============================================================================

cat("=== R Introduction App Setup ===\n")
cat("Installing required packages...\n\n")

# List of required packages
packages <- c(
  # Core Shiny
  "shiny", "shinydashboard",
  
  # Interactive components
  "DT", "plotly", "leaflet",
  
  # Tidyverse core
  "dplyr", "ggplot2", "tidyr", "readr", 
  "stringr", "lubridate", "purrr", "forcats",
  
  # Visualization
  "corrplot", "ggthemes", "scales",
  
  # Statistical analysis
  "moments", "effectsize", "pwr",
  
  # Machine learning
  "caret", "glmnet", "randomForest",
  
  # Data import/export
  "jsonlite", "httr", "readxl", "haven",
  
  # Document generation
  "knitr", "kableExtra",
  
  # Utility
  "here", "usethis"
)

# Function to install packages if not already installed
install_if_missing <- function(pkg) {
  if (!require(pkg, character.only = TRUE, quietly = TRUE)) {
    cat(paste("Installing", pkg, "...\n"))
    install.packages(pkg, dependencies = TRUE, quiet = TRUE)
    if (require(pkg, character.only = TRUE, quietly = TRUE)) {
      cat(paste("✓", pkg, "installed successfully\n"))
    } else {
      cat(paste("✗ Failed to install", pkg, "\n"))
    }
  } else {
    cat(paste("✓", pkg, "already installed\n"))
  }
}

# Install all packages
cat("Checking and installing packages:\n")
cat("=====================================\n")

for (pkg in packages) {
  install_if_missing(pkg)
}

# Install tidyverse meta-package for completeness
cat("\nInstalling tidyverse meta-package...\n")
install_if_missing("tidyverse")

# Verify critical packages
cat("\n=== Verification ===\n")
critical_packages <- c("shiny", "dplyr", "ggplot2", "DT", "plotly")
all_good <- TRUE

for (pkg in critical_packages) {
  if (require(pkg, character.only = TRUE, quietly = TRUE)) {
    cat(paste("✓", pkg, "loaded successfully\n"))
  } else {
    cat(paste("✗", pkg, "failed to load\n"))
    all_good <- FALSE
  }
}

if (all_good) {
  cat("\n🎉 Setup completed successfully!\n")
  cat("You can now run the app with: shiny::runApp()\n")
} else {
  cat("\n⚠️  Some packages failed to install/load.\n")
  cat("Please check the error messages above and try again.\n")
}

# Display system information
cat("\n=== System Information ===\n")
cat(paste("R version:", R.version.string, "\n"))
cat(paste("Platform:", R.version$platform, "\n"))
cat(paste("Working directory:", getwd(), "\n"))

# Check for RStudio
if (Sys.getenv("RSTUDIO") == "1") {
  cat("RStudio detected ✓\n")
} else {
  cat("RStudio not detected (optional)\n")
}

cat("\n=== Next Steps ===\n")
cat("1. Run: shiny::runApp() to start the application\n")
cat("2. Or open app.R in RStudio and click 'Run App'\n")
cat("3. Explore the different tabs to learn R!\n")
