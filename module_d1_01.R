# Day 1 Morning Code ============================

# bookmark label =============

# ===============================================
# Section 2. Write simple R code in Console =====
# ===============================================

# type code into Console
5 + 5

# see the last value or R object shown in Console
.Last.value

# save output in an object
ten <- 5 + 5


# built in constants
pi

# notice the index counter [#]
letters
LETTERS
month.name

# get details on type and size
class(letters)


# get help
# look in help window
# or type in Console
help(pi, package = "base")

# if don't know package
# run wide search
??plot

help(plot, package = "base")

# get help on an operator
help("+")

# try built-in function
seq(10)

# get help
# see arguments, details and 
# see value (the output)
help(seq, package = "base")

seq(from = 1,
    to = 10,
    by = 1)

# we can use lazy coding
seq(1, 10, 0.1)

# or we can change the order
# using explicit arguments
seq(to = 5,
    by = 0.1,
    from = 0)

# ===============================================
# Section 3. Create your first R script =========
# ===============================================

# R Script 01 ===================================
# Console Commands Line Examples ================
4 + 4
sqrt(25)
pi
seq(from=1, to=10, by=0.5)

# What does the seq() function do?
# Go to help tab
# or in console, type help(seq)



# Click on the ENVIRONMENT TAB
# Notice it is empty


# EXERCISE 01 ===================================
# How to save the output?
# save sequence of numbers in object x
x <- seq(from=1, to=10, by=0.5)

# view the contents of x
x

# Also take a look at the ENVIRONMENT TAB

# use x to create new object y
y <- x*x

# plot x and y
plot(x,y)

# Where did the plot go?
# Go to the Plots window - explore options

# Save plot directly to a JPG file
jpeg(filename = "myplot.jpg")
plot(x,y)
dev.off()


# EXERCISE 02 - TRY THESE ON YOUR OWN ===========
# create a new object cosx
cosx <- cos(x)

# plot x, cosx
plot(x, cosx)

# Check ENVIRONMENT TAB
# How many objects are there now?



# use functions as needed on the fly!
# plot x, sin(x)
plot(x, sin(x))     # assumed order x-axis and 

# then y-axis
plot(y=sin(x), x=x) # order doesn't matter 
# with explicit assignment

# plot both points and lines
# make the color red
plot(x, sin(x), type = "both", col = "red")

# This generates a Warning message
# but the plot code still runs and works
# we get a plot - here is the warning:
# 
# Warning message:
# In plot.xy(xy, type, ...) :
#   plot type 'both' will be truncated to first character
# 
# So, run the plot again but change
# type = "both" to type = "b"
plot(x, sin(x), type = "b", col = "red")

plot(x, sin(x), type = "b", col = "#373A78")

# Check ENVIRONMENT TAB
# How many objects are there now?

colors()

# [YOUR TURN] plot x and the tangent of x
# change color to blue
# hint: help(sin) - to see list of other trig functions
# hint: cut and paste code above to help you
plot(x, tan(x), type="b", col="blue")

# [YOUR TURN] plot log of x with log y
# change color to green
# hint: help(log) - to see list of log functions
plot(log(x), log(y), type = "b", col = "green")

# ===============================================
# Section 4. Install and load R packages ========
# ===============================================

# get R session details
sessionInfo()

# [1] install ggplot2
install.packages("ggplot2")

# try using ggplot - but
# I have not yet loaded ggplot2 into the session
# try the ggplot() function with the
# built-in pressure dataset to see error
ggplot(pressure, aes(temperature, pressure)) +
  geom_point()

# [2] Load ggplot2 package into session
library(ggplot2)

# now check session
sessionInfo()

# try ggplot code again
ggplot(pressure, aes(temperature, pressure)) +
  geom_point()

