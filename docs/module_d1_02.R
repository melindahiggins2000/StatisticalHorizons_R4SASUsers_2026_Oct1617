# Day 1 Afternoon Code ====================================

# =========================================================
# Section 1. Get Started with H.E.L.P. Dataset ============
# =========================================================

# OPTION 1: Load HELP dataset in .Rdata format
load("help.RData")

# OPTION 2: Load HELP dataset in .sas7bdat format
# Click File/Import Dataset/From SAS
library(haven)
helpmkh <- read_sas("help.sas7bdat", NULL)

# OTHER FORMATS: Load HELP dataset from SPSS
# I edited this file to add the "codebook"
# variable and value labels included
library(haven)
helpmkh2 <- read_sav("helpmkh.sav")

# Read in CSV File - "Import Dataset/From Text (readr)"
library(readr)
help <- read_csv("help.csv")

# =========================================================
# Section 2A. Selecting Data (variables and subsets) ======
# =========================================================

# Use dataset from
# load("help.RData")

# Base R Approach - use $ to select a variable
# output to Console
helpdata$age

# save as separate object
ages <- helpdata$age

# tidyverse - dplyr Approach using select()
library(dplyr)
helpdata %>%
  select(age) %>%
  print(10)        # only print out 10 rows

# save object
ages2 <- helpdata %>%
  select(age)

# QUESTION - What is different between ages and ages2? ====
# Look at Global Environment window
class(ages)
class(ages2)

# select multiple variables
agecesd <- helpdata %>%
  select(age, cesd)

# get list of all variables in dataset
names(helpdata)

# Hint remove quotes " " ==================================
noquote(names(helpdata))
names(helpdata) %>% noquote()

# Base R approach 
# pull out rows 1-10 and column 69 (which is age)
# dataset[row,column] index approach
helpdata[1:10, 69]

# another option, use variable name
helpdata[1:10, "age"]

# select women, get stats for age
# female coded as
#   0 for men
#   1 for women
# Use == for logical check of equality
# learn more
# help('==', package ="base")
ageswomen <- helpdata[helpdata$female == 1, "age"]


# dplyr approach ==========================================
# notice the output is different again
# get rows 1-10 and column 69 (which is age) 
helpdata %>%
  slice(1:10) %>%
  select(69)

# another option, use variable name
helpdata %>%
  slice(1:10) %>%
  select(age)

# select women, get ages
ageswomen2 <- helpdata %>%
  filter(female == 1) %>%
  select(age)

class(ageswomen)
class(ageswomen2)

# =========================================================
# Section 2B. Exporting Data (variables and subsets) ======
# =========================================================

# now that we have created some new datasets (data.frame)
# let's save agecesd and ageswomen2 as .Rdata files
save(agecesd, 
     file = "agecesd.Rdata")
save(ageswomen2, 
     file = "ageswomen2.Rdata")

# check your files - there should be 2 new .Rdata files

# we could also save more than one object into a .Rdata file
save(ages, ages2, ageswomen,
     file = "otherobjects.Rdata")

# let's remove these objects and reload them
# list objects in Global Environment
ls()
rm(ages, ages2, ageswomen, agecesd, ageswomen2)
ls()

# load "agecesd.Rdata" a single data object
load("agecesd.Rdata")
ls()

# load "otherobjects.Rdata", multiple objects
load("otherobjects.Rdata")
ls()

# if you want to save everything in your 
# global environment at the moment
save.image(file = "allobjects.Rdata")

# remove everything
rm(list = ls())
ls()

# load it back
load("allobjects.Rdata")
ls()

# =========================================================
# Section 3. Getting descriptive statistics ===============
# =========================================================

# Get descriptive statistics with summary()
# get min, max, mean, median and quartiles
summary(helpdata$age)

helpdata %>%
  select(age) %>%
  summary()

# get parametric statistics
sd(helpdata$age)

helpdata %>%
  select(age) %>%
  sd()

# this causes an error
# the sd() function is expecting
# a vector type variable not a data.frame
# what is the result after the select() step

aa <- helpdata %>%
  select(age)
class(aa)

# use the unlist() function to convert it to a vector
helpdata %>%
  select(age) %>%
  unlist() %>%
  sd()

# the dplyr package also has
# the pull() function which results in 
# a vector as well
helpdata %>%
  pull(age) %>%
  sd()


# what if we have missing data?
x <- c(1,2,3,4,5,NA)
summary(x)
sd(x)
sd(x, na.rm=TRUE)

# dplyr approach
x %>%
  sd(na.rm=TRUE)

# adjust for missing values
# parametric stats
mean(helpdata$age, na.rm=TRUE)
sd(helpdata$age, na.rm=TRUE)

# get non-parametric statistics
min(helpdata$age, na.rm=TRUE)
max(helpdata$age, na.rm=TRUE)
median(helpdata$age, na.rm=TRUE)
quantile(helpdata$age, probs = 0.25, na.rm=TRUE)
quantile(helpdata$age, probs = 0.75, na.rm=TRUE)

