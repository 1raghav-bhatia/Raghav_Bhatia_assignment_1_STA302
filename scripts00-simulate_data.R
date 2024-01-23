#### Preamble ####
# Purpose: Simulates the income expenditure data for 3 types of households
# Author: Raghav Bhatia
# Date: 23 January 2024
# Contact: raghav.bhatia@mail.utoronto.ca 
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(knitr)
library(opendatatoronto)
library(janitor)
library(lubridate)



#### Simulate data ####
set.seed(233)

simulated_income_expenditure_data <-
  tibble(
    Category = c(
      rep(x = "Income", times = 5),
      rep(x = "Expense", times = 4),
      "Other"
    ),
    Incomes_and_Expenses = c(
      rep(
        x = c("Basic Allowance", "Shelter Allowance", "Rent"
        ), times = 3
      ), 
      "% of income on rent"
    ),
    Family_of_Four_on_Full_income_support =
      c(runif(
        n = 9,
        max = 5000,
        min = 250
      ),
      runif(
        n = 1,
        max = 150,
        min = 25
      )
      ),
    Single_Parent_Two_Kids_on_Full_income_support =
      c(runif(
        n = 9,
        max = 5000,
        min = 250
      ),
      runif(
        n = 1,
        max = 150,
        min = 25
      )
      ),
    One_Person_on_Full_income_support =
      c(runif(
        n = 9,
        max = 5000,
        min = 250
      ),
      runif(
        n = 1,
        max = 150,
        min = 25
      )
      )
    # Draw 1,095 times from the Poisson distribution
  )

head(simulated_income_expenditure_data)

#### Test data ####
simulated_income_expenditure_data$category |>
  unique() == c("Income", "Expense", "Other")

simulated_income_expenditure_data$category |>
  unique() |>
  length() == 3

simulated_income_expenditure_data$Family_of_Four_on_Full_income_support |>
  class() == "numeric"
simulated_income_expenditure_data$Single_Parent_Two_Kids_on_Full_income_support |> 
  class() == "numeric"
simulated_income_expenditure_data$One_Person_on_Full_income_support |>
  class() == "numeric"
simulated_income_expenditure_data$Family_of_Four_on_Full_income_support |>
  max() <= 10000
simulated_income_expenditure_data$Single_Parent_Two_Kids_on_Full_income_support |> 
  max() <= 10000
simulated_income_expenditure_data$One_Person_on_Full_income_support |>
  max() <= 10000

  
  
