# Hello and welcome to a new geoprogramming video, this time we will have a 
# first script with...tmap
# this is one of the best r packages for spatial data visualization
# it use a similar workflow than ggplot (in case someone already use it)
# let's start

# as always, the first step will be to install the package

install.packages("tmap")

# I have it already installed so, next step, charge the  library

library(tmap)

# as you know, I always wanted the data to be included in the video/script
# this time, we will use a dataset included in the package called World
# we can load it by using 

data("World")

# as you can see, it is loaded to the enviorment
# and we can start checking the package

# fist we load the shape with , but we need to define also the layer 
# the tm_shape is "just" helping to point the data

tm_shape(World) +
  tm_polygons("pop_est_dens")

# as you can see, the package is directly creatting a cohroplete map 
# with the variable that we passed to it, but the breaks are not the best
# in this case. Let's modify that. TO do so, we use a different function
# we create the breaks with a list of values. My bad here.
# this looks much better now

tm_shape(World) +
  tm_fill("pop_est_dens", 
          breaks = c(0, 30, 60, 90, 120, 500, 1000, Inf))

# we can also change the tile to the legend

tm_shape(World) +
  tm_fill("pop_est_dens", 
          title = "World density map",
          breaks = c(0, 30, 60, 90, 120, 500, 1000, Inf)) +
  tm_borders()

# and we can also to add borders

# What if we wanna make this map dinamic??
# we just need to enable it, by using

tmap_mode("view")

#and if we run again the map, we will get a dynamic map

# now we got labels and pop up in the map, so our last task will be to
# make some custom popups

# first, to change the labels, we need to set the id
# this will also appear on top of the popup as title
# we can change it by using the id and adding the variable that we wanna
# use as ID, in our case, we are gonna use the name

tm_shape(World) +
  tm_fill("pop_est_dens", 
          title = "World density map",
          breaks = c(0, 30, 60, 90, 120, 500, 1000, Inf),
          id = "name") +
  tm_borders()

# here it is.
# finally, we are gonna use the popup.vars to create a custom popup
# we need to add the title "title we want" = "variable name"
# remember that we need to pass it always as list c()
# and that you can add many fields spliting using a coma ","

tm_shape(World) +
  tm_fill("pop_est_dens", 
          title = "World density map",
          breaks = c(0, 30, 60, 90, 120, 500, 1000, Inf),
          id = "name",
          popup.vars = c("Name" = "name", "ISO3" = "iso_a3", "Pop density" = "pop_est_dens")) +
  tm_borders()


# and that is all for today, this is a really complete package with many
# functions so we will probably have more videos on tmap
# than you for watching this geoprogramming vide
# see you!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
