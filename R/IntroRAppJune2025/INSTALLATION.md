# R Installation and Setup Guide
## For the Comprehensive R Introduction App

Since R is not currently installed on this system, here's a complete guide to get everything working.

## Step 1: Install R

### Windows Installation
1. **Download R:**
   - Go to https://cran.r-project.org/
   - Click "Download R for Windows"
   - Click "base"
   - Download the latest version (e.g., "R-4.3.x-win.exe")

2. **Install R:**
   - Run the downloaded installer
   - **Important:** Check "Add R to PATH" during installation
   - Use default settings for everything else
   - Complete the installation

3. **Verify Installation:**
   ```cmd
   R --version
   ```

## Step 2: Install RStudio (Recommended)

1. **Download RStudio:**
   - Go to https://posit.co/downloads/
   - Download "RStudio Desktop" (free version)

2. **Install RStudio:**
   - Run the installer with default settings

## Step 3: Set Up the R Introduction App

### Option A: Using RStudio (Easiest)
1. **Open RStudio**
2. **Set working directory:**
   ```r
   setwd("c:/Proj/Languages/R/IntroRAppJune2025")
   ```
3. **Open the project:**
   - File → Open File → Select `app.R`
4. **Install packages:**
   ```r
   source("setup.R")
   ```
5. **Run the app:**
   - Click the "Run App" button in RStudio
   - Or run: `shiny::runApp()`

### Option B: Using R Console
1. **Open R Console** (search for "R" in Start menu)
2. **Navigate to project:**
   ```r
   setwd("c:/Proj/Languages/R/IntroRAppJune2025")
   ```
3. **Install packages:**
   ```r
   source("setup.R")
   ```
4. **Run the app:**
   ```r
   shiny::runApp()
   ```

### Option C: Using Command Line
1. **Open Command Prompt or PowerShell**
2. **Navigate to project directory:**
   ```cmd
   cd "c:\Proj\Languages\R\IntroRAppJune2025"
   ```
3. **Run the batch file:**
   ```cmd
   run_app.bat
   ```

## Step 4: Verify Everything Works

### Quick Test
Run the test script to check if everything is working:
```r
source("test_app.R")
```

This will check:
- R installation
- File structure
- Package availability
- Basic functionality

## Troubleshooting

### Common Issues

**1. "R is not recognized"**
- R is not in system PATH
- Reinstall R and check "Add to PATH" option
- Or use RStudio instead

**2. "Package installation failed"**
- Check internet connection
- Try installing packages one by one:
  ```r
  install.packages("shiny")
  install.packages("dplyr")
  install.packages("ggplot2")
  ```

**3. "Cannot open file"**
- Check working directory: `getwd()`
- Make sure you're in the correct folder
- Verify files exist: `list.files()`

**4. "Port already in use"**
- Try a different port: `shiny::runApp(port = 8080)`
- Or restart R session

### Package Installation Issues

If `source("setup.R")` fails, try this manual approach:

```r
# Essential packages first
install.packages(c("shiny", "shinydashboard"))

# Data manipulation
install.packages(c("dplyr", "ggplot2", "DT"))

# Interactive components
install.packages(c("plotly", "leaflet"))

# Full tidyverse (includes many packages)
install.packages("tidyverse")

# Additional packages
install.packages(c("corrplot", "caret", "jsonlite"))
```

## System Requirements

### Minimum Requirements
- **OS:** Windows 10 or later
- **RAM:** 4 GB (8 GB recommended)
- **Storage:** 2 GB free space
- **Internet:** For package downloads

### R Version Compatibility
- **Minimum:** R 4.0.0
- **Recommended:** R 4.3.0 or later
- **Packages:** All packages are compatible with R 4.0+

## File Structure

After installation, your directory should contain:

```
IntroRAppJune2025/
├── app.R                    # Main Shiny application
├── r_basics.R              # R fundamentals
├── tidyverse_demo.R         # Tidyverse examples
├── popular_libraries.R      # Popular packages
├── language_constructs.R    # Language features
├── analysis_functions.R     # Statistical analysis
├── setup.R                 # Package installer
├── run_app.R               # Quick start script
├── run_app.bat             # Windows batch file
├── test_app.R              # Test script
├── requirements.txt        # Package list
├── README.md               # Documentation
├── DEBUGGING.md            # Troubleshooting guide
└── debug.md                # Development history
```

## Next Steps

Once everything is installed:

1. **Start with basics:** Explore the "R Basics" tab
2. **Learn tidyverse:** Check out data manipulation examples
3. **Try visualizations:** Create interactive plots
4. **Explore libraries:** See what R can do
5. **Practice:** Modify examples and experiment

## Getting Help

### If You're Stuck
1. **Check DEBUGGING.md** for detailed troubleshooting
2. **Run test_app.R** to diagnose issues
3. **Use RStudio** - it handles many issues automatically
4. **Ask for help:**
   - RStudio Community: https://community.rstudio.com/
   - Stack Overflow: Use tags `[r]` and `[shiny]`

### Learning Resources
- **Built-in help:** `?function_name` or `help(function_name)`
- **R for Data Science:** https://r4ds.had.co.nz/
- **Shiny tutorials:** https://shiny.rstudio.com/tutorial/

---

**Ready to explore R? Let's get started! 🚀**
