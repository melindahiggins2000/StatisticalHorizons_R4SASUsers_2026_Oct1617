# Day 2 Morning Code ======================================

# FIRST, Load HELP dataset in .Rdata format
load("help.RData")

# =========================================================
# Section 1. Statistical Tests and Models =================
# =========================================================

# t.test ==================================================
# compare cesd scores at 6m by treatment group
# NOTE: var.equal= FALSE is default
# unpooled t-test run by default
t.test(cesd1 ~ treat,
       data = helpdata)

# run pooled t-test
t.test(cesd1 ~ treat,
       var.equal = TRUE,
       data = helpdata)

# save results in an object
tt_cesd1 <- 
  t.test(cesd1 ~ treat,
         data = helpdata)

# check assumption of equal variance
bartlett.test(cesd1 ~ treat,
              data = helpdata)

# look at means and sd's of each group
# ratios of SDs is < 2
helpdata %>%
  group_by(treat) %>%
  summarise(
    meancesd1 = mean(cesd1, na.rm = TRUE),
    sdcesd1 = sd(cesd1, na.rm = TRUE)
  )

# OPTIONAL - Sample Sizes
helpdata %>%
  group_by(treat) %>%
  summarise(
    all_n = n(),
    n_cesd1 = sum(!is.na(cesd1)),
    miss_cesd1 = sum(is.na(cesd1)),
    meancesd1 = mean(cesd1, na.rm = TRUE),
    sdcesd1 = sd(cesd1, na.rm = TRUE)
  )

library(effectsize)
cohens_d(cesd1 ~ treat,
         pooled_sd = TRUE,
         data = helpdata)

# run non-parametric two-group test =======================
wilcox.test(cesd1 ~ treat,
            data = helpdata)

# chisquare.test ==========================================

# compute cesd1 > 16;
helpdata <- helpdata %>%
  mutate(
    cesd1_gt16 = cesd1 > 16
  )

# built-in chisq.test() function
# continuity correction TRUE by default
chisq.test(
  helpdata$cesd1_gt16, 
  helpdata$treat
)

library(gmodels)
gmodels::CrossTable(helpdata$cesd1_gt16, 
                    helpdata$treat,
                    expected=TRUE,
                    prop.r=FALSE,
                    prop.t=FALSE,
                    prop.chisq=FALSE,
                    chisq=TRUE,
                    fisher=TRUE,
                    format = "SAS")

# add factor variable
helpdata$cesd1_gt16.f <-
  factor(
    helpdata$cesd1_gt16,
    levels = c(FALSE, TRUE),
    labels = c("CESD <= 16",
               "CESD > 16")
  )

library(gtsummary)
# option 1 with tbl_summary()
helpdata %>%
  select(cesd1_gt16.f, treat) %>%
  tbl_summary(
    by = treat,
    label = list(
      cesd1_gt16.f = "CESD Split at 16")
  ) %>%
  modify_header(
    stat_1 = "**Control**", 
    stat_2 = "**Treatment**"
  ) %>%
  bold_labels() %>%
  add_p(
    test = cesd1_gt16.f ~ "chisq.test",
    test.args = list(cesd1_gt16.f ~ list(correct = TRUE)),
    pvalue_fun = label_style_pvalue(digits = 3)
  )

# option 2 with tbl_cross()
helpdata %>%
  tbl_cross(row = cesd1_gt16.f, 
            col = treat,
            percent = "column",
            digits = c(0, 2),
            label = list(
              cesd1_gt16.f = "CESD Split at 16",
              treat = "Treatment Group"
            )) %>%
  bold_labels() %>%
  add_p(test = "chisq.test",
        test.args = list(correct = TRUE),
        pvalue_fun = label_style_pvalue(digits = 3))

# get all non-missing cases and re-run
h1 <- helpdata %>%
  select(cesd1_gt16.f, treat) %>%
  filter(complete.cases(.))

h1 %>%
  tbl_cross(row = cesd1_gt16.f, 
            col = treat,
            percent = "column",
            digits = c(0, 2),
            label = list(
              cesd1_gt16.f = "CESD Split at 16",
              treat = "Treatment Group"
            )) %>%
  bold_labels() %>%
  add_p(test = "chisq.test",
        test.args = list(correct = TRUE),
        pvalue_fun = label_style_pvalue(digits = 3))

# ANOVA ===================================================
# the aov() function
# gives the global test for the "group" effect
fit.aov <- aov(mcs ~ racegrp, 
               data=helpdata)
fit.aov

# what kind of object is fit.aov
class(fit.aov)

# get better formatted output
summary(fit.aov)
anova(fit.aov)
sfitaov <- summary(fit.aov)

