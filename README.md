# covid19-philadelphia
De-identified, aggregate datasets showing COVID-19 cases and deaths by date, zip, or age/sex as made available by the City of Philadelphia through its Open Data Program.

The data in this repository (collected since 6/4/20) is a history of daily datasets made available here: https://www.opendataphilly.org/showcase/philadelphia-covid-19-information

For terms of use: https://www.opendataphilly.org/organization/about/city-of-philadelphia

---------
If you are an R/RStudio user, to get started reading and analyzing the data:
* Clone this repo
* Open a new project with RStudio based on an existing folder, pointing to the local copy of the repo
* Read all the files within a folder as a historical dataset:
```
library(tidyverse)

# Simple function to read all the files within a folder
build_historical_dataset <- function(data_folder) {
  list.files(path = data_folder, full.names = TRUE) %>%
    map_dfr(read_csv)
}
example <- build_historical_dataset("cases_by_date")
example
# A tibble: 1,305 x 4
   result_date etl_timestamp       positive negative
   <date>      <dttm>                 <dbl>    <dbl>
 1 2020-03-27  2020-06-04 17:20:02      222      769
 2 2020-05-05  2020-06-04 17:20:02      362     1252
 3 2020-05-30  2020-06-04 17:20:02      126     1525
 4 2020-03-24  2020-06-04 17:20:02      115      477
 5 2020-04-26  2020-06-04 17:20:02      204      620
 6 2020-05-23  2020-06-04 17:20:02      192     1535
 7 2020-04-16  2020-06-04 17:20:02      524      772
 8 2020-05-01  2020-06-04 17:20:02      414     1104
 9 2020-05-20  2020-06-04 17:20:02      193     1697
10 2020-04-24  2020-06-04 17:20:02      490     1147
# … with 1,295 more rows
```
