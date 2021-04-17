library(tidyverse)

# Philadelphia zip code level COVID-19 daily deaths data
readr::read_csv(
  url("https://phl.carto.com/api/v2/sql?filename=covid_deaths_by_zip&format=csv&skipfields=cartodb_id,the_geom,the_geom_webmercator&q=SELECT%20*%20FROM%20covid_deaths_by_zip"), 
  col_types = readr::cols(zip_code = readr::col_character(),
                          count = readr::col_integer(),
                          etl_timestamp = readr::col_character())) %>%
  readr::write_csv(stringr::str_c(Sys.getenv("COVID19PHILLY_DIR"),"deaths_by_zipcode/", 
                           "covid_deaths_by_zip_", 
                           paste0(lubridate::today()), 
                           ".csv.gz"))

# Philadelphia COVID-19 daily deaths data by sex and age
readr::read_csv(
  url("https://phl.carto.com/api/v2/sql?filename=covid_deaths_by_age&format=csv&skipfields=cartodb_id,the_geom,the_geom_webmercator&q=SELECT%20*%20FROM%20covid_deaths_by_age"), 
  col_types = readr::cols(count = readr::col_integer(), 
                          etl_timestamp = readr::col_character())) %>%
  readr::write_csv(stringr::str_c(Sys.getenv("COVID19PHILLY_DIR"),"deaths_by_sex_age/", 
                                        "covid_deaths_by_sex_age_", 
                                        paste0(lubridate::today()), 
                                        ".csv.gz"))

# Philadelphia COVID-19 daily deaths data by date
readr::read_csv(
  url("https://phl.carto.com/api/v2/sql?filename=covid_deaths_by_date&format=csv&skipfields=cartodb_id,the_geom,the_geom_webmercator&q=SELECT%20*%20FROM%20covid_deaths_by_date"), 
  col_types = readr::cols(clinical_date_of_death = readr::col_character(),
                          count = readr::col_integer(), 
                          etl_timestamp = readr::col_character())) %>% 
  readr::write_csv(stringr::str_c(Sys.getenv("COVID19PHILLY_DIR"),"deaths_by_date/", 
                                        "covid_deaths_by_date_", 
                                        paste0(lubridate::today()), 
                                        ".csv.gz"))

# Philadelphia COVID-19 daily deaths data by race
readr::read_csv(
  url("https://phl.carto.com/api/v2/sql?filename=covid_deaths_by_race&format=csv&skipfields=cartodb_id,the_geom,the_geom_webmercator&q=SELECT+*+FROM+covid_deaths_by_race"), 
  col_types = readr::cols(racial_identity = readr::col_character(),
                          count = readr::col_integer(), 
                          etl_timestamp = readr::col_character())) %>%
  readr::write_csv(stringr::str_c(Sys.getenv("COVID19PHILLY_DIR"),"deaths_by_race/", 
                                        "covid_deaths_by_race_", 
                                        paste0(lubridate::today()), 
                                        ".csv.gz"))