# NOTE: install the effects package
# use effects package to get
# effects plots - basically a plot
# of the means with 95% confidence intervals
# for each group, racegrp

library(effects)
alleff <- allEffects(fit.aov)
# make the effects plot
plot(allEffects(fit.aov))

# get post hoc tests
# to see the list of p-value adjustments for
# multiple comparisons type
help(summary.emmGrid, package="emmeans")

library(emmeans)
# bonferroni p-value adjustments
emmeans(fit.aov, 
        specs = pairwise ~ racegrp,
        adjust = "bonferroni")

# barlett's test for homogenity of variances
# note: put the formula back in
bartlett.test(mcs ~ racegrp, 
              data=helpdata)

# use lm to perform an ANOVA ==============================
# ANOVA
# the aov() function
# gives the global test for the "group" effect
fit.lmaov <- lm(mcs ~ racegrp, 
                data=helpdata)
summary(fit.lmaov)
anova(fit.lmaov)
sfitlmaov <- summary(fit.lmaov)

# formatted output using tbl_summary()
# from gtsummary package
# racegrp sorted alphabetically
# first group "black" used a reference
fit.lmaov %>%
  tbl_regression()

# add global p-value
# for racegrp as a whole
fit.lmaov %>%
  tbl_regression() %>%
  add_global_p()

# add model statistics
fit.lmaov %>%
  tbl_regression() %>%
  add_glance_table(
    include = c(r.squared, 
                adj.r.squared,
                p.value)
  )

# model statistics available
library(broom)
bg <- broom::glance(fit.lmaov)
bg
names(bg)

# fit a regression model ==================================
fit.lmreg <- lm(mcs ~ age + female + cesd,
                data = helpdata)
summary(fit.lmreg)

# also look at model effects for this lm model
# library(effects)
alleff <- allEffects(fit.lmreg)
# make the effects plot
plot(allEffects(fit.lmreg))

# make formatted table
# include intercept
# format digits to 3 decimals for betas
fit.lmreg %>%
  tbl_regression(
    intercept = TRUE,
    estimate_fun = ~ style_number(.x, digits = 3)
  ) %>%
  add_glance_table(
    include = c(r.squared, 
                adj.r.squared,
                p.value)
  )

# modelsummary package alternative to gtsummary ===========
library(modelsummary)
models <- list(
  "main" = lm(mcs ~ cesd, data=helpdata),
  "adj" = lm(mcs ~ age + female + cesd, data=helpdata)
)

# show side-by-side model results, add confidence intervals
modelsummary(models, statistic = 'conf.int')

# formal test of model comparisons
main <- lm(mcs ~ cesd, data=helpdata)
adj <- lm(mcs ~ age + female + cesd, data=helpdata)
anova(main, adj)

# plot comparisons of model coefficients,
# remove intercept coefficient from plot
modelplot(models, coef_omit = "(Intercept)")

# also get the standardized coefficients
modelsummary(models, 
             standardize = "refit",
             statistic = 'conf.int')

# OPTIONAL olsrr ==========================================
# Another package I like for working
# with "ordinary least squares" models
# is the olsrr package

# olsrr::ols_regress gives a nice summary
# including the standardized regression coefficients
library(olsrr)
olsrr::ols_regress(fit.lmreg)

# olsrr also has good model fit checks
# like multicollinearity checks, 
# VIF and condition index
# get VIF and multicollinearity stats
ols_coll_diag(fit.lmreg)

# diagnostic plots
# check for new output windows
ols_plot_diagnostics(fit.lmreg)

# normality tests for residuals
ols_test_normality(fit.lmreg)


# run a logistic regression ===============================
# for mcs > 50
helpdata <- helpdata %>%
  mutate(mcs_gt50 = as.numeric(mcs > 50))

table(helpdata$mcs_gt50)

# fit a logistic regression model
# use glm instead of lm
# and add family = binomial
fit.logreg <- 
  glm(mcs_gt50 ~ age + female + cesd,
      family = binomial,
     data = helpdata)
summary(fit.logreg)

# to see raw coefficients
coef(fit.logreg)

# exponentiate the coefficients
#to get odds ratios
exp(coef(fit.logreg))

# model statistics available
library(broom)
bg <- broom::glance(fit.logreg)
bg
names(bg)

# make formatted table
# include intercept
# remember to exponentiate the coefficients
# format digits to 3 decimals for betas
# and do 3 decimal digits for p-values
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

# =========================================================
# Section 2. Merging Datasets =============================
# =========================================================

# Load HELP dataset
# and subsets

# - dat1: all baseline cases, 
#         variables id, age, cesd
# - dat2: 12m cases, 
#         variables id, female, cesd2
# - treat1: control cases, 
#           variables id, treat, age, cesd, pcs
# - treat2: intervention cases, 
#           variables id, treat, age, cesd, pcs

