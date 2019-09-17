
**DD measure of democracy**: The raw data file `ddrevisited_data_v1.dta`
comes from
<https://sites.google.com/site/joseantoniocheibub/datasets/democracy-and-dictatorship-revisited>.

**Polity IV measure of democracy**: The raw data file `p4v2018.xls`
comes from <http://www.systemicpeace.org/inscrdata.html>.

# File Organization

    cool-project/
    ├── R/
    │   ├── clean-data.R
    │   ├── fit-models.R
    │   ├── make-table.R
    │   └── plot-data.R
    ├── data/
    │   ├── raw/
    │   │   ├── ddrevisited_data_v1.dta
    │   │   └── p4v2018.xls
    │   ├── clean-data.csv
    │   └── clean-data.rds
    ├── doc/
    │   ├── fig/
    │   │   └── plot1.png
    │   ├── tab/
    │   │   └── table.tex
    │   ├── cool-project.pdf
    │   └── cool-project.tex
    ├── output/
    │   ├── model-fit.csv
    │   ├── model-fit.rds
    │   ├── model-pred.csv
    │   └── model-pred.rds
    ├── README.md
    └── cool-project.Rproj

# Review Exercises for Reading Data Sets Into R

There are 8 total data sets in `cool-project/` (all the files in `data/`
and `output/`). Answer the following questions for each data set:

1.  What function should you use to read that file?
2.  What’s the working directory?
3.  What’s the path (relative to the working directory)?
4.  Given the above, what’s the code to read the data (and store it as
    an object)?

# Solutions

## `ddrevisited_data_v1.dta`

1.  The `.dta` extension indicates that this is a Stata data set, so I
    should use the `read_dta()` function in the haven package.
2.  The working directory is `cool-project/` because the working
    directory is always the project directory since I use an `.Rproj`
    file to manage my projects.
3.  The path is `data/raw/ddrevisited_data_v1.dta`. I can see this in
    the directory tree above, by inspecting the directory on my computer
    (e.g., Finder for macOS), or by inspecting the *Files* tab in the
    lower-right window in RStudio.
4.  Below:

<!-- end list -->

``` r
# load packages
library(haven)  # needed for read_dta()

# load raw data set
raw_df <- read_dta("data/raw/ddrevisited_data_v1.dta")
```

## `p4v2018.xls`

1.  The `.xls` extension indicates that this is a Excel spreadsheet, so
    I should use the `read_excel()` function in the readxl package. But
    because this is an Excel spreadsheet, who knows what will happen.
2.  The working directory is `cool-project/` because the working
    directory is always the project directory since I use an `.Rproj`
    file to manage my projects.
3.  The path is `data/raw/dp4v2018.xls`. I can see this in the directory
    tree above, by inspecting the directory on my computer (e.g., Finder
    for macOS), or by inspecting the *Files* tab in the lower-right
    window in RStudio.
4.  Below:

<!-- end list -->

``` r
# load packages
library(readxl)  # needed for read_dta()

# load raw data set
raw_df <- read_excel("data/raw/p4v2018.xls")
```

## `clean-data.csv`

1.  The `.csv` extension indicates that this is a comma-separated or CSV
    data set, so I should use the `read_csv()` function in the readr
    package (that is part of tidyverse).
2.  The working directory is `cool-project/` because the working
    directory is always the project directory since I use an `.Rproj`
    file to manage my projects.
3.  The path is `data/clean-data.csv`. I can see this in the directory
    tree above, by inspecting the directory on my computer (e.g., Finder
    for macOS), or by inspecting the *Files* tab in the lower-right
    window in RStudio.
4.  Below:

<!-- end list -->

``` r
# load packages
library(tidyverse)  # automatically loads readr, needed for read_csv()

# load clean data set
df <- read_csv("data/clean-data.csv")
```

## `clean-data.rds`

1.  The `.rds` extension indicates that this is an R data set, so I
    should use the `read_rds()` function in the readr package (that is
    part of tidyverse).
2.  The working directory is `cool-project/` because the working
    directory is always the project directory since I use an `.Rproj`
    file to manage my projects.
3.  The path is `data/clean-data.rds`. I can see this in the directory
    tree above, by inspecting the directory on my computer (e.g., Finder
    for macOS), or by inspecting the *Files* tab in the lower-right
    window in RStudio.
4.  Below:

<!-- end list -->

``` r
# load packages
library(tidyverse)  # automatically loads readr, needed for read_rds()

# load clean data set
df <- read_rds("data/clean-data.rds")

# a little something extra, in case you're curious what the clean data set
# looks like. it contains the polity_iv and dd measures of democracy
glimpse(df)
```

    ## Observations: 7,722
    ## Variables: 5
    ## $ country_name <chr> "Afghanistan", "Afghanistan", "Afghanistan", "Afgha…
    ## $ year         <dbl> 1946, 1947, 1948, 1949, 1950, 1951, 1952, 1953, 195…
    ## $ cow_code     <dbl> 700, 700, 700, 700, 700, 700, 700, 700, 700, 700, 7…
    ## $ dd           <fct> Autocracy, Autocracy, Autocracy, Autocracy, Autocra…
    ## $ polity_iv    <dbl> -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -…

