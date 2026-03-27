Based on the document provided, here is the R code for all the practical exercises:

### **Practical 1(a): Data Importing and Sorting**
This section covers importing text, Excel, and CSV files, as well as basic data manipulation like sorting and selecting.

**Importing and Sorting Text Files**
```R
# Practical 1(a)
# Importing text files
library(dplyr)
a <- read.table("C:/Users/Missy/OneDrive/Documents/1.txt", header = TRUE)
a

# Sorting in ascending order
arrange(a, age)
arrange(a, java)
arrange(a, c)
```

**Importing and Sorting Excel Files**
```R
# Excel files importing
library(readxl)
c <- read_excel("C:/Users/Missy/OneDrive/Documents/Book1.xlsx")
c

# Sorting by ascending order
arrange(c, age)
arrange(c, java)

# Sorting in descending order
arrange(c, desc(age))
arrange(c, desc(java))

# Selecting specific columns
select(c, age)
select(c, java)
```

**Creating, Saving, and Reading Data Sets**
```R
# Creating data set
library(dplyr)
s <- data.frame(ID = c(1, 2, 3, 4),
                Name = c("A", "B", "C", "D"),
                Age = c(19, 20, 18, 21),
                Java = c(89, 92, 95, 88))
s

# Saving as CSV
write.csv(s, "S.csv", row.names = FALSE)
read.csv("S.csv")

# Save as text file
write.table(s, "S.txt", row.names = FALSE)
read.table("S.txt")

# Sorting the created data frame
arrange(s, Age)
arrange(s, ID)
arrange(s, Java)

# Sorting in descending order
arrange(s, desc(Age))
arrange(s, desc(ID))
arrange(s, desc(Java))

# Selecting columns
select(s, Age)
select(s, ID)
select(s, Java)
```

---

### **Practical 1(b): Merging and Appending Data**
This section demonstrates how to combine data frames with external files.

**Merging Data Frames with Files**
```R
# Practical 1(b)
library(dplyr)
library(readxl)

# Merge with text file
a <- read.table("C:/Users/Missy/OneDrive/Documents/1.txt", header = TRUE)
b <- read_excel("C:/Users/Missy/OneDrive/Documents/Book1.xlsx")
data <- merge(a, b, all = TRUE)
data

# Importing CSV
d <- read.csv("C:/Users/Missy/OneDrive/Documents/Book.csv")

# Merging specific data frames
f <- data.frame(Name = c("Ronaldo", "Messi"),
                age = c(40, 38), 
                java = c(50, 40), 
                c = c(7, 10))

# Merge data frame and txt file
s <- read.table("C:/Users/Missy/OneDrive/Documents/1.txt", header = TRUE)
new <- merge(f, s, all = TRUE)

# Merge data frame and excel file
a_xl <- read_excel("C:/Users/Missy/OneDrive/Documents/Book1.xlsx")
new_xl <- merge(f, a_xl, all = TRUE)

# Merge data frame and csv file
d_csv <- read.csv("C:/Users/Missy/OneDrive/Documents/Book.csv")
new_csv <- merge(f, d_csv, all = TRUE)
```

**Appending Rows (rbind and bind_rows)**
```R
# Appending with rbind
df <- data.frame(product = c("A", "B"), price = c(953, 896))
dff <- data.frame(product = c("C", "D"), price = c(450, 420))
rbind_result <- rbind(df, dff)

# Appending with bind_rows (handles different column names)
df1 <- data.frame(TEAM = c("MADRID", "BARCA"), UCL = c(15, 5))
df2 <- data.frame(COUNTRY = c("PORTUGAL", "BRAZIL"), world_cup = c(0, 5))
rbind_bindrows <- bind_rows(df1, df2)
```

---

### **Practical 2: String Manipulation**
This section covers basic operations on strings like finding length and concatenation.

```R
# Practical 2: Strings
# a) Find length of string
str <- "hello world"
nchar(str)

str1 <- "r progamming"
nchar(str1)

str2 <- "x1 college of arts science and commerce"
nchar(str2)

# b) Concatenate strings
str3 <- "y"
cat("my name is ", str3)

str4 <- "this is 'allowed' in 'R'"
cat("string 4 is", str4)

string1 <- "x"
string2 <- "x1"
res <- paste(string1, string2)

# Alternative concatenation
strin <- paste("x", "x1")
```

