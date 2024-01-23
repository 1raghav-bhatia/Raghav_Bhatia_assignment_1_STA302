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
library(dplyr)

#### Clean data ####
With_sub_raw <- read_csv("inputs/data/with_sub.csv") 
Without_sub_avg_rent_raw <- read_csv("inputs/data/without_sub_avg_rent.csv")
Without_sub_mkt_rent_raw <- read_csv("inputs/data/without_sub_mkt_rent.csv")

With_sub_cleaned <-
  With_sub_raw |>
  janitor::clean_names() |>
  select(category,
         item,
         scenario_1_family_of_four_ontario_works,
         scenario_4_single_parent_household_with_2_children_ontario_works,
         scenario_5_one_person_household_ontario_works 
  ) |>
  rename(Family_of_Four_on_Full_Income_Support = 
           scenario_1_family_of_four_ontario_works,
         Single_Parent_on_Full_Income_Support = 
           scenario_4_single_parent_household_with_2_children_ontario_works,
         One_Person_On_Full_Income_Support = 
           scenario_5_one_person_household_ontario_works 
  ) |> 
  tidyr::drop_na()

Without_sub_avg_rent_cleaned <-
  Without_sub_avg_rent_raw |>
  janitor::clean_names() |>
  select(category,
         item,
         scenario_1_family_of_four_ontario_works,
         scenario_4_single_parent_household_with_2_children_ontario_works,
         scenario_5_one_person_household_ontario_works 
  ) |>
  rename(Family_of_Four_on_Full_Income_Support = 
           scenario_1_family_of_four_ontario_works,
         Single_Parent_on_Full_Income_Support = 
           scenario_4_single_parent_household_with_2_children_ontario_works,
         One_Person_On_Full_Income_Support = 
           scenario_5_one_person_household_ontario_works 
  ) |> 
  tidyr::drop_na()

Without_sub_mkt_rent_cleaned <-
  Without_sub_mkt_rent_raw |>
  janitor::clean_names() |>
  select(category,
         item,
         scenario_1_family_of_four_ontario_works,
         scenario_4_single_parent_household_with_2_children_ontario_works,
         scenario_5_one_person_household_ontario_works 
  ) |>
  rename(Family_of_Four_on_Full_Income_Support = 
           scenario_1_family_of_four_ontario_works,
         Single_Parent_on_Full_Income_Support = 
           scenario_4_single_parent_household_with_2_children_ontario_works,
         One_Person_On_Full_Income_Support = 
           scenario_5_one_person_household_ontario_works 
  ) |> 
  tidyr::drop_na()

#### Save data ####
write_csv(With_sub_cleaned, "outputs/data/With_subsidies_cleaned_data.csv")
write_csv(Without_sub_avg_rent_cleaned,
          "outputs/data/Without_subsidies_avg_rent_cleaned_data.csv")
write_csv(Without_sub_mkt_rent_cleaned,
          "outputs/data/Without_sub_mkt_rent_cleaned_data.csv")
