load("help.RData")

# OPTION 1 ================================================
# create function and call is
# similar to creating macros in SAS

# make function run_reg to run over a list 
# of independent variables
# NOTE: helpdata is specified in function
# and cesd is specified as the Y variable
run_reg <- function(ind){
  summary(lm(cesd ~ ind, data = helpdata))
}

# make list of variables
my_vars <- c("mcs", "pcs", "pss_fr")

# use apply() to loop over variable list
apply(X = helpdata[, my_vars],
      MARGIN = 2,
      FUN = run_reg)

# OPTION 2 ================================================

# 1. Define your variables, dep and indep
dep_var <- "cesd"
indep_vars <- c("mcs", "pcs", "pss_fr")

# 2. Loop through independent variables using lapply
# lapply - apply a function over a list
# NOTE: data is specified below
models_list <- lapply(indep_vars, function(x) {
  # Dynamically build the formula: cesd ~ variable
  form <- as.formula(paste(dep_var, "~", x))
  
  # Run and return the linear model
  lm(form, data = helpdata)
})

# 3. Name the list elements for easy lookup
names(models_list) <- indep_vars

# View the summary of a specific model (e.g., cesd ~ mcs)
summary(models_list[["mcs"]])
summary(models_list$mcs)

# 4. Print summaries for all models at once
lapply(models_list, summary)

# Pull out just the R-squared values for every model
# sapply is like lapply - simplifies the output
sapply(models_list, function(m) summary(m)$r.squared)
lapply(models_list, function(m) summary(m)$r.squared)