---

### **Practical 3: Data Cleaning and Transformation**
This section includes using `mutate` for new columns, handling missing values, and finding unique records.

**Part (a): Mutate and NA Handling**
```R
# Practical 3(a)
library(dplyr)
a <- read.csv("C:/Users/bms/Documents/Python Scripts/prac3.csv")

# Transforming data with mutate
Transform <- a %>%
  mutate(age_sq = age * 2,
         per_year = salary / 12,
         high_earn = salary > 40000)

# Handling Missing Values
data <- data.frame(ID = 1:5, 
                   value1 = c(20, 30, NA, 45, 70), 
                   value2 = c(20, 30, NA, 90, 65))

# Omit NAs
cleaned <- na.omit(data)

# Replace NAs
library(tidyr)
data_missing <- data.frame(ID = 1:5, 
                           Value1 = c(15, 25, 35, 45, NA), 
                           Value2 = c(35, 45, 65, 75, NA), 
                           Value3 = c(15, 35, 55, 75, NA))

replace_data <- data_missing %>%
  replace_na(list(Value1 = 55, 
                  Value2 = mean(data_missing$Value2, na.rm = TRUE), 
                  Value3 = 1))
```

**Part (b): Finding Unique Records**
```R
# Practical 3(b)
library(dplyr)
df <- data.frame(id = c(1, 2, 2, 3, 4, 4),
                 name = c("A", "B", "B", "C", "D", "D"),
                 value = c(100, 50, 50, 90, 70, 70))

# Find distinct rows
unique_df <- df %>% distinct()

# Find unique combination of id and name
Unique_comb <- df %>% distinct(id, name)
```

---

### **Practical 4: Date and Time Operations**
This section uses the `lubridate` package to extract components from current dates and times.

```R
# Practical 4
library(lubridate)

cdate <- today()
datetime <- now()

# Extracting components
cat("year:", year(datetime), "\n")
cat("month:", month(datetime), "\n")
cat("day:", day(datetime), "\n")
cat("weekday:", wday(datetime, label = TRUE), "\n")
cat("hour:", hour(datetime), "\n")
cat("minute:", minute(datetime), "\n")
cat("second:", second(datetime), "\n")
```
Based on the documents provided, here is the R code for each practical along with the associated problem statements or objectives as indicated in the files.

### **Practical 1(a): Data Importing and Sorting**
**Objective:** Import data from different file formats (Text, Excel, CSV) and perform sorting operations using the `dplyr` package.

* **Importing and Sorting Text Files**
    ```R
    # Load dplyr for sorting functions
    library(dplyr)

    # Import text file
    a <- read.table("C:/Users/Missy/OneDrive/Documents/1.txt", header = TRUE)
    a

    # Sorting in ascending order by different columns
    arrange(a, age)
    arrange(a, java)
    arrange(a, c)
    ```

* **Importing and Sorting Excel Files**
    ```R
    # Load readxl for Excel files
    library(readxl)

    # Import Excel file
    c <- read_excel("C:/Users/Missy/OneDrive/Documents/Book1.xlsx")
    c

    # Sorting by ascending order
    arrange(c, age)
    arrange(c, java)

    # Sorting in descending order
    arrange(c, desc(age))
    arrange(c, desc(java))

    # Selecting specific columns
    select(c, age)
    select(c, java)
    ```

* **Creating, Saving, and Reading Data Sets**
    ```R
    # Create a new data frame
    s <- data.frame(ID = c(1, 2, 3, 4),
                    Name = c("A", "B", "C", "D"),
                    Age = c(19, 20, 18, 21),
                    Java = c(89, 92, 95, 88))
    s

    # Saving as CSV and then reading it back
    write.csv(s, "S.csv", row.names = FALSE)
    read.csv("S.csv")

    # Saving as Text file and then reading it back
    write.table(s, "S.txt", row.names = FALSE)
    read.table("S.txt")
    ```

