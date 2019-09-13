
# load packages
library(tidyverse)
library(broom)
# also need arm package; used but not loaded below

# load data
df <- read_rds("data/clean-data.rds") %>%
  glimpse()

# fit model
fit <- glm(dd ~ polity_iv, data = df, family = binomial)
arm::display(fit)

# tidy model fit into data frame
fit_df <- tidy(fit, conf.int = TRUE) %>%
  glimpse() %>%
  write_rds("output/model-fit.rds") %>%
  write_csv("output/model-fit.csv")
pred_df <- augment(fit) %>%
  glimpse() %>%
  write_rds("output/model-pred.rds") %>%
  write_csv("output/model-pred.csv")

