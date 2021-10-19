# Description -------------------------------------------------------------

# Script to import and clean raw data for Hospital Air Quality manuscript
# Author: Lars Schöbitz
# Date: 2021-10-19

# Code --------------------------------------------------------------------

# install.packages(c("dplyr", "readxl", "ggplot2", "tidyr", "readr", "fs", "stringr", "here"))

library(dplyr)
library(readxl)
library(ggplot2)
library(tidyr)
library(readr)
library(fs)
library(stringr)
library(here)
library(purrr)

# import data ----------------------------------------------------------

unzip(zipfile = here::here("data/raw/raw-data-man-hospital-air-quality.zip"),
      exdir = here::here("data/raw/"))

fs::file_move(path = here::here("data/raw/Hos4_Lhouse_2.xls"),
              new_path = here::here("data/raw/hos4_Lhouse_2.xls"))

fs::file_move(path = here::here("data/raw/Hos4_Light_house_2.xlsx"),
              new_path = here::here("data/raw/hos4_Light_house_2.xlsx"))


raw_data <- fs::dir_ls("data/raw")

raw_data_xls <- str_subset(raw_data, pattern = ".xls$")

raw_data_xls_paths <- path(here::here(raw_data_xls))

raw_data_list <- list()

for (i in seq_along(raw_data_xls)) {
  raw_data_list[[i]] <- read_excel(path = here::here(raw_data_xls)[[i]], 
                                   col_names = c("pm2.5", "pm10", "date"), 
                                   range = "A1:C10000") %>% 
    mutate(path = raw_data_xls[[i]]) %>% 
    mutate(pm2.5 = as.double(pm2.5)) %>% 
    mutate(pm10 = as.double(pm10)) 
} 

dat_clean <- bind_rows(raw_data_list) %>% 
  drop_na() %>% 
  # reprex help: https://stackoverflow.com/a/35547485/6816220
  mutate(location = str_extract(string = path, pattern = "(?!.*/).+")) %>% 
  separate(col = location, into = c("id", "location")) %>% 
  pivot_longer(cols = pm2.5:pm10, names_to = "indicator", values_to = "value") %>% 
  mutate(unit = "uq_m3") %>% 
  select(-path) %>% 
  
  # In location 6B, there are eight dates that are not read completely
  # These data points are removed
  filter(date <= "2020-01-01") %>% 
  
  # In location guardian, 34 values for pm2.5 are between 30'000 and 40'000
  # In location guardian, 4 values are exactly 1999.90
  # These values are not plausible and be safely removed from the data
  filter(value <= 10000 & value != 1999.90) 
  
write_csv(x = dat_clean, file = "data/intermediate/malawi-hospitals-air-quality")
