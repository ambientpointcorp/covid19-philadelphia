library(tidyverse)

# Philadelphia zip code level COVID-19 daily case/test data
readr::read_csv(
  url("https://phl.carto.com/api/v2/sql?q=SELECT+*+FROM+covid_cases_by_zip&filename=covid_cases_by_zip&format=csv&skipfields=cartodb_id"), 
  col_types = readr::cols(the_geom = readr::col_skip(),
                          the_geom_webmercator = readr::col_skip(),
                          zip_code = readr::col_character(),
                          count = readr::col_integer(),
                          etl_timestamp = readr::col_character())) %>%
  tidyr::pivot_wider(names_from = covid_status, values_from = count) %>%
  readr::write_csv(stringr::str_c(Sys.getenv("COVID19PHILLY_DIR"),"cases_by_zipcode/", 
                           "covid_cases_by_zip_", 
                           paste0(lubridate::today()), 
                           ".csv.gz"))

# Philadelphia COVID-19 daily case/test data by age
readr::read_csv(
  url("https://phl.carto.com/api/v2/sql?q=SELECT+*+FROM+covid_cases_by_age&filename=covid_cases_by_age&format=csv&skipfields=cartodb_id"), 
  col_types = readr::cols(the_geom = readr::col_skip(), 
                          the_geom_webmercator = readr::col_skip(), 
                          count = readr::col_integer(), 
                          etl_timestamp = readr::col_character())) %>%
  readr::write_csv(stringr::str_c(Sys.getenv("COVID19PHILLY_DIR"),"cases_by_age/", 
                                        "covid_cases_by_age_", 
                                        paste0(lubridate::today()), 
                                        ".csv.gz"))

# Philadelphia COVID-19 daily case/test data by sex
readr::read_csv(
  url("https://phl.carto.com/api/v2/sql?q=SELECT+*+FROM+covid_cases_by_sex&filename=covid_cases_by_sex&format=csv&skipfields=cartodb_id"), 
  col_types = readr::cols(the_geom = readr::col_skip(), 
                          the_geom_webmercator = readr::col_skip(), 
                          count = readr::col_integer(), 
                          etl_timestamp = readr::col_character())) %>%
  readr::write_csv(stringr::str_c(Sys.getenv("COVID19PHILLY_DIR"),"cases_by_sex/", 
                                        "covid_cases_by_sex_", 
                                        paste0(lubridate::today()), 
                                        ".csv.gz"))

# Philadelphia COVID-19 daily case/test data by date
readr::read_csv(
  url("https://phl.carto.com/api/v2/sql?q=SELECT+*+FROM+covid_cases_by_date&filename=covid_cases_by_date&format=csv&skipfields=cartodb_id"), 
  col_types = readr::cols(the_geom = readr::col_skip(), 
                          the_geom_webmercator = readr::col_skip(), 
                          collection_date = readr::col_character(), 
                          count = readr::col_integer(), 
                          etl_timestamp = readr::col_character())) %>%
  tidyr::pivot_wider(names_from = test_result, values_from = count) %>%
  readr::write_csv(stringr::str_c(Sys.getenv("COVID19PHILLY_DIR"),"cases_by_date/", 
                                        "covid_cases_by_date_", 
                                        paste0(lubridate::today()), 
                                        ".csv.gz"))

# Philadelphia COVID-19 daily case/test data by outcome
readr::read_csv(
  url("https://phl.carto.com/api/v2/sql?q=SELECT+*+FROM+covid_cases_by_outcome&filename=covid_cases_by_outcome&format=csv&skipfields=cartodb_id"), 
  col_types = readr::cols(the_geom = readr::col_skip(), 
                          the_geom_webmercator = readr::col_skip(), 
                          count = readr::col_integer(), 
                          etl_timestamp = readr::col_character())) %>%
  readr::write_csv(stringr::str_c(Sys.getenv("COVID19PHILLY_DIR"),"cases_by_outcome/", 
                                        "covid_cases_by_outcome_", 
                                        paste0(lubridate::today()), 
                                        ".csv.gz"))

# Philadelphia COVID-19 daily case/test data by race
readr::read_csv(
  url("https://phl.carto.com/api/v2/sql?filename=covid_cases_by_race&format=csv&skipfields=cartodb_id,the_geom,the_geom_webmercator&q=SELECT+*+FROM+covid_cases_by_race"), 
  col_types = readr::cols(racial_identity = readr::col_character(), 
                          count = readr::col_integer(), 
                          etl_timestamp = readr::col_character())) %>% 
  readr::write_csv(stringr::str_c(Sys.getenv("COVID19PHILLY_DIR"),"cases_by_race/", 
                                        "covid_cases_by_race_", 
                                        paste0(lubridate::today()), 
                                        ".csv.gz"))

