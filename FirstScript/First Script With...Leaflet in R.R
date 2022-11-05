#Welcome to a new geoprogramming video
# Today we will create our first script with...leaflet in R!!!!!!!
#Let's see how we can create a fancy map 
#As always, first step, we need to install the package, remember to use the "" in the instalation
install.packages("leaflet")

# second step will be to load the library, waiting the process to be finished... cool
# this means that I should update the r version hehehe, but we can keep our way

library(leaflet)

# let´s create an empty map with the new library, literally empty

empty_map <- leaflet()
empty_map 
# we need to add some tiles

map_with_tiles <- addTiles(empty_map) #default tiles from OSM, we had pass our empty map as parameter here

map_with_tiles

# now we have our interactive map, thank you for watching....just joking, let´s add some markers

map_with_tiles_and_markers <- addMarkers(map_with_tiles, lng=88.3639, lat=22.5726)
map_with_tiles_and_markers

#another marker? why not
map_with_tiles_and_markers <- addMarkers(map_with_tiles, lng=88.42, lat=24)
map_with_tiles_and_markers

#why we just have one????
# it is because we need to use the map_with_tiles , if we create a new one as the case of
# map_with_tiles_and_markers, we are oveerwritting it

map_with_tiles <- addMarkers(map_with_tiles, lng=88.3639, lat=22.5726)
map_with_tiles <- addMarkers(map_with_tiles, lng=88.42, lat=24)

map_with_tiles

# here we go, lets overwrithe the tiles map to have it blank again an try more things

map_with_tiles <- addTiles(empty_map) #default tiles from OSM

#add popup, remember that you need to plot the map each time to see what did you added
map_with_tiles <- addMarkers(map_with_tiles, lng=88.38, lat=22.60, popup="Popup: Welcome to GeoProgramming")
map_with_tiles
# now we wanna add a label, remember that you can allways check the documentation
?addMarkers
# my bad

#add label
map_with_tiles <- addMarkers(map_with_tiles, lng=88.40, lat=22.62, label ="Label: Welcome to GeoProgramming")
map_with_tiles


# we also can add an icon as a marker, I tooked one png image from the leaflet official website,
# I will keep the link in the description

map_with_tiles <-addMarkers(map_with_tiles, 
                            lng=88.42, lat=22.62, 
                            icon =  makeIcon(iconUrl = "https://leafletjs.com/examples/custom-icons/leaf-green.png"))

map_with_tiles

# we need to use the function make icon to pass the url to them, there are many 
# thing that you can control to the icon, check them with ?makeIcon

# we can also create circles instead of png, but it is difficult to see,
# let's increase the radius, now it is visible

map_with_tiles <-addCircles(map_with_tiles, lng=88.45, lat=22.70, radius = 5000)
map_with_tiles

# and to finish, what if we get all togheter and we create a layer controler?
# sounds great for a first season right? let´s do it

# let's get a blank map again and to add to different tiles to have also the option of change them

empty_map <- leaflet()
empty_map 

map_with_tiles <- addTiles(empty_map, group = "OSM") #default tiles from OSM
map_with_tiles
# to add a control layer, we need to group all the elements, in this case we can add any name we want
# I used OSM to the default tiles
map_with_tiles <- addProviderTiles(map_with_tiles, 
                                   providers$Stamen.Toner, group = "Toner")
map_with_tiles

# now let´s add the different markers we had created in this tutorial

map_with_tiles <- addMarkers(map_with_tiles, 
                             lng=88.42, lat=24,
                             group = "regular")

map_with_tiles

map_with_tiles <-addMarkers(map_with_tiles, 
                            lng=88.42, lat=22.62, 
                            icon =  makeIcon(iconUrl = "https://leafletjs.com/examples/custom-icons/leaf-green.png"),
                            group = "leaf")
map_with_tiles
map_with_tiles <-addCircles(map_with_tiles, 
                            lng=88.45, lat=22.70,
                            radius = 5000, group="circle")

map_with_tiles

# and now, we can create the controler

map_with_tiles <- addLayersControl(map_with_tiles,
                                   baseGroups = c("OSM (default)", "Toner"),
                                   overlayGroups = c("regular", "leaf", "circle"),
                                   options = layersControlOptions(collapsed = FALSE)
)

# as always, we add this controler to the map_with_tiles, and save in the map_with_tiles,
# we create the base (tiles) with the different groups, remember that if there is more
# than one we need to use the vector c("a","b") to get all of them
# and the same for the overlayGroups (layers), let´s plot it, I didn't run the addLayersControl lines
# did I?

map_with_tiles

# and that is all for now, thank you for watching our videos, see you in another geoprogramming video!!!!!!!!!!!!!!!!!!!
