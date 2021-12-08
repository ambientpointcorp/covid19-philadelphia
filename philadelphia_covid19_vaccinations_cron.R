library(tidyverse)

# Philadelphia COVID-19 daily vaccinations total
readr::read_csv(
  httr::RETRY("GET","https://phl.carto.com/api/v2/sql?filename=covid_vaccine_totals&format=csv&skipfields=cartodb_id,the_geom,the_geom_webmercator&q=SELECT+*+FROM+covid_vaccine_totals")$content, 
  col_types = readr::cols(etl_timestamp = readr::col_character())) %>%
  readr::write_csv(stringr::str_c(Sys.getenv("COVID19PHILLY_DIR"),"vaccinations_total/", 
                                             "covid_vaccinations_total_", 
                                             paste0(lubridate::today()), 
                                             ".csv.gz"))

# Philadelphia zip code level COVID-19 daily vaccination data
readr::read_csv(
  httr::RETRY("GET","https://phl.carto.com/api/v2/sql?filename=covid_vaccines_by_zip&format=csv&skipfields=cartodb_id,the_geom,the_geom_webmercator&q=SELECT+*+FROM+covid_vaccines_by_zip")$content, 
  col_types = readr::cols(zip_code = readr::col_character(), 
                          etl_timestamp = readr::col_character())) %>%
  readr::write_csv(stringr::str_c(Sys.getenv("COVID19PHILLY_DIR"),"vaccinations_by_zipcode/", 
                                        "covid_vaccinations_by_zip_", 
                                        paste0(lubridate::today()), 
                                        ".csv.gz"))

# Philadelphia COVID-19 daily vaccination data by age
readr::read_csv(
  httr::RETRY("GET","https://phl.carto.com/api/v2/sql?filename=covid_vaccines_by_age&format=csv&skipfields=cartodb_id,the_geom,the_geom_webmercator&q=SELECT+*+FROM+covid_vaccines_by_age")$content, 
  col_types = readr::cols(age = readr::col_character(),
                          etl_timestamp = readr::col_character())) %>%
  readr::write_csv(stringr::str_c(Sys.getenv("COVID19PHILLY_DIR"),"vaccinations_by_age/", 
                                        "covid_vaccinations_by_age_", 
                                        paste0(lubridate::today()), 
                                        ".csv.gz"))

# Philadelphia COVID-19 daily vaccination data by sex
readr::read_csv(
  httr::RETRY("GET","https://phl.carto.com/api/v2/sql?filename=covid_vaccines_by_sex&format=csv&skipfields=cartodb_id,the_geom,the_geom_webmercator&q=SELECT+*+FROM+covid_vaccines_by_sex")$content, 
  col_types = readr::cols(sex = readr::col_character(),
                          etl_timestamp = readr::col_character())) %>%
  readr::write_csv(stringr::str_c(Sys.getenv("COVID19PHILLY_DIR"),"vaccinations_by_sex/", 
                                        "covid_vaccinations_by_sex_", 
                                        paste0(lubridate::today()), 
                                        ".csv.gz"))

# Philadelphia COVID-19 daily vaccination data by race
readr::read_csv(
  httr::RETRY("GET","https://phl.carto.com/api/v2/sql?filename=covid_vaccines_by_race&format=csv&skipfields=cartodb_id,the_geom,the_geom_webmercator&q=SELECT+*+FROM+covid_vaccines_by_race")$content, 
  col_types = readr::cols(racial_identity = readr::col_character(),
                          etl_timestamp = readr::col_character())) %>%
  readr::write_csv(stringr::str_c(Sys.getenv("COVID19PHILLY_DIR"),"vaccinations_by_race/", 
                                        "covid_vaccinations_by_race_", 
                                        paste0(lubridate::today()), 
                                        ".csv.gz"))

