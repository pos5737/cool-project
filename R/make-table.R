
# load packages
library(tidyverse)
library(kableExtra)

# load data
df <- read_rds("output/model-fit.rds") %>%
  glimpse()

# make table
kable(df, format = "latex") %>%
  cat(file = "doc/tab/table.tex")
