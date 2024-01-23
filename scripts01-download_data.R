#### Preamble ####
# Purpose: Simulates the income expenditure data for 3 types of households
# Author: Raghav Bhatia
# Date: 23 January 2024
# Contact: raghav.bhatia@mail.utoronto.ca 


#### Workspace setup ####
library(tidyverse)
library(knitr)
library(opendatatoronto)
library(janitor)
library(lubridate)


#### Download data ####
Income_Rent_Data_With_sub <-
  list_package_resources("52182614-1f0b-42be-aca4-3f86dc8e004c") |>
  filter(name == 
           "2022 Income Scenario - With Subsidies.csv") |>
  get_resource()

Income_Rent_Data_Without_sub_avg_rent <-
  list_package_resources("52182614-1f0b-42be-aca4-3f86dc8e004c") |>
  filter(name == 
           "2022 Income Scenario - Without Subsidies, Average Rent") |>
  get_resource()

Income_Rent_Data_Without_sub_mkt_rent <-
  list_package_resources("52182614-1f0b-42be-aca4-3f86dc8e004c") |>
  filter(name == 
           "2022 Income Scenario - Without Subsidies, Market Rent.csv") |>
  get_resource()


#### Save data ####
write_csv(
  Income_Rent_Data_With_sub, "inputs/data/with_sub.csv") 
write_csv(
  Income_Rent_Data_Without_sub_avg_rent, "inputs/data/without_sub_avg_rent.csv")
write_csv(
  Income_Rent_Data_Without_sub_mkt_rent, "inputs/data/without_sub_mkt_rent.csv")
