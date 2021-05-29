# Hello and welcome back to a new geoprogramming video
# This time, we will create our First Script with...Raster
# it is a popular R package to manage raster information and way more
# here we will see some basic functions for a raster

# as allways, first step, install the package. You need to use the "" for the 
# instal the package. and now load it
# it will be necessary also to install install.packages("rgdal") so you
# can do it now

library(raster)

# ones we load the library, we are gonna load a raster with raster()
# from local it would be something like this, but as raster allow us
# to use directly data from a url, we need to add the "virtual" directory

dem <-raster('/vsicurl/http://dl.maptools.org/dl/geotiff/samples/made_up/bogota.tif')

dem

#and we have a raster layer load.
summary(dem)
# we can check a summary of its only value
# I will apply several function to this raster, some of then not make fully
# sense based on the type of raster, but understand that it is just to
# show you some funtions of the package
# okay, now we can change the projection of the raster

# but first let´s plot it and we will see the difference

plot(dem)

projection <-  "+proj=utm +zone=19 +datum=NAD83 +units=m +no_defs +ellps=GRS80
+towgs84=0,0,0 "

# we define a projection, and we add it using 
# we have a new rayer layer called dem_utm, with a new projection
# let´s plot it

dem_utm <- projectRaster(dem, crs= projection)

plot(dem_utm)

# in this case is almost the same, but got the point right?

# you can also check max and min values. and do some maps algebra

setMinMax(dem*50)

# what elsee
# we can plot an histogram

hist(dem)
#check the crs
crs(dem)
# and the extension of the raster
extent(dem)

# about the plot, we can change the colors, or add title

plot(dem, col=terrain.colors(30), main= "Bogota Raster")

# there is another type of plot  in the package, the spplot

spplot(dem)

# it is fancy, isn´t it?

# and you can use the terrain function to  calculate parameters like
# slope and aspect, 

slope <- terrain(dem, opt="slope")

# same for aspect
aspect <-terrain(dem, opt="aspect")

plot(slope)

#you can combine both

plot(slope + aspect)

# calculate hillside

hillSh <- hillShade(slope, aspect)

plot(hillSh)

# and if you wanna convert the raster to vector, you can reclassify the values

rc <- reclassify(dem, c(-Inf,50,1, 50,150,2, 150,Inf,3))
plot(rc)

# I will keep the functions to do so, but are a bit time consuming
# so take care with them, we are not gonna run them here

# rtc <- rasterToContour(rc)
# rtp <-rasterToPolygons(rc)

# and to finish, we can show different rasters in the same plot

# first, we need to configure the plot exit

par(mfrow=c(3,2))

# and now we can add plots

plot(slope, main= "Slope raster")

plot(aspect, main= "Aspect raster")

hist(slope)
hist(aspect)

boxplot(slope)
boxplot(aspect)

# this is all for today, than you for watch geoprogramming!!!!!!!!!!!!!!!!
