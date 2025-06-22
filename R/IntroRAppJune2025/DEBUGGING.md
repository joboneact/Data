# R Introduction App - Debugging Guide
## June 22, 2025

This guide helps you troubleshoot common issues when running the R Introduction App.

## Quick Start Options

### Option 1: Using RStudio (Recommended)
1. **Install R and RStudio:**
   - Download R: https://cran.r-project.org/
   - Download RStudio: https://posit.co/downloads/

2. **Open in RStudio:**
   - Open RStudio
   - File → Open Project → Navigate to `IntroRAppJune2025` folder
   - Open `app.R`
   - Click "Run App" button (top right of source panel)

3. **Install packages when prompted:**
   ```r
   source("setup.R")  # Run this first if needed
   ```

### Option 2: Using R Console
1. **Navigate to project directory:**
   ```r
   setwd("c:/Proj/Languages/R/IntroRAppJune2025")
   ```

2. **Install packages:**
   ```r
   source("setup.R")
   ```

3. **Run the app:**
   ```r
   shiny::runApp()
   ```

### Option 3: Windows Batch File
1. Double-click `run_app.bat`
2. Follow on-screen prompts

## Common Issues & Solutions

### Issue 1: "R is not installed"
**Error:** `'Rscript' is not recognized` or `'R' is not recognized`

**Solution:**
1. Install R from https://cran.r-project.org/
2. During installation, check "Add R to PATH"
3. Restart command prompt/PowerShell
4. Or use RStudio instead

### Issue 2: "Package not found"
**Error:** `there is no package called 'shiny'`

**Solutions:**
```r
# Option A: Run setup script
source("setup.R")

# Option B: Install packages manually
install.packages(c("shiny", "shinydashboard", "dplyr", "ggplot2"))

# Option C: Install tidyverse (includes many packages)
install.packages("tidyverse")
```

### Issue 3: "Cannot source helper files"
**Error:** `cannot open file 'r_basics.R'`

**Solution:**
```r
# Make sure you're in the correct directory
getwd()  # Check current directory
setwd("c:/Proj/Languages/R/IntroRAppJune2025")  # Set correct directory

# Verify files exist
list.files(pattern = "*.R")
```

### Issue 4: "Port already in use"
**Error:** `address already in use`

**Solutions:**
```r
# Option A: Use different port
shiny::runApp(port = 8080)

# Option B: Find and kill process using port
# In Windows Command Prompt:
# netstat -ano | findstr :3838
# taskkill /PID <process_id> /F
```

### Issue 5: "Object not found" errors
**Error:** `object 'demonstrate_basic_functions' not found`

**Solution:**
```r
# Source all helper files manually
source("r_basics.R")
source("tidyverse_demo.R")
source("popular_libraries.R")
source("language_constructs.R")
source("analysis_functions.R")

# Then run the app
shiny::runApp()
```

### Issue 6: Memory/Performance Issues
**Symptoms:** App is slow or crashes

**Solutions:**
1. **Increase memory limit:**
   ```r
   memory.limit(size = 8000)  # Windows only
   ```

2. **Close other R sessions**

3. **Restart R session:**
   ```r
   .rs.restartR()  # In RStudio
   ```

### Issue 7: Missing fonts or graphics issues
**Error:** Font or plotting errors

**Solutions:**
```r
# Update graphics devices
install.packages("ragg")

# For Windows, install Rtools if needed
# https://cran.r-project.org/bin/windows/Rtools/
```

## Dependency Issues

### Core Dependencies Check
```r
# Check if critical packages are installed
required_packages <- c("shiny", "shinydashboard", "dplyr", "ggplot2")
missing_packages <- required_packages[!sapply(required_packages, requireNamespace, quietly = TRUE)]

if (length(missing_packages) > 0) {
  install.packages(missing_packages)
}
```

### Full Dependencies List
Run this to install all required packages:
```r
packages <- c(
  "shiny", "shinydashboard", "DT", "plotly",
  "dplyr", "ggplot2", "tidyr", "readr", "stringr", 
  "lubridate", "purrr", "forcats", "leaflet",
  "corrplot", "moments", "effectsize", "pwr",
  "caret", "glmnet", "randomForest", "jsonlite",
  "httr", "knitr", "kableExtra", "ggthemes", "scales"
)

install.packages(packages)
```

## System Requirements

### Minimum Requirements
- **R:** Version 4.0 or higher
- **RAM:** 4 GB minimum, 8 GB recommended
- **OS:** Windows 10+, macOS 10.15+, or Linux
- **Browser:** Chrome, Firefox, Safari, or Edge

### Recommended Setup
- **R:** Latest version (4.3+)
- **RStudio:** Latest version
- **RAM:** 8 GB or more
- **Fast internet** for package downloads

## Alternative Solutions

### If All Else Fails

1. **Use RStudio Cloud:**
   - Go to https://rstudio.cloud/
   - Create free account
   - Upload project files
   - Run in cloud environment

2. **Use Docker (Advanced):**
   ```bash
   # Create Dockerfile with R and Shiny
   docker run -p 3838:3838 rocker/shiny
   ```

3. **Simplified Version:**
   Create a minimal version with just core features:
   ```r
   library(shiny)
   ui <- fluidPage(h1("R Basics"), verbatimTextOutput("demo"))
   server <- function(input, output) {
     output$demo <- renderText("Hello R!")
   }
   shinyApp(ui, server)
   ```

## Getting Help

### R Community Resources
- **Stack Overflow:** Tag questions with `[r]` and `[shiny]`
- **RStudio Community:** https://community.rstudio.com/
- **R-help mailing list:** https://stat.ethz.ch/mailman/listinfo/r-help

### Debugging Commands
```r
# Check R installation
R.version.string
sessionInfo()

# Check working directory
getwd()
list.files()

# Check package installation
installed.packages()[,"Package"]
library()  # List all installed packages

# Memory usage
gc()  # Garbage collection
object.size(ls())  # Check object sizes

# Debug mode
options(shiny.trace = TRUE)  # Enable Shiny debugging
```

### Error Reporting
When reporting issues, include:
1. R version: `R.version.string`
2. Operating system
3. Complete error message
4. Code that caused the error
5. Session info: `sessionInfo()`

## Manual Testing

### Test Individual Components
```r
# Test R basics functions
source("r_basics.R")
demonstrate_basic_functions()

# Test tidyverse
source("tidyverse_demo.R")
demonstrate_dplyr()

# Test popular libraries
source("popular_libraries.R")
demonstrate_popular_libraries()
```

### Minimal Working Example
```r
library(shiny)

# Simple test app
ui <- fluidPage(
  titlePanel("Test R App"),
  mainPanel(
    h3("R is working!"),
    verbatimTextOutput("info")
  )
)

server <- function(input, output) {
  output$info <- renderText({
    paste("R version:", R.version.string)
  })
}

shinyApp(ui = ui, server = server)
```

---

**Last Updated:** June 22, 2025
**Contact:** Check debug.md for development history and full code documentation
