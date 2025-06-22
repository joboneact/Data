# ==============================================================================
# Visualization and Statistical Analysis Functions
# ==============================================================================

create_dynamic_plot <- function(plot_type) {
  library(ggplot2)
  
  # Use mtcars dataset for demonstrations
  data(mtcars)
  
  switch(plot_type,
    "Scatter Plot" = {
      ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
        geom_point(size = 3, alpha = 0.7) +
        geom_smooth(method = "lm", se = FALSE) +
        labs(title = "Scatter Plot: Weight vs MPG",
             x = "Weight (1000 lbs)", y = "Miles per Gallon",
             color = "Cylinders") +
        theme_minimal() +
        theme(plot.title = element_text(hjust = 0.5))
    },
    "Bar Chart" = {
      cyl_summary <- mtcars %>%
        group_by(cyl) %>%
        summarise(avg_mpg = mean(mpg), .groups = 'drop')
      
      ggplot(cyl_summary, aes(x = factor(cyl), y = avg_mpg, fill = factor(cyl))) +
        geom_col(alpha = 0.8) +
        labs(title = "Average MPG by Number of Cylinders",
             x = "Number of Cylinders", y = "Average MPG",
             fill = "Cylinders") +
        theme_minimal() +
        theme(plot.title = element_text(hjust = 0.5)) +
        scale_fill_brewer(type = "qual", palette = "Set2")
    },
    "Histogram" = {
      ggplot(mtcars, aes(x = mpg)) +
        geom_histogram(bins = 15, fill = "skyblue", color = "black", alpha = 0.7) +
        labs(title = "Distribution of Miles per Gallon",
             x = "Miles per Gallon", y = "Frequency") +
        theme_minimal() +
        theme(plot.title = element_text(hjust = 0.5)) +
        geom_vline(aes(xintercept = mean(mpg)), color = "red", linetype = "dashed", linewidth = 1)
    },
    "Box Plot" = {
      ggplot(mtcars, aes(x = factor(cyl), y = mpg, fill = factor(cyl))) +
        geom_boxplot(alpha = 0.7) +
        geom_jitter(width = 0.2, alpha = 0.5) +
        labs(title = "MPG Distribution by Number of Cylinders",
             x = "Number of Cylinders", y = "Miles per Gallon",
             fill = "Cylinders") +
        theme_minimal() +
        theme(plot.title = element_text(hjust = 0.5)) +
        scale_fill_brewer(type = "qual", palette = "Set3")
    },
    "Line Chart" = {
      # Create time series data
      years <- 2015:2025
      efficiency <- c(20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40)
      df <- data.frame(Year = years, Efficiency = efficiency)
      
      ggplot(df, aes(x = Year, y = Efficiency)) +
        geom_line(color = "blue", linewidth = 1.2) +
        geom_point(color = "red", size = 3) +
        labs(title = "Average Car Efficiency Over Time",
             x = "Year", y = "Average MPG") +
        theme_minimal() +
        theme(plot.title = element_text(hjust = 0.5)) +
        scale_x_continuous(breaks = years)
    }
  )
}

create_correlation_plot <- function() {
  library(corrplot)
  
  # Select numeric columns from mtcars
  numeric_data <- mtcars[, c("mpg", "cyl", "disp", "hp", "drat", "wt", "qsec")]
  
  # Calculate correlation matrix
  cor_matrix <- cor(numeric_data)
  
  # Create correlation plot
  corrplot(cor_matrix, 
           method = "color", 
           type = "upper", 
           order = "hclust",
           tl.cex = 0.8, 
           tl.col = "black", 
           tl.srt = 45,
           title = "Correlation Matrix of Car Features",
           mar = c(0,0,2,0))
}

