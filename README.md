covid19-philadelphia
================

De-identified, aggregate datasets showing COVID-19 cases,
hospitalizations and deaths by date, zip, or age/sex/race as made
available by the City of Philadelphia through its Open Data Program.

The data in this repository is a history of daily snapshots made
available here:
<https://www.opendataphilly.org/showcase/philadelphia-covid-19-information>

The following datasets have been collected since 6/4/2020:

  - COVID Cases by Age
  - COVID Cases by Date
  - COVID Cases by Sex
  - COVID Cases by Zipcode
  - COVID Deaths by Age
  - COVID Deaths by Date
  - COVID Deaths by Sex

These have been collected since 8/14/2020:

  - COVID Cases by Race
  - COVID Deaths by Race
  - COVID Hospitalizations by Age
  - COVID Hospitalizations by Date
  - COVID Hospitalizations by Race
  - COVID Hospitalizations by Sex
  - COVID Hospitalizations by Zipcode

We are working to backfill all the datasets with the entire history
prior to the dates above and make them available here for use by the
open data community.

For terms of use:
<https://www.opendataphilly.org/organization/about/city-of-philadelphia>

-----

If you use R/RStudio, to get started reading and analyzing the data:

  - Clone this repo
  - Open a new project with RStudio based on an existing folder,
    pointing to the local copy of the repo
  - Read all the files within a folder as a historical dataset:

<!-- end list -->

``` r
library(tidyverse)

# Stack daily files within folder and keep distinct records
build_historical_dataset <- function(data_folder) {
  list.files(path = data_folder, full.names = TRUE) %>%
    map_dfr(read_csv) %>%
    distinct() # duplicates occur when there is an extract but no data update
}
cases_by_date <- build_historical_dataset("cases_by_date")
cases_by_date
```

    ## # A tibble: 9,606 x 4
    ##    result_date etl_timestamp       positive negative
    ##    <date>      <dttm>                 <dbl>    <dbl>
    ##  1 2020-03-27  2020-06-04 17:20:02      222      769
    ##  2 2020-05-05  2020-06-04 17:20:02      362     1252
    ##  3 2020-05-30  2020-06-04 17:20:02      126     1525
    ##  4 2020-03-24  2020-06-04 17:20:02      115      477
    ##  5 2020-04-26  2020-06-04 17:20:02      204      620
    ##  6 2020-05-23  2020-06-04 17:20:02      192     1535
    ##  7 2020-04-16  2020-06-04 17:20:02      524      772
    ##  8 2020-05-01  2020-06-04 17:20:02      414     1104
    ##  9 2020-05-20  2020-06-04 17:20:02      193     1697
    ## 10 2020-04-24  2020-06-04 17:20:02      490     1147
    ## # … with 9,596 more rows

  - Explore the epidemic’s incidence and effective reproductive number:

<!-- end list -->

``` r
library(lubridate)
library(EpiEstim)

# Daily case count by test result date
incidence_data <- list.files(path = "cases_by_date", full.names = TRUE) %>% 
  last %>% 
  read_csv(col_types = cols(result_date = col_character(),
                            etl_timestamp = col_skip(),
                            negative = col_integer(),
                            positive = col_integer())) %>% 
  filter(!is.na(positive) & (date(result_date) >= date("2020-03-16"))) %>%
  mutate(dates = date(result_date)) %>%
  arrange(dates) %>%
  mutate(positivity_rate = positive / (positive + negative)) %>%
  mutate(positivity_rate_last = lag(positivity_rate, default = first(positivity_rate))) %>%
  select(dates, positive, negative, positivity_rate, positivity_rate_last) %>%
  filter(dates <= last(dates) - 3) # remove last 3 days considering lag in test results

# Plot incidence and effective reproductive number over time
# Serial interval mean and std estimates from: https://www.dhs.gov/publication/st-master-question-list-covid-19
res_parametric_si <- estimate_R(incidence_data %>% 
                                  select(dates, I = positive),
                                method="parametric_si",
                                config = make_config(list(mean_si = 5.29, std_si = 5.32)))
plot(res_parametric_si, legend = FALSE)
```

![](README_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->