load(file = "help.RData")
load(file = "dat1.Rdata")
load(file = "dat2.Rdata")
load(file = "treat1.Rdata")
load(file = "treat2.Rdata")

library(dplyr)

# joining and merging datasets

# join by ids
# keep only cases with both 
# cesd and cesd2
dat12_inner <- 
  inner_join(x = dat1,
             y = dat2,
             by = join_by(id))
head(dat12_inner)

# keep all cases from either dataset
dat12_full <- 
  full_join(x = dat1,
            y = dat2,
            by = join_by(id))
head(dat12_full)

# keep only cases from left (first)
# dataset
dat12_left <- 
  left_join(x = dat1,
            y = dat2,
            by = join_by(id))
head(dat12_left)

# check variable names
names(treat1)
names(treat2)

# stack datasets - join by variables
stack12 <- bind_rows(
  x = treat1,
  y = treat2
)
head(stack12)


# =========================================================
# Section 3. Restructuring Datasets =======================
# =========================================================

# pull out the cesd scores at all 5 time points
# also pull out baseline variables age and female and id
# and keep treatment group assignment

cesd5times <- helpdata %>%
  select(id,
         age,
         female,
         treat,
         cesd,
         cesd1,
         cesd2,
         cesd3,
         cesd4)

# cesd5times has 453 rows and 9 columns
dim(cesd5times)

# quick look at the data, top 10 rows
head(cesd5times,
     n=10)

# this is currently a "WIDE" data format
# where the measurements for different
# time points are in different columns
# Let's create a LONG formatted dataset
# where each ID will have a separate row
# for each time point - although for now
# we just have the original variable names

# Restructure from WIDE to LONG ===========================
# To do this, we will use
# pivot_longer() from the tidyr package

library(tidyr)

cesd5times_long <- 
  cesd5times %>%
  pivot_longer(
    cols = -c(id, age, female, treat),
    names_to = "varnames",
    values_to = "cesd"
  )

# The result cesd5times_long is now
# 453*5 = 2265 rows with 6 columns
dim(cesd5times_long)

# quick look at the data
head(cesd5times_long,
     n=10)

# To add a time point, we could do the following:
# - first create a new time point index
# - add a factor type variable for time with labels
# - learn the case_when() function
cesd5times_long <-
  cesd5times_long %>%
  mutate(
    timeindex = case_when(
      varnames == "cesd" ~ 1,
      varnames == "cesd1" ~ 2,
      varnames == "cesd2" ~ 3,
      varnames == "cesd3" ~ 4,
      varnames == "cesd4" ~ 5,
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

head(cesd5times_long, n=10)

# use these data with time to make a
# longitudinal error barplot of the
# means +/- sd of the CESD scores
# over time by treatment group

# get summary stats for CESD score
# by time and treatment group
cesd.summary <- cesd5times_long %>%
  group_by(time.f, treat) %>%
  summarise(
    sd = sd(cesd, na.rm = TRUE),
    cesd = mean(cesd, na.rm = TRUE)
  )
cesd.summary

# adapt the code from earlier module
library(ggplot2)
ggplot(cesd5times_long, 
       aes(x=time.f, 
           y=cesd,
           color = as.factor(treat))) +
  geom_line(data = cesd.summary,
            aes(group = 1),
            linewidth = 1.5) + 
  geom_point(data = cesd.summary,
             size = 4,
             aes(color = as.factor(treat),
                 shape = as.factor(treat),
                 fill = as.factor(treat))) + 
  geom_errorbar(aes(ymin = cesd-sd, 
                    ymax = cesd+sd),
                width = 0.2,
                linewidth = 1,
                data = cesd.summary) +
  scale_shape_manual(values = c(21, 24)) +
  scale_color_manual(values = c("black",
                                "blue")) +
  scale_fill_manual(values = c("#cf34eb",
                               "#34eb4c")) +
  facet_wrap(vars(treat)) +
  labs(x = "Time Point",
       y = "CESD",
       title = "CESD Scores Over 5 Study Time Points",
       subtitle = "Means +/- SD",
       caption = "",
       color = "Treatment Group",
       shape = "Treatment Group",
       fill = "Treatment Group")

# Restructure from LONG to WIDE ===========================
# What if we need to go back the other way
# from LONG to WIDE - we will use
# FIRST remove the timeindex and time.f
# pivot_wider() from tidyr

cesd5times_wide <- 
  cesd5times_long %>%
  select(-timeindex, -time.f) %>%
  pivot_wider(
    names_from = "varnames",
    values_from = "cesd"
  )

head(cesd5times_wide, 10)

# this pretty much takes us back to what
# we had before cesd5times_wide == cesd5times



