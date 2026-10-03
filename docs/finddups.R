# load dataset
load("help.RData")

# find duplicates - save first case
# example first ID for each race group

library(dplyr)
helpdata %>%
  distinct(racegrp, 
           .keep_all = TRUE) %>%
  select(id, age, racegrp, cesd)

helpdata %>%
  select(id, age, racegrp, cesd) %>%
  arrange(racegrp, id) %>%
  as_tibble() %>%
  print(n = Inf)

# find and keep unique rows by
# age, female, racegrp and homeless
# save unique rows, 231 rows, 88 vars

my_vars <- c("age", "female", "racegrp", "homeless")

unique_rows <- 
  helpdata %>%
  distinct(pick(all_of(my_vars)), 
           .keep_all = TRUE)

dim(unique_rows)

