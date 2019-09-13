
# load packages
library(tidyverse)
library(haven)
library(readxl)

# load raw data sets
dd_raw_df <- read_dta("data/raw/ddrevisited_data_v1.dta") %>%
  glimpse()
polity_raw_df <- read_excel("data/raw/p4v2018.xls") %>%
  glimpse()

# tidy up the two data sets
dd_df <- dd_raw_df %>%
  select(country_name = ctryname, year, cow_code = cowcode, dd = democracy) %>%
  mutate(dd = case_when(dd == 1 ~ "Democracy",
                        dd == 0 ~ "Autocracy")) %>%
  glimpse()

polity_df <- polity_raw_df %>%
  select(year, cow_code = ccode, polity_iv = polity) %>%
  mutate(polity_iv = ifelse(polity_iv < -10, NA, polity_iv)) %>%
  glimpse()

# join data sets
df <- dd_df %>%
  left_join(polity_df) %>%
  mutate(dd = reorder(dd, polity_iv)) %>%
  na.omit() %>%
  glimpse()

# write csv and rds versions to file
df %>%
  write_rds("data/clean-data.rds") %>%
  write_csv("data/clean-data.csv")
