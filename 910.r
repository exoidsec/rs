Based on the provided documents, here is the complete R code for **Practical 9** (Correlation and Visualization) and **Practical 10** (Linear and Logistic Regression).

### **Practical 9: Correlation and Matrix Visualization**
This practical demonstrates how to calculate correlation matrices, identify p-values for significance, and visualize relationships using the `corrplot` package.

**1. Basic Correlation Matrix and Significance**
```R
# Practical 9
# Creating a sample data frame
df = data.frame(temp = c(30, 28, 56, 38, 49, 16),
                icecream_sales = c(2400, 3000, 1500, 2700, 1750, 1800),
                coffee = c(250, 300, 360, 280, 350, 220))
df

# Calculating basic correlation
cor_df = cor(df)
cor_df

# Finding p-values for significance using Hmisc package
# install.packages("Hmisc") 
library("Hmisc")
p_values = rcorr(as.matrix(df))
p_values
```

**2. Visualizing Correlation Matrices (Using mtcars dataset)**
```R
# install.packages("corrplot")
library(corrplot)
data(mtcars)

# Calculate correlation for mtcars
M = cor(mtcars)

# Different visualization methods
corrplot(M, method="circle")   # Represented by circles
corrplot(M, method="pie")      # Represented by pie charts
corrplot(M, method="color")    # Represented by full color blocks
corrplot(M, method="number")   # Displays actual correlation coefficients
corrplot(M, method="ellipse")  # Represented by ellipses
corrplot(M, method="shade")    # Represented by shaded blocks
```

---

### **Practical 10: Regression Analysis**
This section covers both Simple Linear Regression (predicting a continuous value) and Logistic Regression (classification).

**1. Simple Linear Regression**
Used to find the relationship between Weight ($x$) and Height ($y$).
```R
# Practical 10
# Simple linear regression
x = c(180, 158, 120, 240, 330, 150, 250, 440, 105, 270) # Weight in Kg
y = c(39, 29, 48, 57, 33, 75, 94, 59, 29, 50)          # Height in cm

# Create the linear model
relation = lm(y ~ x)

# View model coefficients and summary statistics
print(relation)
summary(relation)

# Plotting the regression chart
plot(y, x, col="blue", main="Height & Weight Regression", 
     xlab="Weight in Kg", ylab="Height in cm")
```

**2. Logistic Regression**
Used to predict a binary outcome (e.g., Automatic vs. Manual transmission in the `mtcars` dataset).
```R
# Logistic regression using mtcars dataset
# am: Transmission (0 = automatic, 1 = manual)
# Selecting predictors: cyl, hp, wt
input = mtcars[c("am", "cyl", "hp", "wt")]

# Preview data
head(input)

# Plotting the relationships
plot(input, col="red")

# Creating the Logistic Regression Model (Generalized Linear Model)
am.data = glm(am ~ cyl + hp + wt, data = input)

# Display model summary
summary(am.data)

# Diagnostic plots for the model
plot(am.data, main="mtcars", col="pink")
```
