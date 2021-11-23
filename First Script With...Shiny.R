Hello and welcome to a new geoprogramming video
We are gonna learn today how to create an eassy shiny app with leaflet

# step 1, load the libraries

# using install.packages(), you need to install maps, leaflet, dplyr and shiny

install.packages("maps")
# will not install them as I already have them
# and then load those libraries

library(maps)
library(leaflet)
library(dplyr)
library(shiny)
# I really need to update my R version :)

#now we are gonna get some data from the maps package
data(world.cities)
# as you see it is a promise now, we can load it by simply

world.cities
head(world.cities)

#so we have name, country, pop, location and if it is capital
# we are gonna plot it on leaflet and filter by country and population
# to filter the data we are gonna use pipelines
# %>%, which kind of transport the x parameter to the next function
# and the filter function from dplyr
# also remember that we use the package::function to point specific function
# and avoid conflicts
# the ~ is for the function to understand that it is not an object but an
#attribute of the x parameter
#let's filter now by population too
# we have our base for our shiny app
# let's now add the shiny app code (not best practice but good way if you are learning)


leaflet(world.cities %>%
          dplyr::filter(
            country.etc == "Poland",
            pop > 100000
          )) %>%
  addTiles() %>%
  addMarkers(lat = ~lat, lng=~long)

# I will add some documentation, but basically with shiny you have a User Interface (ui)
# with the inputs and the ooutputs (that you define on the server function)
# to plot a map we need to create a map input on ui

ui <- fluidPage(
  leafletOutput("mymap")
)

# and stablish the "back" part in the server
# mymap is the id of the ui that we can use in the server
# and inside render leaflet we are gonna add the code we prepared before

server <- function(input, output, session) {
  
  output$mymap <- renderLeaflet({
    
    leaflet(world.cities %>%
              dplyr::filter(
                country.etc == "Poland",
                pop > 100000
              )) %>%
      addTiles() %>%
      addMarkers(lat = ~lat, lng=~long)
    
    
  })
  
  
}

# finally, we need to call the shinyapp function with the ui and server as arguments

shinyApp(ui, server)

# sorry, I did not remembered that it cames in a new window
# here we have our really basic shiny app
# we can add now more elements here


# let's add title and inputs elements
# will keep the documentation in the description cause there is a lot to do here,
# just showing the basics, maybe we can do a second video with more complex stuff
# something went wrong


ui <- fluidPage(
  titlePanel("My first shiny app"),
  leafletOutput("mymap"),
  fluidRow(column(2, 
                  sliderInput("slider1", h3("Select the population"),
                              min = 0, max = 1000000, value = 100000),
            # here the slider allows to keep a max, min and a set value to start the app with
                  radioButtons("radio", h3("Select the country"),
                               choices = list("Poland" = "Poland", "Norway" = "Norway",
                                              "Belgium"="Belgium"), selected = "Poland")
            # and here the rado button allows to add a list with the element it will contain
            # in this case Poland contains Poland but it can contain 1, that depends on 
            # your attributes, and also you have the selected one like in the case of the value
            # there are a lot of options so if you are interested just keep checking
            # see you
           )
)
)


server <- function(input, output, session) {
  
  output$mymap <- renderLeaflet({
    
    leaflet(world.cities %>%
              dplyr::filter(
                country.etc == input$radio,
                pop > input$slider1
              )) %>%
      addTiles() %>%
      addMarkers(lat = ~lat, lng=~long)
    
    
  })
  
  
}

# finally, we need to call the shinyapp function with the ui and server as arguments

shinyApp(ui, server)

# it took a while but it was just a bracked
# as you can see, the app is now responsive
# lets add also a country control to finish this practice
# almost forgot that we need to add it as input

# that is mainly all for today, just wanna add some comments for the people interested on shiny
