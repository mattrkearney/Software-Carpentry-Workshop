##### Data Manipulation #####

# Make sure packages are installed
install.packages(c("tidyr", "dplyr", "knitr", "rmarkdown", "formatR"))

library(dplyr) # Needed for subsetting data
library(tidyr) # Needed for reshaping data
library(ggplot2) # Needed for graphing

# Read in our dataset
gap <- read.csv(file = "data/gapminder-FiveYearData.csv")

##### dplyr #####

head(gap)

yr_country_gdp <- select(gap, year, country, gdpPercap)
head(yr_country_gdp)

yr_country_gdp <- gap %>% select(year, country, gdpPercap)
head(yr_country_gdp)

yr_country_gdp_eu <- gap %>% 
  filter(continent == "Europe") %>%
  select(year, country, gdpPercap)

yr_country_gdp_eu <- select(filter(gap, continent == "Europe"), year, country, gdpPercap)

Africa_07 <- gap %>% 
  filter(continent == "Africa", year == 2007) %>%
  select(year, country, lifeExp)

str(Africa_07)

mean_gdp <- gap %>%
  summarize(meanGDP = mean(gdpPercap))

mean(gap$gdpPercap)
mean_gdp

gdp_by_cont <- gap %>%
  group_by(continent) %>%
  summarize(meanGDP = mean(gdpPercap))
gdp_by_cont

gdp_by_cont <- gap %>%
  group_by(continent, year) %>%
  summarize(meanGDP = mean(gdpPercap),
            sd_gdp = sd(gdpPercap),
            mean_pop = mean(pop),
            sample_size = n()
            )

gdp_by_cont %>%
  data.frame() %>%
  head()

gdp_by_cont %>%
  ggplot(aes(x = mean_pop, y = meanGDP, color = continent)) +
  geom_point() 
 

bill_gdp <- gap %>%
  filter(year == 2007) %>%
  mutate(billGDP = gdpPercap * pop / 10^9)

head(bill_gdp)

gap_wide <- read.csv(file = "data/gapminder_wide.csv")

str(gap_wide)

gap_long <- gap_wide %>%
  gather(obstype_year, obs_values, starts_with('pop'), starts_with('lifeExp'), starts_with('gdpPercap'))

gap_long <- gap_long %>%
  separate(obstype_year, into = c("obs_type", "year"),
           sep = "_")

head(gap_long)
str(gap_long)

wide <- gap_long %>%
  unite(var_names, obs_type, year, sep = "_") %>%
  spread(var_names, obs_values)

head(wide)


# Databases in R ----------------------------------------------------------

install.packages("RSQLite")
library(RSQLite)
library(DBI)

conn <- dbConnect(drv = SQLite(), dbname = "data/survey.db")

dbListTables(conn)
dbListFields(conn, "Survey")

coords <- dbGetQuery(conn, "SELECT lat, long FROM Site")
coords

joined <- dbGetQuery(conn, "SELECT Site.lat, Site.long, Visited.dated, Survey.quant, Survey.reading 
                            FROM Site JOIN Visited JOIN Survey
                            ON Site.name = Visited.Site
                            AND Visited.id = Survey.taken;")
joined

library(dplyr)
install.packages("dbplyr")
library(dbplyr)

tbl(conn, "Survey") %>%
  select(person, quant, reading) %>%
  filter(quant == "sal") %>%
  collect() %>%
  ggplot(aes(x = person, y = reading)) +
  geom_boxplot()
