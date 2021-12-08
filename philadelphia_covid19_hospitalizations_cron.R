library(tidyverse)

# Philadelphia zip code level COVID-19 daily hospitalization data
readr::read_csv(
  httr::RETRY("GET","https://phl.carto.com/api/v2/sql?filename=covid_hospitalizations_by_zip&format=csv&skipfields=cartodb_id,the_geom,the_geom_webmercator&q=SELECT+*+FROM+covid_hospitalizations_by_zip")$content, 
  col_types = readr::cols(zip_code = readr::col_character(), 
                          hospitalized = readr::col_character(), 
                          count = readr::col_integer(), 
                          etl_timestamp = readr::col_character())) %>%
  tidyr::pivot_wider(names_from = hospitalized, values_from = count) %>%
  readr::write_csv(stringr::str_c(Sys.getenv("COVID19PHILLY_DIR"),"hospitalizations_by_zipcode/", 
                                        "covid_hospitalizations_by_zip_", 
                                        paste0(lubridate::today()), 
                                        ".csv.gz"))

# Philadelphia COVID-19 daily hospitalization data by age
readr::read_csv(
  httr::RETRY("GET","https://phl.carto.com/api/v2/sql?filename=covid_hospitalizations_by_age&format=csv&skipfields=cartodb_id,the_geom,the_geom_webmercator&q=SELECT+*+FROM+covid_hospitalizations_by_age")$content, 
  col_types = readr::cols(age = readr::col_character(),
                          hospitalized = readr::col_character(),
                          count = readr::col_integer(), 
                          etl_timestamp = readr::col_character())) %>%
  tidyr::pivot_wider(names_from = hospitalized, values_from = count) %>%
  readr::write_csv(stringr::str_c(Sys.getenv("COVID19PHILLY_DIR"),"hospitalizations_by_age/", 
                                        "covid_hospitalizations_by_age_", 
                                        paste0(lubridate::today()), 
                                        ".csv.gz"))

# Philadelphia COVID-19 daily hospitalization data by sex
readr::read_csv(
  httr::RETRY("GET","https://phl.carto.com/api/v2/sql?filename=covid_hospitalizations_by_sex&format=csv&skipfields=cartodb_id,the_geom,the_geom_webmercator&q=SELECT+*+FROM+covid_hospitalizations_by_sex")$content, 
  col_types = readr::cols(sex = readr::col_character(),
                          hospitalized = readr::col_character(), 
                          count = readr::col_integer(), 
                          etl_timestamp = readr::col_character())) %>%
  tidyr::pivot_wider(names_from = hospitalized, values_from = count) %>%
  readr::write_csv(stringr::str_c(Sys.getenv("COVID19PHILLY_DIR"),"hospitalizations_by_sex/", 
                                        "covid_hospitalizations_by_sex_", 
                                        paste0(lubridate::today()), 
                                        ".csv.gz"))

# Philadelphia COVID-19 daily hospitalization data by date
readr::read_csv(
  httr::RETRY("GET","https://phl.carto.com/api/v2/sql?filename=covid_hospitalizations_by_date&format=csv&skipfields=cartodb_id,the_geom,the_geom_webmercator&q=SELECT+*+FROM+covid_hospitalizations_by_date")$content, 
  col_types = readr::cols(date = readr::col_character(),
                          hospitalized = readr::col_character(),  
                          count = readr::col_integer(), 
                          etl_timestamp = readr::col_character())) %>%
  tidyr::pivot_wider(names_from = hospitalized, values_from = count) %>%
  readr::write_csv(stringr::str_c(Sys.getenv("COVID19PHILLY_DIR"),"hospitalizations_by_date/", 
                                        "covid_hospitalizations_by_date_", 
                                        paste0(lubridate::today()), 
                                        ".csv.gz"))

# Philadelphia COVID-19 daily hospitalization data by race
readr::read_csv(
  httr::RETRY("GET","https://phl.carto.com/api/v2/sql?filename=covid_hospitalizations_by_race&format=csv&skipfields=cartodb_id,the_geom,the_geom_webmercator&q=SELECT+*+FROM+covid_hospitalizations_by_race")$content, 
  col_types = readr::cols(racial_identity = readr::col_character(),
                          hospitalized = readr::col_character(),  
                          count = readr::col_integer(), 
                          etl_timestamp = readr::col_character())) %>%
  tidyr::pivot_wider(names_from = hospitalized, values_from = count) %>%
  readr::write_csv(stringr::str_c(Sys.getenv("COVID19PHILLY_DIR"),"hospitalizations_by_race/", 
                                        "covid_hospitalizations_by_race_", 
                                        paste0(lubridate::today()), 
                                        ".csv.gz"))

