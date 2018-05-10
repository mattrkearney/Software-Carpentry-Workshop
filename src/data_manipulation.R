# Data Structures

#make a data frame

cats <- data.frame(coat = c("calico", "black", "tabby"),
                   weight = c(2.1,5.0,3.2),
                   likes_string = c(1,0,1))

cats

cats$weight

cats$coat

cats$weight + 2

cats$weight + cats$coat

class(cats$weight)
class(cats$coat)

structure(cats)
str(cats)

#change order of factors
cats$coat_reorder <- factor(x = cats$coat, 
                            levels = c("tabby", "calico", "black"),
                            ordered = TRUE)
str(cats$coat_reorder)
levels(cats$coat_reorder)

write.csv(x = cats, file = "data/feline_data.csv")


# Exploring Data Frames

# read in data
gap <- read.csv(file = "data/gapminder-FiveYearData.csv")
cats <- read.csv(file = "data/feline_data.csv")

head(gap)
str(gap)

nrow(gap)
ncol(gap)
dim(gap)

colnames(gap)

# subsetting data
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c("a", "b", "c", "d", "e")
x

x[1]
x["c"]

# slices
x[c(1, 3)]
x[1:4]
x[-2]
x[-(2:4)]

# subsetting gapminder data

head(gap[1])
head(gap$pop)
head(gap["pop"])

head(gap[, 1]) # subset by columm
gap[3,] # subset by row

gap[138, ]

albania <- gap[13:24, 3:6]

afghanistan <- gap[1:12, ]
afghanistan$gdp <- (afghanistan$pop * afghanistan$gdpPercap)
write.csv(x = afghanistan, file = "results/afghanistan.csv")

class(afghanistan$gdp)
