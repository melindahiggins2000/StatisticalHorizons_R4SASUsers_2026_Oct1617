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

# check assumption of equal variance
bartlett.test(mcs ~ homeless,
              data = helpdata)

# the p-value=0.1213 which is not significant
# we can run a pooled t-test
t.test(mcs ~ homeless,
       var.equal = TRUE,
       data = helpdata)

library(effectsize)
cohens_d(cesd1 ~ treat,
         pooled_sd = TRUE,
         data = helpdata)

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

library(dplyr)

# compute cesd1 > 16;
helpdata <- helpdata %>%
  mutate(
    mcs_gt50 = mcs > 50
  )

# add factor variable
helpdata$mcs_gt50.f <-
  factor(
    helpdata$mcs_gt50,
    levels = c(FALSE, TRUE),
    labels = c("MCS <= 50",
               "MCS > 50")
  )

library(gtsummary)
# option 1 with tbl_summary()
helpdata %>%
  select(mcs_gt50.f, homeless) %>%
  tbl_summary(
    by = homeless,
    label = list(
      mcs_gt50.f = "MCS Split at 50")
  ) %>%
  modify_header(
    stat_1 = "**Not Homeless**", 
    stat_2 = "**Homeless**"
  ) %>%
  bold_labels() %>%
  add_p(
    test = mcs_gt50.f ~ "chisq.test",
    test.args = list(mcs_gt50.f ~ list(correct = TRUE)),
    pvalue_fun = label_style_pvalue(digits = 3)
  )


# Exercise 3 ==============================================
# - Fit two linear models and compare them
# - model 1: "main" = lm(cesd ~ pss_fr, data=helpdata),
# - model 2: "adj" = lm(cesd ~ age + homeless + pss_fr, data=helpdata)
# - show a table of the results side-by-side
#   using modelsummary function from modelsummary
# - make a plot of the 2 model coefficients, 
#   using modelplot from modelsummary package
#   remove the Intercept coefficient from the plot

library(modelsummary)
models <- list(
  "main" = lm(cesd ~ pss_fr, data=helpdata),
  "adj" = lm(cesd ~ age + homeless + pss_fr, data=helpdata)
)

# show side-by-side model results, add confidence intervals
modelsummary(models, statistic = 'conf.int')

# compare coefficients in the modelplot
modelplot(models, coef_omit = "(Intercept)")

# Exercise 4 ==============================================
# - Fit a logistic regression model
# - for homeless (as the dichotomous outcome)
# - look at age, pss_fr and cesd as predictors
# - show the results using tbl_regression
#   from the gtsummary package
# - set exponentiate = TRUE to get the odds ratios
# - add custom fit statistics of your preference
#   to the results table

# fit a logistic regression model
# use glm instead of lm
# and add family = binomial
fit.logreg <- 
  glm(homeless ~ age + pss_fr + cesd,
      family = binomial,
      data = helpdata)

fit.logreg %>%
  tbl_regression(
    intercept = TRUE,
    exponentiate = TRUE,
    estimate_fun = ~ style_number(.x, digits = 3),
    pvalue_fun = label_style_pvalue(digits = 3)
  ) %>%
  add_glance_table(
    include = c(AIC, BIC, nobs)
  )

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

mcs5times <- helpdata %>%
  select(id,
         age,
         homeless,
         treat,
         mcs,
         mcs1,
         mcs2,
         mcs3,
         mcs4)

library(tidyr)

mcs5times_long <- 
  mcs5times %>%
  pivot_longer(
    cols = -c(id, age, homeless, treat),
    names_to = "varnames",
    values_to = "mcs"
  )

mcs5times_long <-
  mcs5times_long %>%
  mutate(
    timeindex = case_when(
      varnames == "mcs" ~ 1,
      varnames == "mcs1" ~ 2,
      varnames == "mcs2" ~ 3,
      varnames == "mcs3" ~ 4,
      varnames == "mcs4" ~ 5,
      .default = NA_real_
    ),
    time.f = factor(
      timeindex,
      levels = c(1, 2, 3, 4, 5),
      labels = c("Baseline",
                 "6 mo",
                 "12 mo",
                 "18 mo",
                 "24 mo")
    )
  )

mcs.summary <- mcs5times_long %>%
  group_by(time.f, treat) %>%
  summarise(
    sd = sd(mcs, na.rm = TRUE),
    mcs = mean(mcs, na.rm = TRUE)
  )
mcs.summary

library(ggplot2)
ggplot(mcs5times_long, 
       aes(x=time.f, 
           y=mcs,
           color = as.factor(treat))) +
  geom_line(data = mcs.summary,
            aes(group = 1),
            linewidth = 1.5) + 
  geom_point(data = mcs.summary,
             size = 4,
             aes(color = as.factor(treat),
                 shape = as.factor(treat),
                 fill = as.factor(treat))) + 
  geom_errorbar(aes(ymin = mcs-sd, 
                    ymax = mcs+sd),
                width = 0.2,
                linewidth = 1,
                data = mcs.summary) +
  scale_shape_manual(values = c(21, 24)) +
  scale_color_manual(values = c("black",
                                "blue")) +
  scale_fill_manual(values = c("#cf34eb",
                               "#34eb4c")) +
  facet_wrap(vars(treat)) +
  labs(x = "Time Point",
       y = "MCS",
       title = "MCS Scores Over 5 Study Time Points",
       subtitle = "Means +/- SD",
       caption = "",
       color = "Treatment Group",
       shape = "Treatment Group",
       fill = "Treatment Group")








