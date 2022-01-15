# Hello and welcome to a new geoprogramming video
# now that we now how to get data from an API (check last video)
# we are gonna feed an shiny app with this api data
# the first step will be to load the required libraries
# (remember to use install.packages("packagename") if it is not installed year in your R)
library(jsonlite)
library(leaflet)
library(shiny)

# now we create the two parts of the shiny app (ui and server)
# you also have annother video on this

ui <- fluidPage(
  
  leafletOutput("mymap")
  #our only output will be a leaflet map
  
)

server <- function (input, output, session){
  
  # first we have a function to get the new observations
  
  get_general_data <-function(){
    
    # we are gonna get the data from an api of worldwide flights, will keep that in the description
    # and we will get just the first column
    vector_data <- as.data.frame(fromJSON('https://opensky-network.org/api/states/all?time=&icao24=')[['states']])[1,]
    # again, you can see all this process in the last video, we will do that for a "static" map
    
    colnames(vector_data) <- c('icao24','callsign','origin_country','time_position','last_contact','longitude',
                               'latitude','baro_altitude','on_ground','velocity','true_track','vertical_rate',
                               'sensors','geo_altitude','squawk','spi','position_source')
    
    vector_data <- vector_data %>%
      transform(longitude = as.numeric(longitude),
                latitude = as.numeric(latitude))
    
    vector_data <-vector_data[1:17]
    return(vector_data)
    
  }
  
  # and now we have our function to get the data from the api,
  # the next step will be to make it automatically refreshed
  # the first step is to initialize the data
  
  general_data <<- get_general_data()
  
  # now we create a function to update the new data that we get
  
  update_data <- function(){
    general_data <<- rbind(get_general_data(), general_data)
  }
  
  # and we stablish all the elements to plot the map on the app
  # first we add our custom icon
  
  airplaneIcon <- makeIcon(
    iconUrl = "https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Plane_font_awesome.svg/1200px-Plane_font_awesome.svg.png",
    iconWidth = 70, iconHeight = 70,
    iconAnchorX = 70, iconAnchorY = 70
  )
  
  # and we define the output, adding all the functions that we had created to make
  # it automatically renewed
  # we use invalid later to set how many time has to take the app to reaload the data
  output$mymap <- renderLeaflet({
    invalidateLater(10000, session)
    update_data()
    leaflet(general_data) %>%
      addTiles() %>%
      addMarkers(lng=~longitude, lat=~latitude, icon=airplaneIcon)
  })
  
  
}


# if all is correct, the application shall work as expected
# so let's iniciate it

shinyApp(ui, server)

# okay, I had found the issues,1 was the name of the fluidPage and I was using fluidpage
# was also using the [1,] to get the first row inside the (), so it was doing something else
# and finally I was using & instead of $ for the output
# but now seems that it is finally working fine, let's see

# it is far than perfect, but it can provide you which are the basic ideas to
# create automatic shiny apps
# thank you for watchinggg