demonstrate_descriptive_stats <- function() {
  output <- paste(
    "# Descriptive Statistics in R",
    "",
    "# Load sample data",
    "data(mtcars)",
    "",
    "# === Basic Statistics ===",
    "mean(mtcars$mpg)      # Mean: 20.09",
    "median(mtcars$mpg)    # Median: 19.2", 
    "sd(mtcars$mpg)        # Standard deviation: 6.03",
    "var(mtcars$mpg)       # Variance: 36.32",
    "min(mtcars$mpg)       # Minimum: 10.4",
    "max(mtcars$mpg)       # Maximum: 33.9",
    "range(mtcars$mpg)     # Range: c(10.4, 33.9)",
    "IQR(mtcars$mpg)       # Interquartile range: 7.38",
    "",
    "# === Quantiles ===",
    "quantile(mtcars$mpg)  # 0%, 25%, 50%, 75%, 100%",
    "quantile(mtcars$mpg, c(0.1, 0.9))  # 10th and 90th percentiles",
    "",
    "# === Summary Function ===",
    "summary(mtcars$mpg)",
    "# Min. 1st Qu. Median Mean 3rd Qu. Max.",
    "# 10.40  15.43  19.20 20.09  22.80 33.90",
    "",
    "# === Multiple Variables ===",
    "summary(mtcars[, c('mpg', 'hp', 'wt')])",
    "",
    "# === Grouped Statistics ===",
    "library(dplyr)",
    "mtcars %>%",
    "  group_by(cyl) %>%",
    "  summarise(",
    "    count = n(),",
    "    mean_mpg = mean(mpg),",
    "    sd_mpg = sd(mpg),",
    "    min_mpg = min(mpg),",
    "    max_mpg = max(mpg)",
    "  )",
    "",
    "# === Skewness and Kurtosis ===",
    "library(moments)",
    "skewness(mtcars$mpg)  # Measure of asymmetry",
    "kurtosis(mtcars$mpg)  # Measure of tail heaviness",
    "",
    "# === Frequency Tables ===",
    "table(mtcars$cyl)     # Frequency table",
    "prop.table(table(mtcars$cyl))  # Proportions",
    "",
    "# Cross-tabulation",
    "table(mtcars$cyl, mtcars$am)",
    "",
    "# === Missing Value Analysis ===",
    "# Create data with missing values",
    "data_with_na <- mtcars",
    "data_with_na$mpg[c(1,3,5)] <- NA",
    "",
    "sum(is.na(data_with_na$mpg))     # Count of missing values",
    "mean(is.na(data_with_na$mpg))    # Proportion missing",
    "complete.cases(data_with_na)     # Complete cases",
    "",
    "# Handle missing values",
    "mean(data_with_na$mpg, na.rm = TRUE)  # Mean excluding NA",
    sep = "\n"
  )
  return(output)
}

