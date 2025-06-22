# ==============================================================================
# Tidyverse Demonstrations
# ==============================================================================

demonstrate_dplyr <- function() {
  output <- paste(
    "# dplyr: Grammar of data manipulation",
    "",
    "library(dplyr)",
    "",
    "# Sample data",
    "df <- data.frame(",
    "  name = c('Alice', 'Bob', 'Charlie', 'Diana'),",
    "  age = c(25, 30, 35, 28),",
    "  salary = c(50000, 60000, 70000, 55000),",
    "  dept = c('IT', 'HR', 'IT', 'Finance')",
    ")",
    "",
    "# Key dplyr verbs:",
    "",
    "# 1. filter() - subset rows",
    "df %>% filter(age > 28)",
    "",
    "# 2. select() - subset columns", 
    "df %>% select(name, salary)",
    "",
    "# 3. mutate() - create new columns",
    "df %>% mutate(annual_bonus = salary * 0.1)",
    "",
    "# 4. arrange() - sort rows",
    "df %>% arrange(desc(salary))",
    "",
    "# 5. summarise() - aggregate data",
    "df %>% summarise(",
    "  avg_salary = mean(salary),",
    "  max_age = max(age)",
    ")",
    "",
    "# 6. group_by() - group operations",
    "df %>% ",
    "  group_by(dept) %>%",
    "  summarise(avg_salary = mean(salary))",
    "",
    "# Chaining operations with %>%",
    "result <- df %>%",
    "  filter(age > 25) %>%",
    "  mutate(salary_k = salary / 1000) %>%",
    "  arrange(desc(salary_k)) %>%",
    "  select(name, age, salary_k)",
    sep = "\n"
  )
  return(output)
}

demonstrate_ggplot <- function() {
  library(ggplot2)
  
  # Create sample data
  set.seed(42)
  df <- data.frame(
    x = rnorm(100),
    y = rnorm(100) + rnorm(100, 0, 0.5),
    group = sample(c("A", "B", "C"), 100, replace = TRUE)
  )
  
  # Create a beautiful ggplot
  p <- ggplot(df, aes(x = x, y = y, color = group)) +
    geom_point(size = 3, alpha = 0.7) +
    geom_smooth(method = "lm", se = FALSE) +
    scale_color_brewer(type = "qual", palette = "Set1") +
    labs(
      title = "ggplot2 Demonstration",
      subtitle = "Scatter plot with trend lines by group",
      x = "X Variable",
      y = "Y Variable",
      color = "Group"
    ) +
    theme_minimal() +
    theme(
      plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
      plot.subtitle = element_text(hjust = 0.5, size = 12),
      legend.position = "bottom"
    )
  
  return(p)
}

demonstrate_pipes <- function() {
  output <- paste(
    "# The Magic of Pipe Operator (%>%)",
    "",
    "library(dplyr)",
    "",
    "# Without pipes (nested functions)",
    "result1 <- arrange(",
    "  summarise(",
    "    group_by(",
    "      filter(mtcars, mpg > 20),",
    "      cyl",
    "    ),",
    "    avg_mpg = mean(mpg)",
    "  ),",
    "  desc(avg_mpg)",
    ")",
    "",
    "# With pipes (readable left-to-right)",
    "result2 <- mtcars %>%",
    "  filter(mpg > 20) %>%",
    "  group_by(cyl) %>%",
    "  summarise(avg_mpg = mean(mpg)) %>%",
    "  arrange(desc(avg_mpg))",
    "",
    "# More pipe examples:",
    "",
    "# String manipulation with stringr",
    "library(stringr)",
    "text <- c('  Hello World  ', 'R Programming')",
    "",
    "cleaned <- text %>%",
    "  str_trim() %>%           # Remove whitespace",
    "  str_to_lower() %>%       # Convert to lowercase", 
    "  str_replace_all(' ', '_') # Replace spaces",
    "",
    "# Date manipulation with lubridate",
    "library(lubridate)",
    "dates <- c('2025-06-21', '2025-12-25')",
    "",
    "date_info <- dates %>%",
    "  ymd() %>%                # Parse dates",
    "  month(label = TRUE) %>%  # Extract month names",
    "  as.character()",
    "",
    "# Functional programming with purrr",
    "library(purrr)",
    "numbers <- list(1:3, 4:6, 7:9)",
    "",
    "sums <- numbers %>%",
    "  map_dbl(sum) %>%         # Apply sum to each element",
    "  round(2)                 # Round results",
    sep = "\n"
  )
  return(output)
}
