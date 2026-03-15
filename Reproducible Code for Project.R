# Loading the necessary library for data manipulation and visualization
library(readr) # used to read csv files
library(dplyr) # used to manipulate data like grouping and summarizing.
library(ggplot2) # used to create plots for better visualization of data
library(tidyr) # to handle the missing values
library(lubridate) # to convert the date_added into date format from string

# Loading the dataset
netflix_data <- read.csv("/Users/Ahsan/Documents/STAT 355/netflix_titles.csv") # Reading the file with the raw data. Any other person wishing to read the same file will have to alter the path directory based on where they saved it.

num_variables <- ncol(netflix_data)
print(num_variables) # Finding out and printing the number of columns/variables in the dataset

rows <- nrow(netflix_data)
print(rows)  # Finding out and printing the number of rows in the dataset

#Exploring the structure of the dataset
str(netflix_data)

# Using this code to distinguish how many movies and tv shows there are in the dataset.
table(netflix_data$type) 
# Bar plot for the type variable for visualizing
ggplot(netflix_data, aes(x = type, fill = type)) +
  geom_bar() +
  labs(title = "Distribution of Types",
       x = "Type",
       y = "Count") +
  scale_fill_manual(values = c("#FF5733", "#33FF57"))  # Custom colors for better visualization

#Country
country_count <- netflix_data %>% filter(!is.na(country)) %>% group_by(country) %>% summarise(count = n()) # removing/filtering the na values
top_countries <- country_count %>% arrange(desc(count)) %>% top_n(10) # filtering the countries with the most movies/shows into top 10
ggplot(top_countries, aes(x = reorder(country, -count), y = count)) +
  geom_bar(stat = "identity") +
  labs(title = "Top 10 Countries by Count", x = "Country") # a plot for the top 10 countries having the most movies/tv shows

# 2. Summary statistics
summary(netflix_data$release_year)  # Summary of the release_year variable
# Histogram for release_year( how many movies were released in a year through 1925 to 2021)
ggplot(netflix_data, aes(x = release_year)) +
  geom_histogram(binwidth = 1, fill = "blue", color = "black") +
  labs(title = "Distribution of Release Year",
       x = "Release Year",
       y = "Frequency")

# counting how many movies have the same ratings
rating_count <- netflix_data %>% group_by(rating) %>% summarise(count = n())
# a plot fot better visualization of the data
ggplot(rating_count, aes(x = rating, y = count)) + 
  geom_bar(stat = "identity") + 
  labs(title = "Distribution of Rating") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) # rotating so that the x-axis labels dont overlap


# Converting the date_added column to Date format
netflix_data$date_added <- as.Date(netflix_data$date_added, format = "%B %d, %Y")
# Extracting the year and create a new column date_added_year
netflix_data$date_added_year <- year(netflix_data$date_added)
# Filtering out missing or non-finite values
netflix_data_clean <- netflix_data[!is.na(netflix_data$date_added_year) & !is.infinite(netflix_data$date_added_year), ]
# Exploring the distribution of date_added_year
summary(netflix_data_clean$date_added_year)
ggplot(netflix_data_clean, aes(x = date_added_year)) + geom_histogram(binwidth = 1, na.rm = TRUE) + labs(title = "Distribution of Year Added to Netflix")



# Filtering the data for movies only
movies <- netflix_data[netflix_data$type == "Movie", ]
# Extracting the numeric value of duration
movies$duration_numeric <- as.numeric(gsub(" min", "", movies$duration))
# Performing the t-test
test_result <- t.test(movies$duration_numeric, mu = 100)
print(test_result)


# Filtering the data for TV shows only
tv_shows <- netflix_data[netflix_data$type == "TV Show", ]
# Extracting the numeric value of seasons
tv_shows$seasons_numeric <- as.numeric(gsub(" Season(s)?", "", tv_shows$duration))
# Performing the ANOVA
anova_result <- aov(seasons_numeric ~ rating, data = tv_shows)
summary(anova_result)


# Calculating the correlation
correlation <- cor(movies$release_year, movies$duration_numeric, use = "complete.obs") # complete.obs is used to drop missing values containing pairs.
print(correlation)
# Performing the regression
regression_result <- lm(duration_numeric ~ release_year, data = movies)
summary(regression_result)

# Creating a scatterplot with a regression line for better visualization and understanding
ggplot(movies, aes(x = release_year, y = duration_numeric)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(x = "Release Year", y = "Duration (minutes)", title = "Scatterplot of Movie Duration vs Release Year with Regression Line")











