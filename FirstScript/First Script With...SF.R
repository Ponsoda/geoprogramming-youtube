# Welcome to a new First Script with...SF package
# First step is to install the package with
install.packages("sf")
# In my case I already have install it so we need to charge the library
library(sf)
# We can check the library using ?
?sf
#And also check the methods of the class
methods(class="sf")

#If you check those methods, there are a lot starting with st_
# This is because they are using the WKT (Well Known Text) for geometry
# I will keep some links about this, and in case you are interested, we can do a video about it

# for example, to create a point 
st_point(1:2)

# It needs to have the sequence of numbers, and it can be added in many ways, for example

st_point(c(1:2))

# or we can create a linestring

ls = st_linestring(rbind(c(2,2), c(3,3), c(3,2)))

# and, of course, we can plot all those geometries

plot(ls)

# to use the geometries in sf, we need to convert them to st using one of the methods

st_sfc(st_point(1:2))

# now, we are gonna see an example of sf. We are gonna use the shp included in the package

nc <- st_read(system.file("shape/nc.shp", package="sf"))


# now we have the nc object, it contains many infor as well as multipoligons

print(nc, n=3)

summary(nc)

# We can plot specific attributes

plot(nc["NAME"])

# let´s plot now a numerical attribute

plot(nc["AREA"])

# It directly understand which type of data is it using

nc["NAME"]
nc["AREA"]
 #We can, of course, plot all at the same tyme

plot(nc)

# or plot just the geometry 

plot(nc$geometry)

# Finally, let´s check some methods
# for the method st_area, first we need to install another library, in my case I already have it
#it´s library(lwgeom)

st_area(st_geometry(nc))

#here you can see the area in m2

#We can also plot the geometry unified  
plot(st_union(nc))

#Get the centroids

plot(st_centroid(st_geometry(nc)), col="red")
plot(st_geometry(nc), add=TRUE)

# and even create a buffer

plot(st_buffer(st_geometry(nc), 0.2))

# That is all for this video, thank you for watching
