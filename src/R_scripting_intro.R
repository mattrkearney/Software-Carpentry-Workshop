library(gapminder)
library(ggplot2)
library(dplyr)
library(ProjectTemplate)

53 + 23
53 +
  23  

3 + 5 * 2
(3 + 5) * 2


log(1) # natural logarithm
log10(10) # base-10 logarithm
exp(0.5) # exponent

# variable assignment
x <- 1/40
x

log(x)

x <- 100

x <- x + 1
x

y <- x * 2
y

# naming
# periods.between.words
# underscored_between_words
# camelCaseToSeparateWords

# can't
# start with a number
# spacing


# running a code chunk
mass <- 47.5
age <- 122
mass <- mass * 2.3
age <- age - 20
mass
age

# vectorization
1:5

2^(1:5)

x <- 1:4
y <- 5:8

x + y

# manage our environment
ls()

rm(age)
ls()

rm(list = ls())
ls()

# R packages
installed.packages()

update.packages("packagename")

install.packages("gapminder")

library(gapminder)


# getting help
help(ls)
?ls
?rm

# fuzzy search
??read.ta

vignette()
vignette("ggplot2-specs")

# stackoverflow
?dput
sessionInfo()

