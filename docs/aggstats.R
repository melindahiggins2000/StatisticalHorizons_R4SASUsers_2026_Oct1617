load("help.RData")

# compute aggregate stats
# dplyr approach
summary_stats <- 
  helpdata %>%
  group_by(racegrp) %>%
  summarise(
    meancesd = mean(cesd, na.rm = TRUE),
    stdcesd = sd(cesd, na.rm = TRUE)
  )

summary_stats

# data.table 
library(data.table)

# convert from data.frame to data.table
helpdt <- as.data.table(helpdata)

# Compute the mean cesd by racegrp
summary_statsdt <-
  helpdt[, 
         .(
           count = .N,
           meancesd = mean(cesd, na.rm = TRUE),
           stdcesd = sd(cesd, na.rm = TRUE)
           ), 
         by = racegrp]

summary_statsdt

# add aggregate stats back to raw dataset
helpsub <- 
  helpdata %>%
  select(id, age, racegrp, cesd)

helpsubdt <- as.data.table(helpsub)

# note the use of the `:=`() syntax
helpsubdt_agg <-
  helpsubdt[, 
            `:=`(
              cesdmean = mean(cesd, na.rm = TRUE),
              cesdstd = sd(cesd, na.rm = TRUE)
            ),
            by = racegrp]



