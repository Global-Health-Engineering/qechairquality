Manuscript - Malawi Hospital Air Quality Data - Notebook
================

# Introduction

The purpose of this document is to perform some initial exploratory data
analysis for air quality data from Malawi. Based on this analysis,
in-depth analysis will be performed and publication ready figures can be
produced.

# Data

Air quality data (PM2.5 and PM10) was collected in roughly 5-minute
intervals from eight locations at one hospital over the period of 3
months. The locations are Administration, AIDS, Eyes, Guardian, Malaria,
Malnutrition, Men’s, and Surgery/ICU.

One sensor was installed at each location, either on the side or on the
outside wall.

## Hospital locations

-   6B—&gt;Men’s Ward
-   guardian→ Guardian’s shelter (guardians of patients)
-   Lhouse—&gt;AIDS
-   Lions→ Eyes
-   Malaria—&gt;Malaria
-   MJC → Pediatric Surgery/ICU
-   Moyo —&gt;Malnutrition

## Sensor locations

-   Guardian Shelter, Ward 3b, Mercy James, and Lighthouse are outside,
    the rest would be inside

# Data Exploration

TODO List:

-   24 hour average (**DONE**)
-   baseline (not the two peaks) (**not doing**)
-   Hourly average (**DONE**)
-   Exposure in categories of hazard (**DONE**)
-   Peaks over 500 a day (**DONE**)
-   Difference between indoor and outdoor sensors (**not started**)
-   Ratios PM10 / PM25 (differences by location) (**WIP**)
-   Day time vs night time averages (6-18, 18-6) (**DONE**)

## Plot: Overview (Appendix)

![Figure caption me!](README_files/figure-gfm/plot-overview-1.png)

## Plot: Daily 24-hour average by date

-   Is MJC 0 after 13th November?
-   WHO limits are 24-hour averages

![Figure caption me!](README_files/figure-gfm/plot-daily-avg-1.png)

## Plot: Day time vs night time averages (6-18, 18-6)

![](README_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

## Plot: Exposure in hours in categories of hazard

<img src="/Users/lschoebitz/Documents/gitrepos/ethz/global-health-engineering/manuscript-hospital-air-quality/img/usepa-air-quality-categories.png" width="80%" />

### Totals (discarded)

![Figure caption me!](README_files/figure-gfm/plot-hazard-expo-1.png)

### Percent (discarded)

![Figure caption me!](README_files/figure-gfm/plot-hazard-expo2-1.png)

### New plot 1 (discarded)

![](README_files/figure-gfm/unnamed-chunk-7-1.png)<!-- -->

### Waffle plot (selected)

![Figure caption me!](README_files/figure-gfm/plot-hazard-expo3-1.png)

## Table: Peaks over the limit for hazardous

-   Peak for PM2.5: 2 x 250.4 = 500.8
-   Peak for PM10: 2 x 424.9 = 849.8
-   Column peaks counts the number of data points above these two limits
    over all days

| location       | pm10 | pm2.5 |
|:---------------|-----:|------:|
| Administration |    1 |     4 |
| AIDS           |  676 |   350 |
| Eyes           |    0 |     0 |
| Guardian       |  178 |   359 |
| Malaria        |   18 |    19 |
| Malnutrition   |   43 |    18 |
| Men’s          |   15 |     4 |
| Surgery/ICU    |   37 |    15 |

## Plot: Ratio between PM10 and PM2.5 range from minimum to maximum (WIP)

-   Calculation: PM10/PM2.5
-   Each line shows the minimum and maximum per day after calculating
    the average ratio per hour

![Figure caption me!](README_files/figure-gfm/plot-ratio-1.png)

## Plot: Hourly average by date and location

Not included in paper.

![Figure caption
me!](README_files/figure-gfm/plot-hourly-avg-1.png)![Figure caption
me!](README_files/figure-gfm/plot-hourly-avg-2.png)![Figure caption
me!](README_files/figure-gfm/plot-hourly-avg-3.png)![Figure caption
me!](README_files/figure-gfm/plot-hourly-avg-4.png)![Figure caption
me!](README_files/figure-gfm/plot-hourly-avg-5.png)![Figure caption
me!](README_files/figure-gfm/plot-hourly-avg-6.png)![Figure caption
me!](README_files/figure-gfm/plot-hourly-avg-7.png)![Figure caption
me!](README_files/figure-gfm/plot-hourly-avg-8.png)