## `model-fit.csv`

1.  The `.csv` extension indicates that this is a comma-separated or CSV
    data set, so I should use the `read_csv()` function in the readr
    package (that is part of tidyverse).
2.  The working directory is `cool-project/` because the working
    directory is always the project directory since I use an `.Rproj`
    file to manage my projects.
3.  The path is `output/model-fit.csv`. I can see this in the directory
    tree above, by inspecting the directory on my computer (e.g., Finder
    for macOS), or by inspecting the *Files* tab in the lower-right
    window in RStudio.
4.  Below:

<!-- end list -->

``` r
# load packages
library(tidyverse)  # automatically loads readr, needed for read_csv()

# load clean data set
fit_df <- read_csv("output/model-fit.csv")
```

## `model-fit.rds`

1.  The `.rds` extension indicates that this is an R data set, so I
    should use the `read_rds()` function in the readr package (that is
    part of tidyverse).
2.  The working directory is `cool-project/` because the working
    directory is always the project directory since I use an `.Rproj`
    file to manage my projects.
3.  The path is `output/model-fit.rds`. I can see this in the directory
    tree above, by inspecting the directory on my computer (e.g., Finder
    for macOS), or by inspecting the *Files* tab in the lower-right
    window in RStudio.
4.  Below:

<!-- end list -->

``` r
# load packages
library(tidyverse)  # automatically loads readr, needed for read_rds()

# load clean data set
fit_df <- read_rds("output/model-fit.rds")

# a little something extra, in case you're curious what this "model fit"
# data set looks like (is a regression of polity_iv on dd)
glimpse(fit_df)
```

    ## Observations: 2
    ## Variables: 7
    ## $ term      <chr> "(Intercept)", "polity_iv"
    ## $ estimate  <dbl> -1.4428278, 0.4576718
    ## $ std.error <dbl> 0.06494906, 0.01026704
    ## $ statistic <dbl> -22.21476, 44.57678
    ## $ p.value   <dbl> 2.473027e-109, 0.000000e+00
    ## $ conf.low  <dbl> -1.572885, 0.438014
    ## $ conf.high <dbl> -1.3181194, 0.4782861

## `model-pred.csv`

1.  The `.csv` extension indicates that this is a comma-separated or CSV
    data set, so I should use the `read_csv()` function in the readr
    package (that is part of tidyverse).
2.  The working directory is `cool-project/` because the working
    directory is always the project directory since I use an `.Rproj`
    file to manage my projects.
3.  The path is `output/model-pred.csv`. I can see this in the directory
    tree above, by inspecting the directory on my computer (e.g., Finder
    for macOS), or by inspecting the *Files* tab in the lower-right
    window in RStudio.
4.  Below:

<!-- end list -->

``` r
# load packages
library(tidyverse)  # automatically loads readr, needed for read_csv()

# load clean data set
pred_df <- read_csv("output/model-pred.csv")
```

## `model-pred.rds`

1.  The `.rds` extension indicates that this is an R data set, so I
    should use the `read_rds()` function in the readr package (that is
    part of tidyverse).
2.  The working directory is `cool-project/` because the working
    directory is always the project directory since I use an `.Rproj`
    file to manage my projects.
3.  The path is `output/model-pred.rds`. I can see this in the directory
    tree above, by inspecting the directory on my computer (e.g., Finder
    for macOS), or by inspecting the *Files* tab in the lower-right
    window in RStudio.
4.  Below:

<!-- end list -->

``` r
# load packages
library(tidyverse)  # automatically loads readr, needed for read_rds()

# load clean data set
pred_df <- read_rds("output/model-pred.rds")

# a little something extra, in case you're curious what this "prediction fit"
# data set looks like (from a regression of polity_iv on dd)
glimpse(pred_df)
```

    ## Observations: 7,722
    ## Variables: 9
    ## $ dd         <fct> Autocracy, Autocracy, Autocracy, Autocracy, Autocracy…
    ## $ polity_iv  <dbl> -10, -10, -10, -10, -10, -10, -10, -10, -10, -10, -10…
    ## $ .fitted    <dbl> -6.019546, -6.019546, -6.019546, -6.019546, -6.019546…
    ## $ .se.fit    <dbl> 0.1551689, 0.1551689, 0.1551689, 0.1551689, 0.1551689…
    ## $ .resid     <dbl> -0.06968246, -0.06968246, -0.06968246, -0.06968246, -…
    ## $ .hat       <dbl> 5.828809e-05, 5.828809e-05, 5.828809e-05, 5.828809e-0…
    ## $ .sigma     <dbl> 0.6488059, 0.6488059, 0.6488059, 0.6488059, 0.6488059…
    ## $ .cooksd    <dbl> 7.085080e-08, 7.085080e-08, 7.085080e-08, 7.085080e-0…
    ## $ .std.resid <dbl> -0.0696845, -0.0696845, -0.0696845, -0.0696845, -0.06…
