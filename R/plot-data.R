
# load packages
library(tidyverse)

# load data
df <- read_rds("data/clean-data.rds") %>%
  glimpse()

# sample some countries
ctry_pop <- unique(df$country_name)
ctry_samp <- sample(ctry_pop, 16)
s_df <- filter(df, country_name %in% ctry_samp)

# plot
ggplot(s_df, aes(x = year, y = polity_iv)) + 
  geom_line() + 
  geom_point(aes(color = dd), size = 0.5) + 
  facet_wrap(vars(country_name))
ggsave("doc/fig/plot1.png", height = 4, width = 6)
