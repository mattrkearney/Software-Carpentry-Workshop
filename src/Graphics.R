# conditional statements

number <- 37
if (number > 100){
  print("greater than 100")
}else {
  print("less than 100")
}
print("finished checking")

# comparison operators

# greater than >
# less than <
# equal to ==
# not equal to !=
# greater than or equal to >=
# less than or eaual to <=

number <- -3
if (number > 0){
  print(1)
} else if(number < 0){
  print(-1)
} else{
  print(0)
}

# and

number1 <- -15
number2 <- -40 

if(number1 >= 0 & number2 >= 0){
  print("both numbers are positive")
} else{
  print("at least one number is negative")
}

# or

if(number1 >= 0 | number2 >= 0){
  print("at lease one number is positive")
} else{
  print("both numbers are negative")
}


# creating and using functions

fahr_to_kelvin <- function(temp){
  kelvin <- ((temp - 32) * (5 / 9)) + 273.15
  return(kelvin)
}

fahr_to_kelvin(32) # freezing point
fahr_to_kelvin(212) # boiling point

kelvin_to_celcius <- function(temp){
  celcius <- temp - 273.15
  return(celcius)
}

kelvin_to_celcius(0)

# variable scope

# mixing and match

fahr_to_celcius <- function(temp){
  temp_k <- fahr_to_kelvin(temp)
  temp_c <- kelvin_to_celcius(temp_k)
  return(temp_c)
}

fahr_to_celcius(32)
fahr_to_celcius(212)

# nesting functions
kelvin_to_celcius(fahr_to_kelvin(32))

celcius_to_farh <- function(temp){
  fahr <- (temp * 9 / 5 + 32)
  return(fahr)
}

celcius_to_farh(0)
celcius_to_farh(100)



# Graphics ----------------------------------------------------------------

# read in data
gap <- read.csv(file = "data/gapminder-FiveYearData.csv")
head(gap)
str(gap)

plot(x = gap$gdpPercap, y = gap$lifeExp)

ggplot(data = gap, aes(x = year, y = lifeExp)) + 
  geom_point()

ggplot(data = gap, aes(x = year, y = lifeExp, by = country)) +
  geom_line(aes(color = continent)) +
  geom_point(color = "blue")

ggplot(data = gap, aes(x = gdpPercap, y = lifeExp)) + 
  scale_x_log10() +
  geom_point(alpha = .5) + 
  geom_smooth(method = "lm") +
  theme_bw() +
  ggtitle("Effects of per capita GDP on life expectancy") +
  xlab("GDP per capita ($)") +
  ylab("Life expecancy (Yrs)")

ggsave(file = "results/life_expectancy.pdf")

# faceting

ggplot(data = gap, aes(x = gap$gdpPercap, y = gap$lifeExp, color = continent)) +
  geom_point() +
  scale_x_log10() +
  geom_smooth(method = "lm") +
  facet_wrap(~year)