---

### **Practical 1(b): Merging and Appending Data**
**Objective:** Combine data from external files with existing R data frames using merge and append operations.

* **Merging External Files**
    ```R
    library(dplyr)
    library(readxl)

    # Import and merge text and excel files
    a <- read.table("C:/Users/Missy/OneDrive/Documents/1.txt", header = TRUE)
    b <- read_excel("C:/Users/Missy/OneDrive/Documents/Book.xlsx")
    data <- merge(a, b, all = TRUE)
    data
    ```

* **Merging Data Frames with Files**
    ```R
    # Creating a sample data frame
    f <- data.frame(Name = c("Ronaldo", "Messi"),
                    age = c(40, 38), 
                    java = c(50, 40), 
                    c = c(7, 10))

    # Merge with a text file
    s <- read.table("C:/Users/Missy/OneDrive/Documents/1.txt", header = TRUE)
    new <- merge(f, s, all = TRUE)

    # Merge with a CSV file
    d <- read.csv("C:/Users/Missy/OneDrive/Documents/Book.csv")
    new_csv <- merge(f, d, all = TRUE)
    ```

* **Appending Data (Rows)**
    ```R
    # Appending rows with rbind (same column names)
    df <- data.frame(product = c("A", "B"), price = c(953, 896))
    dff <- data.frame(product = c("C", "D"), price = c(450, 420))
    rbind_result <- rbind(df, dff)

    # Appending rows with bind_rows (handles different column names)
    df1 <- data.frame(TEAM = c("MADRID", "BARCA"), UCL = c(15, 5))
    df2 <- data.frame(COUNTRY = c("PORTUGAL", "BRAZIL"), world_cup = c(0, 5))
    append_result <- bind_rows(df1, df2)
    ```

---

### **Practical 3(a): Data Transformation**
**Objective:** Use the `mutate` function to transform data and add new calculated columns.

```R
library(dplyr)

# Import CSV for transformation
a <- read.csv("C:/Users/bms/Documents/Python Scripts/prac3.csv")

# Transforming data: squaring age, calculating monthly salary, and flagging high earners
Transform <- a %>%
  mutate(age_sq = age * 2,
         per_year = salary / 12,
         high_earn = salary > 40000)
Transform
```

---

### **Practical 4: Date and Time Operations**
**Objective:** Parse dates in various formats and extract specific components (year, month, day, etc.) using the `lubridate` package.

```R
library(lubridate)

# Parsing dates in different formats
date1 <- ymd("2024-07-16")
date2 <- mdy("07-16-2024")
date3 <- dmy("16-07-2024")

# Extracting components from date3
year(date3)
month(date3)
day(date3)
wday(date3)   # Day of the week
hour(date3)
minute(date3)
second(date3)
```

---

### **Additional Practical: Summary Statistics and Regression**
**Objective:** Generate descriptive statistics and perform linear regression analysis.

* **Summary Statistics**
    ```R
    # Summary of a vector
    x <- c(3, 4, 4, 5, 7, 8, 9, 12, 13, 15, 19, 21)
    summary(x)

    # Summary of a data frame
    data <- data.frame(col1 = c(19, 52, 48, 30, 41, 60),
                       col2 = c(35, 45, 55, 65, 75, 85),
                       col3 = c(10, 20, 30, 40, 50, 60))
    summary(data)
    ```

* **Linear Regression**
    ```R
    col1 <- c(65, 75, 85, 95, 105, 115)
    col2 <- c(40, 50, 60, 70, 80, 90)

    # Perform linear regression
    reg <- lm(col1 ~ col2)
    summary(reg)
    ```

* **Advanced Descriptive Statistics**
    ```R
    library(psych)

    # Creating a dataset for description
    data1 <- data.frame(Age = c(25, 30, 32, 28, 27),
                        Score = c(80, 75, 82, 78, 81),
                        Gender = c("Male", "Male", "Female", "Male", "Female"))

    # Detailed statistics including mean, sd, skew, and kurtosis
    describe(data1)
    ```