# create custom output
helpdata %>%
  summarise(
    age_n = n(),
    meanage = mean(age, na.rm=TRUE),
    sdage = sd(age, na.rm=TRUE),
    medage = median(age, na.rm=TRUE),
    q25age = quantile(age, 
                      probs = 0.25,
                      na.rm=TRUE),
    q75age = quantile(age, 
                      probs = 0.75,
                      na.rm=TRUE),
    minage = min(age, na.rm=TRUE),
    maxage = max(age, na.rm=TRUE)
  )


# NOTE: Pay attention to default settings!
# get percentiles, use quantile() function
# check default settings
# There are 9 possible algorithms
# the default is type=7
help(quantile, package = "stats")

# get 25th, 50th, 75th percentiles
# use default type=7
quantile(helpdata$age, 
         probs = c(0.25, 0.50, 0.75),
         na.rm=TRUE)

# compare to type=9
quantile(helpdata$age, 
         probs = c(0.25, 0.50, 0.75),
         type=9,
         na.rm=TRUE)

# get age stats for women only
helpdata %>%
  filter(female == 1) %>%
  summarise(
    age_n = n(),
    meanage = mean(age, na.rm=TRUE),
    sdage = sd(age, na.rm=TRUE),
    medage = median(age, na.rm=TRUE),
    q25age = quantile(age, 
                      probs = 0.25,
                      na.rm=TRUE),
    q75age = quantile(age, 
                      probs = 0.75,
                      na.rm=TRUE),
    minage = min(age, na.rm=TRUE),
    maxage = max(age, na.rm=TRUE)
  )

# get age stats by racegrp
helpdata %>%
  group_by(racegrp) %>%
  summarise(
    age_n = n(),
    meanage = mean(age, na.rm=TRUE),
    sdage = sd(age, na.rm=TRUE),
    medage = median(age, na.rm=TRUE),
    q25age = quantile(age, 
                      probs = 0.25,
                      na.rm=TRUE),
    q75age = quantile(age, 
                      probs = 0.75,
                      na.rm=TRUE),
    minage = min(age, na.rm=TRUE),
    maxage = max(age, na.rm=TRUE)
  )

# sorting and displaying data =============================

# select IDs and cesd scores for women
# sort by age
helpdata %>%
  filter(female == 1) %>%
  select(id, cesd) %>%
  arrange(age)

# why didn't this work?

# select women
# sort by age
# show IDs, ages and cesd scores for 5 youngest women
helpdata %>%
  filter(female == 1) %>%
  arrange(age) %>%
  select(id, age, cesd) %>%
  head(5)

# show IDs, ages and cesd scores for 5 oldest women
# option 1
helpdata %>%
  filter(female == 1) %>%
  arrange(desc(age)) %>%
  select(id, age, cesd) %>%
  head(5)

# option 2 - same results slightly different order
helpdata %>%
  filter(female == 1) %>%
  arrange(age) %>%
  select(id, age, cesd) %>%
  tail(5)

# get frequencies and percents
# table of gender, show any missing values
# base R
table(helpdata$female, 
      useNA = "ifany")

# dplyr approach
helpdata %>%
  select(female) %>%
  table(useNA = "ifany")

# table of categorical data with NAs
fruit <- c("apple","apple","apple",
           "grape", NA, "grape")
table(fruit)
table(fruit, useNA = "ifany")

# table of racegrp by gender
# base R
table(helpdata$racegrp,
      helpdata$female, 
      useNA = "ifany")

# dplyr
helpdata %>%
  select(racegrp, female) %>%
  table(useNA = "ifany")

# add value labels to female
# and make it a "factor"
# Base R option
helpdata$female.f <- 
  factor(helpdata$female,
         levels = c(0, 1),
         labels = c("male", "female"))

# dplyr options with mutate
helpdata <- helpdata %>%
  mutate(
    gender.f = factor(female,
                      levels = c(0, 1),
                      labels = c("male", "female")))

# make table with gmodels package
# and CrossTable() function
# show expected counts
#      percents within columns
#      chi-square test
#      fisher's exact test

library(gmodels)
gmodels::CrossTable(helpdata$racegrp, 
                    helpdata$gender.f,
                    expected=TRUE,
                    prop.r=FALSE,
                    prop.t=FALSE,
                    prop.chisq=FALSE,
                    chisq=TRUE,
                    fisher=TRUE,
                    format = "SAS")

# using gtsummary package
# and tbl_cross() function
library(gtsummary)
helpdata %>%
  tbl_cross(row = racegrp, 
            col = gender.f,
            percent = "column") %>%
  bold_labels() %>%
  add_p()

# run fisher's exact test
helpdata %>%
  tbl_cross(row = racegrp, 
            col = gender.f,
            percent = "column") %>%
  bold_labels() %>%
  add_p(test = "fisher.test")

