# load dataset
load("help.RData")

# example similar to %let in SAS ==========================
# 1. create a "macro" object with the value
gender <- "Female"

# 2. Use the macro variable in a title or step
# One option using paste() - result shown in Console
paste("Report for", gender, "Gender")

# 3. Use in another output like a plot
helpfemale = subset(helpdata, female == 1)
plot(x = helpfemale$mcs, 
     y = helpfemale$cesd,
     main = "CESD by MCS",
     sub = paste("Plot for", gender, "Gender"),
     xlab = "Mental Component Score (MCS)",
     ylab = "CESD - Depressive Symptom Scores")

# another example use in models ===========================

# Define model parameters
my_dep <- "cesd"
my_indep <- "mcs"
my_data <- helpdata

# Use the macro objects in a model procedure
# use reformulate() to generate function call
# returns a formula
m1 <- lm(
  formula = reformulate(termlabels = my_indep, 
                        response = my_dep), 
  data = my_data
  )
summary(m1)

# make scatterplot with best fit lines
car::scatterplot(
  reformulate(termlabels = my_indep, response = my_dep), 
  data = my_data
  )