demonstrate_statistical_tests <- function() {
  output <- paste(
    "# Statistical Tests in R",
    "",
    "# Load sample data",
    "data(mtcars)",
    "",
    "# === One-Sample t-test ===",
    "# Test if mean mpg differs from 20",
    "t.test(mtcars$mpg, mu = 20)",
    "",
    "# === Two-Sample t-test ===",
    "# Compare mpg between automatic and manual transmission",
    "t.test(mpg ~ am, data = mtcars)",
    "",
    "# === Paired t-test ===",
    "# Create paired data for demonstration",
    "before <- c(20, 22, 19, 21, 25, 23, 24, 18)",
    "after <- c(22, 25, 21, 24, 28, 26, 27, 21)",
    "t.test(before, after, paired = TRUE)",
    "",
    "# === Chi-Square Test ===",
    "# Test independence between variables",
    "chisq.test(table(mtcars$cyl, mtcars$am))",
    "",
    "# === ANOVA ===",
    "# Test differences in mpg across cylinder groups",
    "anova_result <- aov(mpg ~ factor(cyl), data = mtcars)",
    "summary(anova_result)",
    "",
    "# Post-hoc tests",
    "TukeyHSD(anova_result)",
    "",
    "# === Correlation Tests ===",
    "# Pearson correlation",
    "cor.test(mtcars$mpg, mtcars$wt)",
    "",
    "# Spearman correlation (non-parametric)",
    "cor.test(mtcars$mpg, mtcars$wt, method = 'spearman')",
    "",
    "# === Normality Tests ===",
    "# Shapiro-Wilk test",
    "shapiro.test(mtcars$mpg)",
    "",
    "# Kolmogorov-Smirnov test",
    "ks.test(mtcars$mpg, 'pnorm', mean(mtcars$mpg), sd(mtcars$mpg))",
    "",
    "# === Non-parametric Tests ===",
    "# Wilcoxon rank-sum test (Mann-Whitney U)",
    "wilcox.test(mpg ~ am, data = mtcars)",
    "",
    "# Kruskal-Wallis test (non-parametric ANOVA)",
    "kruskal.test(mpg ~ factor(cyl), data = mtcars)",
    "",
    "# === Effect Size ===",
    "library(effectsize)",
    "cohens_d(mpg ~ am, data = mtcars)",
    "",
    "# === Power Analysis ===",
    "library(pwr)",
    "# Power analysis for t-test",
    "pwr.t.test(d = 0.5, sig.level = 0.05, power = 0.8)",
    "",
    "# === Multiple Comparisons ===",
    "# Bonferroni correction",
    "p_values <- c(0.01, 0.03, 0.05, 0.08)",
    "p.adjust(p_values, method = 'bonferroni')",
    "",
    "# False Discovery Rate",
    "p.adjust(p_values, method = 'fdr')",
    sep = "\n"
  )
  return(output)
}

demonstrate_regression <- function() {
  output <- paste(
    "# Linear Regression Analysis",
    "",
    "# Load data",
    "data(mtcars)",
    "",
    "# === Simple Linear Regression ===",
    "model1 <- lm(mpg ~ wt, data = mtcars)",
    "summary(model1)",
    "",
    "# Key outputs:",
    "# - Coefficients: estimates and significance",
    "# - R-squared: proportion of variance explained",
    "# - F-statistic: overall model significance",
    "",
    "# === Multiple Linear Regression ===",
    "model2 <- lm(mpg ~ wt + hp + cyl, data = mtcars)",
    "summary(model2)",
    "",
    "# === Model Comparison ===",
    "anova(model1, model2)  # Compare nested models",
    "",
    "# AIC comparison (lower is better)",
    "AIC(model1, model2)",
    "",
    "# === Model Diagnostics ===",
    "# Residual plots",
    "par(mfrow = c(2, 2))",
    "plot(model2)",
    "",
    "# === Predictions ===",
    "# Predict for new data",
    "new_car <- data.frame(wt = 3.0, hp = 150, cyl = 6)",
    "predict(model2, new_car, interval = 'confidence')",
    "predict(model2, new_car, interval = 'prediction')",
    "",
    "# === Stepwise Regression ===",
    "# Automatic variable selection",
    "full_model <- lm(mpg ~ ., data = mtcars)",
    "step_model <- step(full_model, direction = 'both')",
    "",
    "# === Polynomial Regression ===",
    "poly_model <- lm(mpg ~ poly(wt, 2), data = mtcars)",
    "summary(poly_model)",
    "",
    "# === Interaction Terms ===",
    "interaction_model <- lm(mpg ~ wt * hp, data = mtcars)",
    "summary(interaction_model)",
    "",
    "# === Regularized Regression ===",
    "library(glmnet)",
    "x <- model.matrix(mpg ~ ., mtcars)[, -1]",
    "y <- mtcars$mpg",
    "",
    "# Ridge regression",
    "ridge_model <- glmnet(x, y, alpha = 0)",
    "",
    "# Lasso regression", 
    "lasso_model <- glmnet(x, y, alpha = 1)",
    "",
    "# Cross-validation for lambda selection",
    "cv_ridge <- cv.glmnet(x, y, alpha = 0)",
    "cv_lasso <- cv.glmnet(x, y, alpha = 1)",
    "",
    "# === Logistic Regression ===",
    "# Create binary outcome",
    "mtcars$high_mpg <- ifelse(mtcars$mpg > median(mtcars$mpg), 1, 0)",
    "",
    "logit_model <- glm(high_mpg ~ wt + hp, ",
    "                   data = mtcars, family = binomial)",
    "summary(logit_model)",
    "",
    "# Odds ratios",
    "exp(coef(logit_model))",
    "",
    "# === Model Validation ===",
    "library(caret)",
    "",
    "# Cross-validation",
    "train_control <- trainControl(method = 'cv', number = 10)",
    "cv_model <- train(mpg ~ wt + hp + cyl, data = mtcars,",
    "                  method = 'lm', trControl = train_control)",
    "print(cv_model)",
    sep = "\n"
  )
  return(output)
}

