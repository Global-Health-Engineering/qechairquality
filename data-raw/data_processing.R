# description -------------------------------------------------------------

# Script to import and clean raw data for Hospital Air Quality manuscript

# R packages --------------------------------------------------------------

library(readr)
library(stringr)
library(dplyr)
library(tidyr)
library(here)
library(readxl)
library(janitor)
library(fs)

# read data ---------------------------------------------------------------

unzip(zipfile = here::here("data-raw/raw-data-man-hospital-air-quality.zip"),
      exdir = here::here("data-raw/"))

file_move(path = here::here("data-raw/Hos4_Lhouse_2.xls"),
              new_path = here::here("data-raw/hos4_Lhouse_2.xls"))

file_move(path = here::here("data-raw/Hos4_Light_house_2.xlsx"),
              new_path = here::here("data-raw/hos4_Light_house_2.xlsx"))


raw_data <- fs::dir_ls("data-raw")

raw_data_xls <- str_subset(raw_data, pattern = ".xls$")

raw_data_xls_paths <- path(here::here(raw_data_xls))

raw_data_list <- list()

for (i in seq_along(raw_data_xls)) {
  raw_data_list[[i]] <- read_excel(path = here::here(raw_data_xls)[[i]],
                                   col_names = c("pm10", "pm2.5", "date_time"),
                                   range = "A1:C10000") %>%
    mutate(path = raw_data_xls[[i]]) %>%
    mutate(pm2.5 = as.double(pm2.5)) %>%
    mutate(pm10 = as.double(pm10))
}

# tidy data ---------------------------------------------------------------

qechairquality <- bind_rows(raw_data_list) %>%
  drop_na() %>%
  # reprex help: https://stackoverflow.com/a/35547485/6816220
  mutate(location = str_extract(string = path, pattern = "(?!.*/).+")) %>%
  separate(col = location, into = c("id", "location")) %>%

  # remove the duplicates
  select(-path) %>%
  unique() %>%

  pivot_longer(cols = pm2.5:pm10, names_to = "indicator", values_to = "value") %>%

  # In location 6B, there are eight dates that are not read completely
  # These data points are removed
  filter(date_time <= "2020-01-01") %>%

  # In location guardian, 34 values for pm2.5 are between 30'000 and 40'000
  # In location guardian, 4 values are exactly 1999.90
  # These values are not plausible and be safely removed from the data
  filter(value <= 10000 & value != 1999.90)

# write data --------------------------------------------------------------

usethis::use_data(qechairquality, overwrite = TRUE)

fs::dir_create(here::here("inst", "extdata"))

write_csv(qechairquality, here::here("inst", "extdata", "qechairquality.csv"))

openxlsx::write.xlsx(qechairquality, here::here("inst", "extdata", "qechairquality.xlsx"))
