#### Preamble ####
# Purpose: Models the percentage of income as rent data for 3 types of households
# Author: Raghav Bhatia
# Date: 23 January 2024
# Contact: raghav.bhatia@mail.utoronto.ca 


#### Workspace setup ####
library(tidyverse)
library(knitr)
library(opendatatoronto)
library(janitor)
library(lubridate)
library(dplyr)

#### Read data ####
With_sub_cleaned <- read_csv("outputs/data/With_subsidies_cleaned_data.csv")
Without_sub_avg_rent_cleaned <- read_csv(
  "outputs/data/Without_subsidies_avg_rent_cleaned_data.csv")
Without_sub_mkt_rent_cleaned <- read_csv(
  "outputs/data/Without_subsidies_mkt_rent_cleaned_data.csv")


#### Model data ####


##This code creates the function which gives a tibble of the percentage of
## income spent on rent for a specific household type.

percentage_rent <- function(data) {
  household_type <- names(data)[3:5]
  household_length <- length(household_type)
  rents <- vector(length = household_length)
  names(rents) <- household_type
  for (household in household_type) {
    rents[household] <- as.numeric(strsplit(as.character(data[12, household]), "%"))
  }
  rent_data <- tibble(household = names(rents), rent_percent  = as.numeric(rents))
  rent_data
}

## This code generates the column chart which plots the household data for households' 
## percentage of income spent on rent. 

#Table for households with subsidies 

With_subsidies <- percentage_rent(With_sub_cleaned)
With_subsidies_chart <- With_subsidies |>
  ggplot(aes(x = household, y = rent_percent)) +
  geom_col() +
  theme_minimal() + # Make the theme neater
  labs(x = "Household on Income Support", y = "Percentage of Income for Rent") + # Make labels more meaningful
  scale_y_continuous(limits = c(0, 200))

#Table for households without subsidies but paying average rent which is
#less than market rent.

Without_sub_avg_rent <- percentage_rent(Without_sub_avg_rent_cleaned)
Without_sub_avg_rent_chart <- Without_sub_avg_rent |>
  ggplot(aes(x = household, y = rent_percent)) +
  geom_col() +
  theme_minimal() + # Make the theme neater
  labs(x = "Household on Income Support", y = "Percentage of Income for Rent") + # Make labels more meaningful
  scale_y_continuous(limits = c(0, 200))

#Table for households without subsidies but paying market rent.

Without_subsidies_mkt_rent <- percentage_rent(Without_sub_mkt_rent_cleaned)
Without_sub_mkt_rent_chart <- Without_subsidies_mkt_rent |>
  ggplot(aes(x = household, y = rent_percent)) +
  geom_col() +
  theme_minimal() + # Make the theme neater
  labs(x = "Household on Income Support", y = "Percentage of Income for Rent") + # Make labels more meaningful
  scale_y_continuous(limits = c(0, 200))

#### Save model ####
saveRDS(
  With_subsidies_chart,
  file = "outputs/models/With_subsidies_chart.rds"
)
saveRDS(
  Without_sub_avg_rent_chart,
  file = "outputs/models/Without_sub_avg_rent_chart.rds"
)
saveRDS(
  Without_sub_mkt_rent_chart,
  file = "outputs/models/Without_sub_mkt_rent_chart.rds"
)