create_regression_plot <- function() {
  library(ggplot2)
  
  # Fit model
  model <- lm(mpg ~ wt, data = mtcars)
  
  # Create plot with regression line
  ggplot(mtcars, aes(x = wt, y = mpg)) +
    geom_point(size = 3, alpha = 0.7, color = "steelblue") +
    geom_smooth(method = "lm", se = TRUE, color = "red", fill = "pink") +
    labs(
      title = "Linear Regression: MPG vs Weight",
      subtitle = paste("R² =", round(summary(model)$r.squared, 3)),
      x = "Weight (1000 lbs)",
      y = "Miles per Gallon"
    ) +
    theme_minimal() +
    theme(
      plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
      plot.subtitle = element_text(hjust = 0.5, size = 12)
    )
}

perform_realworld_analysis <- function() {
  output <- paste(
    "# Real-World Data Analysis Example",
    "# Analyzing Employee Performance Dataset",
    "",
    "# === Data Preparation ===",
    "library(dplyr)",
    "library(ggplot2)",
    "",
    "# Create realistic employee dataset",
    "set.seed(42)",
    "employees <- data.frame(",
    "  ID = 1:200,",
    "  Age = sample(22:65, 200, replace = TRUE),",
    "  Experience = sample(0:25, 200, replace = TRUE),", 
    "  Department = sample(c('Engineering', 'Sales', 'Marketing', 'HR'), 200, replace = TRUE),",
    "  Salary = round(rnorm(200, 65000, 15000)),",
    "  Performance = round(rnorm(200, 7.5, 1.5), 1),",
    "  Remote = sample(c(TRUE, FALSE), 200, replace = TRUE)",
    ")",
    "",
    "# === Exploratory Data Analysis ===",
    "# 1. Basic statistics",
    "summary(employees)",
    "",
    "# 2. Performance by department",
    "dept_performance <- employees %>%",
    "  group_by(Department) %>%",
    "  summarise(",
    "    avg_performance = mean(Performance),",
    "    avg_salary = mean(Salary),",
    "    count = n(),",
    "    .groups = 'drop'",
    "  ) %>%",
    "  arrange(desc(avg_performance))",
    "",
    "print(dept_performance)",
    "",
    "# === Statistical Analysis ===",
    "# 1. Correlation between variables",
    "cor(employees[, c('Age', 'Experience', 'Salary', 'Performance')])",
    "",
    "# 2. Performance differences by department",
    "anova_result <- aov(Performance ~ Department, data = employees)",
    "summary(anova_result)",
    "",
    "# 3. Salary prediction model",
    "salary_model <- lm(Salary ~ Age + Experience + Performance + Department, ",
    "                   data = employees)",
    "summary(salary_model)",
    "",
    "# === Key Insights ===",
    "insights <- employees %>%",
    "  summarise(",
    "    total_employees = n(),",
    "    avg_age = round(mean(Age), 1),",
    "    avg_experience = round(mean(Experience), 1),",
    "    avg_performance = round(mean(Performance), 2),",
    "    avg_salary = round(mean(Salary), 0),",
    "    remote_percentage = round(mean(Remote) * 100, 1)",
    "  )",
    "",
    "print('=== ANALYSIS SUMMARY ===')",
    "print(paste('Total Employees:', insights$total_employees))",
    "print(paste('Average Age:', insights$avg_age, 'years'))",
    "print(paste('Average Experience:', insights$avg_experience, 'years'))",
    "print(paste('Average Performance:', insights$avg_performance, '/10'))",
    "print(paste('Average Salary: $', format(insights$avg_salary, big.mark = ',')))",
    "print(paste('Remote Workers:', insights$remote_percentage, '%'))",
    "",
    "# === Advanced Analysis ===",
    "# 1. High performers analysis",
    "high_performers <- employees %>%",
    "  filter(Performance >= 8.5) %>%",
    "  group_by(Department) %>%",
    "  summarise(count = n(), .groups = 'drop')",
    "",
    "print('High Performers by Department:')",
    "print(high_performers)",
    "",
    "# 2. Salary equity analysis",
    "salary_equity <- employees %>%",
    "  group_by(Department) %>%",
    "  summarise(",
    "    salary_range = max(Salary) - min(Salary),",
    "    salary_cv = sd(Salary) / mean(Salary) * 100,",
    "    .groups = 'drop'",
    "  ) %>%",
    "  arrange(desc(salary_cv))",
    "",
    "print('Salary Variability by Department:')",
    "print(salary_equity)",
    sep = "\n"
  )
  return(output)
}

