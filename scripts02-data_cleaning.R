#### Preamble ####
# Purpose: Cleans the income expenditure data for 3 types of households
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

## This reads the raw data files into the program.

With_sub_raw <- read_csv("inputs/data/with_subsidies.csv") 
Without_sub_avg_rent_raw <- read_csv("inputs/data/without_subsidies_avg_rent.csv")
Without_sub_mkt_rent_raw <- read_csv("inputs/data/without_subsidies_mkt_rent.csv")

## This cleans the data file for the household data with subsidies.The cleaning
## consists of selecting data for households only on full income support and renaming
## the column heads. 

With_sub_cleaned <-
  With_sub_raw |>
  janitor::clean_names() |>
  select(category,
         item,
         scenario_1_family_of_four_ontario_works,
         scenario_4_single_parent_household_with_2_children_ontario_works,
         scenario_5_one_person_household_ontario_works 
  ) |>
  rename(Family_of_Four = 
           scenario_1_family_of_four_ontario_works,
         Single_Parent = 
           scenario_4_single_parent_household_with_2_children_ontario_works,
         One_Person = 
           scenario_5_one_person_household_ontario_works 
  ) |> 
  tidyr::drop_na()

## This cleans the data file for the household data without subsidies but paying 
## average rent which is the same as rent under the COCHI. The cleaning consists
## of selecting data for households only on full income support and renaming
## the column heads. 

Without_sub_avg_rent_cleaned <-
  Without_sub_avg_rent_raw |>
  janitor::clean_names() |>
  select(category,
         item,
         scenario_1_family_of_four_ontario_works,
         scenario_4_single_parent_household_with_2_children_ontario_works,
         scenario_5_one_person_household_ontario_works 
  ) |>
  rename(Family_of_Four = 
           scenario_1_family_of_four_ontario_works,
         Single_Parent = 
           scenario_4_single_parent_household_with_2_children_ontario_works,
         One_Person = 
           scenario_5_one_person_household_ontario_works 
  ) |> 
  tidyr::drop_na()

## This cleans the data file for the household data without subsidies but paying 
## market rent. The cleaning consists of selecting data for households only on
## full income support and renaming the column heads. 

Without_sub_mkt_rent_cleaned <-
  Without_sub_mkt_rent_raw |>
  janitor::clean_names() |>
  select(category,
         item,
         scenario_1_family_of_four_ontario_works,
         scenario_4_single_parent_household_with_2_children_ontario_works,
         scenario_5_one_person_household_ontario_works 
  ) |>
  rename(Family_of_Four = 
           scenario_1_family_of_four_ontario_works,
         Single_Parent = 
           scenario_4_single_parent_household_with_2_children_ontario_works,
         One_Person = 
           scenario_5_one_person_household_ontario_works 
  ) |> 
  tidyr::drop_na()

#### Save data ####

## This stores the cleaned data files into the GitHub repository.

write_csv(With_sub_cleaned, "outputs/data/With_subsidies_cleaned_data.csv")
write_csv(Without_sub_avg_rent_cleaned,
          "outputs/data/Without_subsidies_avg_rent_cleaned_data.csv")
write_csv(Without_sub_mkt_rent_cleaned,
          "outputs/data/Without_subsidies_mkt_rent_cleaned_data.csv")


