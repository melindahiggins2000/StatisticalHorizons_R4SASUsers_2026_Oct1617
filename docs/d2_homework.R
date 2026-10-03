# Day 2 Homework ==========================================
# 
# Remember to load the HELP dataset
# load the dplyr package
# load the gtsummary package
# load the modelsummary package
# load effectsize package

load("help.Rdata")

# Exercise 1 ==============================================
# - perform a t-test of the mcs scores at baseline
#   by homeless group variable
# - check the assumption of equal variance
#   using your choice of test
# - decide if you should run a pooled
#   or unpooled t-test
# - compute the effect size for the 
#   differences in the homeless groups
#   use cohens_d() from effectsize package





# Exercise 2 ==============================================
# - create a dichotomous variable for the
#   mcs scores for mcs > 50 or not (mcs <= 50)
# - create a factor type version of this result
#   and add informative labels
# - Using tbl_summary() from gtsummary package
#   make a table of mcs > 50 vs mcs <= 50 (in rows)
#   against homeless (in columns)
# - perform a chi-square test, set correct = TRUE
# - add some helpful labels to your table
#   using the example we did in class as a guide
#   for example, you can set the labels for 
#     stat_1 = "**Not Homeless**"
#     stat_2 = "**Homeless**"





# Exercise 3 ==============================================
# - Fit two linear models and compare them
# - model 1: "main" = lm(cesd ~ pss_fr, data=helpdata),
# - model 2: "adj" = lm(cesd ~ age + homeless + pss_fr, data=helpdata)
# - show a table of the results side-by-side
#   using modelsummary function from modelsummary
# - make a plot of the 2 model coefficients, 
#   using modelplot from modelsummary package
#   remove the Intercept coefficient from the plot





# Exercise 4 ==============================================
# - Fit a logistic regression model
# - for homeless (as the dichotomous outcome)
# - look at age, pss_fr and cesd as predictors
# - show the results using tbl_regression
#   from the gtsummary package
# - set exponentiate = TRUE to get the odds ratios
# - add custom fit statistics of your preference
#   to the results table





# Exercise 5 ==============================================
# - select the 5 time point measurements
#   for the mcs, mcs1, mcs2, mcs3, mcs4
# - select the ids, age, homeless and treat 
#   as static constant variables
# - after making the LONG formatted dataset
#   add a time index variable and add labels
# - get the means and standard deviations
#   by time point and treatment group
#   save these summary statistics into another
#   dataset object
# - OPTIONAL - using the code we did in class as a guide
#   make an errorbar plot by timepoint with panel facets
#   by treatment group




