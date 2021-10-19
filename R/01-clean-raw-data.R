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

# import data ----------------------------------------------------------

unzip(zipfile = here::here("data/raw/raw-data-man-hospital-air-quality.zip"),
      exdir = here::here("data/raw/"))

fs::file_move(path = here::here("data/raw/Hos4_Lhouse_2.xls"),
              new_path = here::here("data/raw/hos4_Lhouse_2.xls"))

fs::file_move(path = here::here("data/raw/Hos4_Light_house_2.xlsx"),
              new_path = here::here("data/raw/hos4_Light_house_2.xlsx"))


raw_data <- fs::dir_ls("data/raw")

raw_data_xls <- str_subset(raw_data, pattern = ".xls$")

