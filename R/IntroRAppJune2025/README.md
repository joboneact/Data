# Comprehensive R Introduction App - June 2025

This interactive Shiny application provides a complete introduction to R programming, covering basics, tidyverse, popular libraries, and key language constructs.

## Features

### 📚 **R Basics**
- Basic operations and variable assignment
- Built-in functions and data types
- Data structures (vectors, matrices, lists, data frames)

### 🧹 **Tidyverse Ecosystem**
- **dplyr**: Data manipulation with filter, select, mutate, arrange, summarise
- **ggplot2**: Grammar of graphics for beautiful visualizations
- **tidyr**: Data tidying and reshaping
- **Pipe operator (%>%)**: Clean, readable code chains
- **stringr, lubridate, purrr, forcats**: Specialized data handling

### 🧩 **Popular Libraries**
- **Shiny**: Interactive web applications
- **Leaflet**: Interactive maps
- **Plotly**: Interactive visualizations
- **DT**: Interactive data tables
- **caret**: Machine learning
- **httr/jsonlite**: Web APIs and JSON

### 🏗️ **Language Constructs**
- Control structures (if/else, switch)
- Loops (for, while, repeat) vs apply functions
- Function creation and closures
- Error handling with try/tryCatch
- Debugging tools and techniques

### 📊 **Data Visualization Gallery**
- Dynamic plot generation
- Multiple chart types (scatter, bar, histogram, box, line)
- Correlation matrices
- Interactive visualizations

### 📈 **Statistical Analysis**
- Descriptive statistics
- Hypothesis testing (t-tests, ANOVA, chi-square)
- Linear and logistic regression
- Model diagnostics and validation
- Effect sizes and power analysis

### 🚀 **Real-world Examples**
- Complete data analysis workflow
- Employee performance analysis
- Best practices demonstration

## Installation

### Prerequisites
- R (version 4.0 or higher)
- RStudio (recommended)

### Install Required Packages

Run this script in R to install all required packages:

```r
# Install required packages
packages <- c(
  "shiny", "shinydashboard", "DT", "plotly",
  "dplyr", "ggplot2", "tidyr", "readr", "stringr", 
  "lubridate", "purrr", "forcats", "leaflet",
  "corrplot", "moments", "effectsize", "pwr",
  "caret", "glmnet", "randomForest", "jsonlite",
  "httr", "knitr", "kableExtra", "ggthemes", "scales"
)

# Install packages that are not already installed
new_packages <- packages[!(packages %in% installed.packages()[,"Package"])]
if(length(new_packages)) install.packages(new_packages)

# Load tidyverse (includes many of the above)
if(!"tidyverse" %in% installed.packages()[,"Package"]) {
  install.packages("tidyverse")
}
```

## Running the Application

### Prerequisites
- R (version 4.0 or higher) - **[Install from CRAN](https://cran.r-project.org/)**
- RStudio (recommended) - **[Download here](https://posit.co/downloads/)**

### Quick Start

**If R is not installed:** See `INSTALLATION.md` for complete setup guide.

1. **Navigate to the directory:**
   ```r
   setwd("c:/Proj/Languages/R/IntroRAppJune2025")
   ```

2. **Quick start (recommended):**
   ```r
   source("run_app.R")  # Auto-checks and installs packages
   ```

3. **Alternative methods:**
   ```r
   # Option A: Install packages first
   source("setup.R")    # Install all required packages
   shiny::runApp()      # Start the application
   
   # Option B: Use Windows batch file
   # Double-click: run_app.bat
   
   # Option C: Test functionality first
   source("test_app.R") # Run diagnostics
   ```

### Troubleshooting

**Common Issues:**
- **"R not found"** → Install R from CRAN, ensure it's in PATH
- **"Package not found"** → Run `source("setup.R")`
- **"Cannot source files"** → Check working directory with `getwd()`
- **"Port in use"** → Try `shiny::runApp(port = 8080)`

**For detailed help:** See `DEBUGGING.md` and `INSTALLATION.md`

## File Structure

```
IntroRAppJune2025/
├── app.R                    # Main Shiny application
├── r_basics.R              # R fundamentals demonstrations
├── tidyverse_demo.R         # Tidyverse examples
├── popular_libraries.R      # Popular R packages showcase
├── language_constructs.R    # Language features and constructs
├── analysis_functions.R     # Statistical analysis and visualization
├── requirements.txt         # Required R packages
└── README.md               # This file
```

## Learning Path

### Beginners
1. Start with **R Basics** tab
2. Explore **Data Types & Structures**
3. Learn **Tidyverse** fundamentals
4. Try **Data Visualization** examples

### Intermediate
1. Study **Language Constructs**
2. Explore **Popular Libraries**
3. Practice **Statistical Analysis**
4. Review **Real-world Examples**

### Advanced
1. Examine source code in supporting R files
2. Modify examples to test understanding
3. Create custom analyses using provided templates
4. Extend the application with new features

## Key Concepts Covered

### Data Science Workflow
- **Import**: readr, readxl, httr, jsonlite
- **Tidy**: tidyr, dplyr, stringr
- **Transform**: dplyr, purrr, lubridate
- **Visualize**: ggplot2, plotly, leaflet
- **Model**: caret, glmnet, built-in stats
- **Communicate**: shiny, rmarkdown, knitr

### Programming Concepts
- **Functional Programming**: purrr, apply functions
- **Object-Oriented**: S3/S4 classes
- **Error Handling**: try, tryCatch, assertions
- **Performance**: vectorization, profiling
- **Best Practices**: Code style, documentation

### Statistical Methods
- **Descriptive Statistics**: Central tendency, dispersion
- **Inferential Statistics**: Hypothesis testing, confidence intervals
- **Regression Analysis**: Linear, logistic, regularized
- **Machine Learning**: Classification, regression, validation
- **Experimental Design**: Power analysis, effect sizes

## Tips for Learning R

1. **Practice Regularly**: Run code examples and modify them
2. **Read Documentation**: Use `?function_name` and `help(package)`
3. **Explore Data**: Use `str()`, `summary()`, `head()`, `glimpse()`
4. **Visualize Everything**: "The best way to understand data is to see it"
5. **Join Community**: R-Ladies, local R user groups, Stack Overflow
6. **Read Code**: Explore GitHub repositories and R packages
7. **Build Projects**: Apply skills to real problems

## Resources for Further Learning

### Books
- "R for Data Science" by Hadley Wickham
- "Advanced R" by Hadley Wickham
- "The Art of R Programming" by Norman Matloff

### Online Courses
- Coursera R Programming courses
- DataCamp R tracks
- edX Introduction to R

### Communities
- R-bloggers.com
- RStudio Community
- Twitter #rstats hashtag

## Contributing

This is an educational project. Feel free to:
- Add new examples or demonstrations
- Improve existing code
- Fix bugs or issues
- Enhance documentation
- Suggest new features

## License

This project is open source and available under the MIT License.

---

**Happy Learning with R! 📊🎯**

*Created in June 2025 - A comprehensive guide to modern R programming*
