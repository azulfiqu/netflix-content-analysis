# Netflix Content Strategy Analysis 
*Developed as a project for STAT 355 (Stats for Data Science)*
## Overview
This project analyzes a Kaggle dataset of 9,000 Netflix shows and movies to deduce trends in content strategy, viewer preferences, and regional production. By cleaning and restructuring the data, this analysis provides statistical evidence regarding what type of content performs best and how Netflix's library has evolved over time.

For a deep dive into the statistical methodologies, please view the full **[Project Report.pdf](Project%20Report.pdf)** included in this repository.

## Key Methodologies & Skills
* **Data Cleaning & Reconciliation:** Processed the dataset using R and `dplyr` to correct 50+ data entry errors and standardize 4 different date formats, ensuring absolute data integrity.
* **Statistical Testing:** Conducted ANOVA and t-tests to identify that viewers preferred content with durations close to 100 minutes.
* **Predictive Modeling:** Applied a linear regression model to deduce the ongoing trend that average movie durations are decreasing year over year.
* **Data Visualization:** Engineered visual breakdowns using `ggplot2` to illustrate rating distributions, country-of-origin patterns, and release year trends.

---

## Visual Insights 

### Content Distribution by Type
*A breakdown of Movies vs. TV Shows available on the platform.*
![Type Distribution](images/type%20distribution.png)

### Top Producing Countries
*Analysis revealed that approximately one-third of the total content library was produced by the United States[cite: 29, 110].*
![Country Plot](images/country%20plot.png)

### Release Year Trends
*Visualizing the explosion of content volume and how release years map to Netflix's acquisition strategy.*
![Release Year Plot](images/release%20year%20plot.png)

### Content Ratings Breakdown
*Understanding the target demographics for Netflix's library.*
![Ratings Plot](images/ratings%20plot.png)

---

## How to Reproduce This Analysis
All code used for data cleaning, statistical testing and visualization is available in this repository. 
1. Clone this repository to your local machine.
2. Ensure you have R and the required libraries installed (`dplyr`, `ggplot2`).
3. Run the **`Reproducible Code for Project.R`** script alongside the provided **`netflix_titles.csv`** dataset to generate the models and visualizations.
