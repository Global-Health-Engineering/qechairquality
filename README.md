
<!-- README.md is generated from README.Rmd. Please edit that file -->

# qechairquality

<!-- badges: start -->
<!-- badges: end -->

## Overview

This packages contains data collected as part a research study at Queen
Elizabeth Central Hospital (QECH) in Blantyre Malawi. Particulate matter
measurements (PM 2.5 & PM 10) were taken in 5-minute intervals for at
eight sensor locations over two months. Additionally XX interviews were
conducted…

This package contains the quantitative measurements and the transcribed
and anonymised interviews.

## Installation

You can install the development version of durbanplasticwaste from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Global-Health-Engineering/durbanplasticwaste")
```

Alternatively, you can download the individual datasets as a CSV or XLSX
file from the table below.

| dataset        | CSV                                                                                                                  | XLSX                                                                                                                   |
|:---------------|:---------------------------------------------------------------------------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------|
| qechairquality | [Download CSV](https://github.com/Global-Health-Engineering/qechairquality/raw/main/inst/extdata/qechairquality.csv) | [Download XLSX](https://github.com/Global-Health-Engineering/qechairquality/raw/main/inst/extdata/qechairquality.xlsx) |

## Data

The package provides access to X datasets.

``` r
library(qechairquality)
```

The `qechairquality` data set has 4 variables and 203806 observations.
For an overview of the variable names, see the following table.

``` r
qechairquality
```

| variable_name | variable_type | description                                         |
|:--------------|:--------------|:----------------------------------------------------|
| date_time     | dttm          | Timestamp of the air quality measurement.           |
| location      | character     | Label for sensor location.                          |
| indicator     | character     | Air quality measurement indicator (pm2.5 and pm10). |
| value         | double        | Measured value in µg/m3.                            |

## License

Data are available as
[CC-BY](https://github.com/Global-Health-Engineering/qechairquality/blob/main/LICENSE.md).

## Citation

To cite the durbanplasticwaste package, please use:
