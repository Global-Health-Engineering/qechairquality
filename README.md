
<!-- README.md is generated from README.Rmd. Please edit that file -->

# qechairquality

<!-- badges: start -->

[![DOI](https://zenodo.org/badge/418826351.svg)](https://zenodo.org/badge/latestdoi/418826351)
[![R-CMD-check](https://github.com/Global-Health-Engineering/qechairquality/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Global-Health-Engineering/qechairquality/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

## Overview

This packages contains data collected as part a research study at Queen
Elizabeth Central Hospital (QECH) in Blantyre Malawi. Particulate matter
measurements (PM 2.5 & PM 10) were taken in 5-minute intervals for at
eight sensor locations over two months.

## Manuscript

This data was used for a manuscript subitted to Habitat International
journal. The underlying code can be found in a separate repository. The
`manuscript.qmd` is reproducible.

## Installation

You can install the development version of qechairquality from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Global-Health-Engineering/qechairquality")
```

Alternatively, you can download the individual datasets as a CSV or XLSX
file from the table below.

| dataset        | CSV                                                                                                                  | XLSX                                                                                                                   |
|:---------------|:---------------------------------------------------------------------------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------|
| qechairquality | [Download CSV](https://github.com/Global-Health-Engineering/qechairquality/raw/main/inst/extdata/qechairquality.csv) | [Download XLSX](https://github.com/Global-Health-Engineering/qechairquality/raw/main/inst/extdata/qechairquality.xlsx) |
| locations      | [Download CSV](https://github.com/Global-Health-Engineering/qechairquality/raw/main/inst/extdata/locations.csv)      | [Download XLSX](https://github.com/Global-Health-Engineering/qechairquality/raw/main/inst/extdata/locations.xlsx)      |

## Data

The package provides access to two dataset.

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

``` r
locations
```

| variable_name | variable_type | description                       |
|:--------------|:--------------|:----------------------------------|
| location      | character     | Descriptive name of the location. |
| long          | double        | Longitude coordinate.             |
| lat           | double        | Latitude coordinate.              |
| type          | character     | Type of location.                 |

## License

Data are available as
[CC-BY](https://github.com/Global-Health-Engineering/qechairquality/blob/main/LICENSE.md).
