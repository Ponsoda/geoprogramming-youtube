# There are mainly to ways to locate a country on a map if you don't have the lat long,
# geocoding or joining the data to a map by an attribute
# in the case of the geocoding, you will prob need an API to work with it


install.packages("devtools")
library(devtools)
library(sp)
library(rnaturalearth)

population_csv <- read.csv('https://datahub.io/JohnSnowLabs/population-figures-by-country/r/population-figures-by-country-csv.csv')

devtools::install_github("ropenscilabs/rnaturalearth")

ne_countries()

world_map <- ne_countries()

head(world_map)

world_map$admin

merged_map <-sp::merge(world_map, 
                       population_csv, 
                       by.x=c("adm0_a3"), 
                       by.y= c("Country_Code"),
                       duplicateGeoms = TRUE)

# we use the country code as it use to be more standard than the name, so we will
# have less issues during the join

spplot(merged_map, "Year_2007")
