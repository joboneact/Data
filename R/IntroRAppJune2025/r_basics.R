# ==============================================================================
# R Basics Demonstrations
# ==============================================================================

demonstrate_basic_functions <- function() {
  output <- paste(
    "# Built-in functions",
    "length(c(1,2,3,4,5))    # Length of vector: 5",
    "sum(1:10)              # Sum: 55", 
    "mean(c(1,2,3,4,5))     # Mean: 3",
    "median(c(1,2,3,4,5))   # Median: 3",
    "sd(c(1,2,3,4,5))       # Standard deviation: 1.58",
    "min(c(5,2,8,1))        # Minimum: 1",
    "max(c(5,2,8,1))        # Maximum: 8",
    "sqrt(16)               # Square root: 4",
    "abs(-5)                # Absolute value: 5",
    "round(3.14159, 2)      # Round to 2 decimals: 3.14",
    sep = "\n"
  )
  return(output)
}

demonstrate_data_types <- function() {
  output <- paste(
    "# R Data Types",
    "",
    "# Numeric (double)",
    "num_var <- 3.14",
    "class(num_var)  # 'numeric'",
    "",
    "# Integer", 
    "int_var <- 42L",
    "class(int_var)  # 'integer'",
    "",
    "# Character (string)",
    "char_var <- 'Hello R!'",
    "class(char_var)  # 'character'",
    "",
    "# Logical (boolean)",
    "log_var <- TRUE",
    "class(log_var)  # 'logical'",
    "",
    "# Complex",
    "comp_var <- 1 + 2i",
    "class(comp_var)  # 'complex'",
    "",
    "# Factor",
    "factor_var <- factor(c('A', 'B', 'A', 'C'))",
    "class(factor_var)  # 'factor'",
    "",
    "# Date",
    "date_var <- as.Date('2025-06-21')",
    "class(date_var)  # 'Date'",
    sep = "\n"
  )
  return(output)
}

demonstrate_data_structures <- function() {
  output <- paste(
    "# R Data Structures",
    "",
    "# 1. Vector (1D, homogeneous)",
    "numeric_vec <- c(1, 2, 3, 4, 5)",
    "char_vec <- c('apple', 'banana', 'cherry')",
    "logical_vec <- c(TRUE, FALSE, TRUE)",
    "",
    "# 2. Matrix (2D, homogeneous)",
    "mat <- matrix(1:12, nrow=3, ncol=4)",
    "dim(mat)  # 3 4",
    "",
    "# 3. Array (nD, homogeneous)",
    "arr <- array(1:24, dim=c(2,3,4))",
    "",
    "# 4. List (1D, heterogeneous)",
    "my_list <- list(",
    "  numbers = 1:5,",
    "  text = 'hello',", 
    "  matrix = matrix(1:4, 2, 2)",
    ")",
    "",
    "# 5. Data Frame (2D, heterogeneous columns)",
    "df <- data.frame(",
    "  name = c('Alice', 'Bob', 'Charlie'),",
    "  age = c(25, 30, 35),",
    "  married = c(TRUE, FALSE, TRUE)",
    ")",
    "",
    "# Accessing elements",
    "df$name        # Column by name",
    "df[1, ]        # First row",
    "df[, 2]        # Second column",
    "df[1:2, 1:2]   # Subset",
    sep = "\n"
  )
  return(output)
}

create_sample_dataframe <- function() {
  # Create a comprehensive sample dataset
  set.seed(42)
  n <- 100
  
  df <- data.frame(
    ID = 1:n,
    Name = paste("Person", 1:n),
    Age = sample(18:65, n, replace = TRUE),
    Gender = sample(c("Male", "Female"), n, replace = TRUE),
    Department = sample(c("Engineering", "Marketing", "Sales", "HR", "Finance"), n, replace = TRUE),
    Salary = round(rnorm(n, mean = 60000, sd = 15000), 0),
    Years_Experience = sample(0:20, n, replace = TRUE),
    Performance_Score = round(rnorm(n, mean = 7.5, sd = 1.5), 1),
    Remote_Work = sample(c(TRUE, FALSE), n, replace = TRUE),
    Join_Date = sample(seq(as.Date('2015-01-01'), as.Date('2025-01-01'), by="day"), n),
    stringsAsFactors = FALSE
  )
  
  # Ensure performance scores are between 1-10
  df$Performance_Score <- pmax(1, pmin(10, df$Performance_Score))
  
  return(df)
}