# show p-value to 3 digits
# show counts to 0 decimals
# show columns percent to 2 decimal digits
helpdata %>%
  tbl_cross(row = racegrp, 
            col = gender.f,
            percent = "column",
            digits = c(0, 2)) %>%
  bold_labels() %>%
  add_p(test = "fisher.test",
        pvalue_fun = label_style_pvalue(digits = 3))

# add better labels
# add caption title
helpdata %>%
  tbl_cross(row = racegrp, 
            col = gender.f,
            percent = "column",
            digits = c(0, 2),
            label = list(
              racegrp = "Race",
              gender.f= "Gender"
            )) %>%
  bold_labels() %>%
  add_p(test = "fisher.test",
        pvalue_fun = label_style_pvalue(digits = 3)) %>%
  modify_caption("**Table Race by Gender**")

# and with chi-square test results
helpdata %>%
  tbl_cross(row = racegrp, 
            col = gender.f,
            percent = "column",
            digits = c(0, 2),
            label = list(
              racegrp = "Race",
              gender.f= "Gender"
            )) %>%
  bold_labels() %>%
  add_p(pvalue_fun = label_style_pvalue(digits = 3)) %>%
  modify_caption("**Table Race by Gender**")

# =========================================================
# Section 4. Getting started with visualization ===========
# =========================================================

# main focus on ggplot2
library(ggplot2)

# scatterplot of mcs and cesd
ggplot(data = helpdata,
       aes(x = mcs,
           y = cesd)) +
  geom_point()

# color by gender
ggplot(data = helpdata,
       aes(x = mcs,
           y = cesd,
           color = gender.f)) +
  geom_point()

# add title, footnote, and better axis labels
# color by gender
# update legend title
# \n inserts line break in long caption
ggplot(data = helpdata,
       aes(x = mcs,
           y = cesd,
           color = gender.f)) +
  geom_point() +
  labs(
    title = "CESD Scores by MCS Scores",
    x = "CESD Scores",
    y = "MCS Scores",
    color = "Gender",
    caption = "CESD = Center for Epidemiological Studies-Depression \nand MCS = Mental Component Scale for SF36 Quality of Life"
  )

# add best fit lines by gender
ggplot(data = helpdata,
       aes(x = mcs,
           y = cesd,
           color = gender.f)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(
    title = "CESD Scores by MCS Scores",
    subtitle = "Models by Gender",
    x = "CESD Scores",
    y = "MCS Scores",
    color = "Gender",
    caption = "CESD = Center for Epidemiological Studies-Depression \nand MCS = Mental Component Scale for SF36 Quality of Life"
  )

# =========================================================
# OPTIONAL PLOT EXAMPLE 
# first get summary stats
# build error bar using stats
# means +/- SD for error bars
#
# use layers and multiple data sources
# to make lines plus points
# and add custom shapes
# custom color outlines and fills
# by groups
# 
# add ggtext package to enable markdown
# for formatting text in the caption
# see theme(plot.caption = ) below
library(ggtext)

# use ToothGrowth builtin dataset
# get summary stats for tooth length
# by dose and supplement 
tg.summary <- ToothGrowth %>%
  group_by(dose, supp) %>%
  summarise(
    sd = sd(len, na.rm = TRUE),
    len = mean(len, na.rm = TRUE)
  )
tg.summary

# Combine with jitter points
ggplot(ToothGrowth, 
       aes(x=dose, 
           y=len)) +
  geom_line(data = tg.summary,
            aes(group = 1),
            linewidth = 1.5) + 
  geom_point(data = tg.summary,
             size = 2) + 
  geom_errorbar(aes(ymin = len-sd, ymax = len+sd),
                width = 0.2,
                linewidth = 1.5,
                data = tg.summary) + 
  geom_jitter(position = position_jitter(0.2), 
              aes(color = supp, 
                  shape = supp,
                  fill = supp),
              size = 3) + 
  scale_shape_manual(values = c(21, 24)) +
  scale_color_manual(values = c("black",
                                "blue")) +
  scale_fill_manual(values = c("#cf34eb",
                               "#34eb4c")) +
  facet_wrap(vars(supp)) +
  labs(x = "Dose (mg/day)",
       y = "Length",
       title = "Guinea Pig Incisor Odontoblast Growth by Vitamin C Dose",
       subtitle = "Means +/- SD",
       caption = "Citation: Crampton, E. W. (1947). The growth of the odontoblast of the incisor teeth <br>as a criterion of vitamin C intake of the guinea pig. <br>*The Journal of Nutrition*, **33**_(5)_, 491–504. <br>*doi:10.1093/jn/33.5.491*.",
       color = "Supplement Type",
       shape = "Supplement Type",
       fill = "Supplement Type") +
  theme(plot.caption = element_markdown())


