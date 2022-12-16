#Hello and welcome to a new geoprogramming video
# today we will learn how to get data from an API and how to plot that data
# on a map

#first, we need a API with geospatial data
# I was looking that does not require apikey and I founded this one
# as you can see, this API returns a vector with information about flights
# we are gonna use a package to get the data of all the api
# the package is called jsonlite
# so, as always, first step is to install the package with
#install.packages("jsonlite")
# I already have it installed, so the second step is to load the library
library(jsonlite)

#and now, we will get the url, I will share it on the description, itis 'https://opensky-network.org/api/states/all?time=&icao24='
# let's see on the browser what does it return
#it does return a json with lot of information, which we can structure in a data frame
# let's load this data

data <- fromJSON('https://opensky-network.org/api/states/all?time=&icao24=')

head(data)

# if you see the result, it is returning two dimensions, the time and the states, we just want the second one 
# so we can take it like this
# we are gonna overwrite data with the states

data <- data[['states']]
head(data)

#now we can transform this data to a dataframe, I will use just few rows to make it easy to follow,

data_sample <- head(data, 5)

# I created a data sample of 5 rows
# let's create the data frame

df <- as.data.frame(data_sample)

class(df)
head(df)

# we have now the dataframe and we can work with it, but if yopu see the names of df, they are
# not really useful, so we can change them
# with colnames(df), we can see all the column names of the data frame, and we can also overwrite them
# we can use the same colnames that there are in the website

colnames(df) <- c('icao24','callsign','origin_country','time_position','last_contact','longitude',
                  'latitude','baro_altitude','on_ground','velocity','true_track','vertical_rate',
                  'sensors','geo_altitude','squawk','spi','position_source')

colnames(df)

#much better
# the last step will be to plot this airplanes using leaflet
# so lets install it
install.packages("leaflet")
library(leaflet)

# can we directly use leaflet with the lat and long coordinates? we cannot as those are strings
# you can try by yourself
# so let's transform those columns
# we will overwrite the dataframe with a new one with the only difference of this columns type


df <- transform(df, longitude = as.numeric(longitude), latitude = as.numeric(latitude)) 
# and now we can plot the airplanes (will plot just the first one as I wanna show you something else)
# to plot just the first one, we can take just the first row, like this
# the %>% are pipelines to "transport" the x element, if you remember from old videos
#the ~colName allows to select a column name of the dataframe,
# it is something like df$colName

m <-leaflet(df[1,]) %>%
  addTiles() %>%
  addMarkers(lng=~longitude, lat=~latitude)

m  

# here is our plane
# and one last cool trick
# with leaflet, we can add images to the markes,
#so, what if we add a plane as a icon?

airplaneicon <- makeIcon(
              
                iconUrl = "https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Plane_font_awesome.svg/1200px-Plane_font_awesome.svg.png",
                iconWidth = 70,
                iconHeight = 70,
                iconAnchorX = 70,
                iconAnchorY = 70
)

# and now we can add the icon to the marker

m <-leaflet(df[1,]) %>%
  addTiles() %>%
  addMarkers(lng=~longitude, lat=~latitude, icon = airplaneicon)

m  

# this is all for today, hope you enjoyed the video
# keep programming