create_analysis_table <- function() {
  # Create the same dataset as in the analysis
  set.seed(42)
  employees <- data.frame(
    ID = 1:200,
    Age = sample(22:65, 200, replace = TRUE),
    Experience = sample(0:25, 200, replace = TRUE),
    Department = sample(c('Engineering', 'Sales', 'Marketing', 'HR'), 200, replace = TRUE),
    Salary = round(rnorm(200, 65000, 15000)),
    Performance = round(rnorm(200, 7.5, 1.5), 1),
    Remote = sample(c(TRUE, FALSE), 200, replace = TRUE),
    stringsAsFactors = FALSE
  )
  
  # Create summary table
  summary_table <- employees %>%
    group_by(Department) %>%
    summarise(
      Count = n(),
      Avg_Age = round(mean(Age), 1),
      Avg_Experience = round(mean(Experience), 1),
      Avg_Performance = round(mean(Performance), 2),
      Avg_Salary = round(mean(Salary), 0),
      Remote_Pct = round(mean(Remote) * 100, 1),
      .groups = 'drop'
    ) %>%
    arrange(desc(Avg_Performance))
  
  return(summary_table)
}

create_insights_plot <- function() {
  library(ggplot2)
  library(dplyr)
  
  # Create the same dataset
  set.seed(42)
  employees <- data.frame(
    Age = sample(22:65, 200, replace = TRUE),
    Experience = sample(0:25, 200, replace = TRUE),
    Department = sample(c('Engineering', 'Sales', 'Marketing', 'HR'), 200, replace = TRUE),
    Salary = round(rnorm(200, 65000, 15000)),
    Performance = round(rnorm(200, 7.5, 1.5), 1),
    Remote = sample(c(TRUE, FALSE), 200, replace = TRUE),
    stringsAsFactors = FALSE
  )
  
  # Create performance vs salary plot
  ggplot(employees, aes(x = Performance, y = Salary, color = Department)) +
    geom_point(size = 3, alpha = 0.7) +
    geom_smooth(method = "lm", se = FALSE, linewidth = 1.2) +
    facet_wrap(~Department, scales = "free") +
    labs(
      title = "Employee Performance vs Salary by Department",
      subtitle = "Analysis of 200 employees across 4 departments",
      x = "Performance Score (1-10)",
      y = "Annual Salary ($)",
      color = "Department"
    ) +
    theme_minimal() +
    theme(
      plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
      plot.subtitle = element_text(hjust = 0.5, size = 11),
      strip.text = element_text(face = "bold"),
      legend.position = "bottom"
    ) +
    scale_y_continuous(labels = scales::dollar_format()) +
    scale_color_brewer(type = "qual", palette = "Set1")
}
