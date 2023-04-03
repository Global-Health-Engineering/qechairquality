#' Air quality meausurements at QECH
#'
#' Measurements in 5-minute intervals for particulate matter (PM 2.5 & PM 10) at
#' eight sensor locations over two months at Queen Elizabeth Central Hospital
#' (QECH) in Blantyre Malawi.
#'
#' @format A tibble with 203,806 rows and 5 variables:
#' \describe{
#'   \item{date_time}{Timestamp of the air quality measurement.}
#'   \item{location}{Label for sensor location.}
#'   \item{indicator}{Air quality measurement indicator (pm2.5 and pm10).}
#'   \item{value}{Measured value in µg/m3.}
#' }
#'
"qechairquality"
