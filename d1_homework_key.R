# Day 1 Homework ==========================================

# Exercise 1 ==============================================
# - Create a sequence of numbers from 
#   10 to 100 in increments of 2, save in an object
#   called "x"
# - Create another object called "y" that is a function
#   of x, where y = 4 + (5*x) + (10*x*x)
# - make a plot of x and y using plot()
#   from base R
# - show both points and lines
# - color the points and lines as "purple"

x <- seq(from=10, to=100, by=2)
y <- 4 + (5*x) + (10*x*x)
plot(x, y, 
     type = "b", 
     col = "purple")

# Exercise 2 ==============================================
# - load the HELP dataset
# - load the dplyr package to your computational session
# - create a new factor type variable called
#   gender.f, with labels of
#   "male" for 0
#   "female" for 1

load("help.Rdata")

library(dplyr)

helpdata <- helpdata %>%
  mutate(
    gender.f = factor(female,
                      levels = c(0, 1),
                      labels = c("male", "female")))

class(helpdata$female)    # this is numeric
class(helpdata$gender.f)  # this is factor
class(helpdata$racegrp)   # this is factor

table(helpdata$female)
table(as.numeric(helpdata$gender.f))



# Exercise 3 ==============================================
# - from the updated helpdata dataset after adding gender.f
# - select the "homeless" participants (using the filter() function)
#   using homeless == 1
# - also select only cesd and pss_fr from baseline
#   and select gender.f variable
# - use dplyr package with the 
#   select() and filter()
# - using ggplot2, make a scatterplot
#   of cesd scores (on the y-axis)
#   by pss_fr (on the x-axis)
# - color the points by gender (using the variable female) - **TYPO use gender.f**
# - add a best fit line for each group
# - add a title "CESD by Perceived Social Support from Friends"
# - add a subtitle "Best fit lines by gender"

h1 <- helpdata %>%
  filter(homeless == 1) %>%
  select(cesd, pss_fr, gender.f, female)

helpdata %>%
  filter(gender.f == "male") %>%
  dim()

library(ggplot2)
ggplot(h1,
       aes(x=pss_fr, 
           y=cesd,
           color = as.factor(female))) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(
    title = "CESD by Perceived Social Support from Friends",
    subtitle = "Best fit lines by gender")

# Exercise 4 ==============================================
# - using the summarise function from dplyr
# - filter out the cases that have missing
#   cesd2 values at 12 months
#   use filter(!is.na(cesd2)) to keep the
#   cases where cesd2 is NOT missing
#   putting ! in front of the is.na() function
#   finds the non-missing cesd2 values
# - compute mean and sd for cesd2
#   also add n=n() to get the sample sizes
# - and group these statistics by homeless group

cesd2.summary <- helpdata %>%
  filter(!is.na(cesd2)) %>%
  group_by(homeless) %>%
  summarise(
    n = n(),
    sd_cesd = sd(cesd2, na.rm = TRUE),
    mean_cesd = mean(cesd2, na.rm = TRUE)
  )
cesd2.summary

# Exercise 5 ==============================================
# - Using the tbl_cross() function from gtsummary
# - Make a table of racegrp (in the rows)
#   by homeless (in the columns)
# - show the column %s
# - compute the Fisher's exact test p-value

library(gtsummary)
helpdata %>%
  tbl_cross(row = racegrp, 
            col = homeless,
            percent = "column") %>%
  bold_labels() %>%
  add_p(test = "fisher.test")
