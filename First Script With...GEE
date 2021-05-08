//Welcome to a new geoprogramming video , this time we will have a new script video for..
//any clue?... google earth engine
//The first step in this case is to register in the platform, you will fill a form and
// within little time you will be able to access to the platform and to the code console
// the page you can see now (I will keep the page for the registration in the description)
//Let´start
//This is a "simple" js console, so you can do js stuff

print("Welcome to Georpogramming");

//and you can see on the right the results when you run the code
//today we will learn how to get an image from the catalog, calculate ndvi and get that value
// using a marker.

//Let´s first  check the catalog, we want to look for the landsat 8 collection
// now we have this huge collection. Cannot even print it so let´s filter it
//there are different ways to filter, in this case we are gonna filter by date (start end date)
//let´s print it again

var image_collection = ee.ImageCollection("LANDSAT/LC08/C01/T1_SR")
                        .filterDate('2020-01-01', '2020-01-12');
//print(image_collection);

//you can see now the object, which contains 3033 elements (images). We are gonna take the 
//first one for our ndvi analisis

var image = image_collection.first()
print(image)

//Now we have an image with the 11 bands, we can plot it on the map now
//we get the Map object, that is already defined in this enviorment, and we add the layer image

//Map.addLayer(image);

//it cames here but we didn´t center the map, so let´s do that to avoid the extra step
//of finding the image we had ploot (and we will also add some zoom)

Map.centerObject(image, 9);

// it is comming as layer 1, can we change that name? yes we can. I will explain you the {} later

//Map.addLayer(image, {},'Landsat_Image');

//we want to calculate the ndvi, so we need to create a function, remember that for
//landsat 8, ndvi is the difference between bands 5 and 4

var getNDVI = function(image) {
  return image.normalizedDifference(['B5', 'B4']);
};

//we had just defined the function, so we can pass the image

var ndvi = getNDVI(image)

//and now we can plot the NDVI

//Map.addLayer(ndvi, {}, 'NDVI image')

//The image is here, but we need some...color?
//remember the {}, you can add parameters there, so we can get values from 1 to -1 and
//add a palette. This are the parameters that we are gona use

var ndviParams = {min: -1, max: 1, palette: ['blue', 'white', 'green']};

//now it looks much better, you can use different palettes to make this look fancier
//and remember that you can also filter the % of clouds in for the collection



Map.addLayer(ndvi,ndviParams, 'NDVI image with params')

//finally, let´s get the ndvi values for a specific point with a marker.

//we create our marker as a geometry, and now we can get the value with one function
//called reduce region. We need reducer type, geometry and scale of the reduction
//something like number of pixels to calculate the mean

var get_value = ndvi.reduceRegion(ee.Reducer.first(), point, 30)

print(get_value)

//and here we will get the value of ndvi for the point
//that is all for this tutorial, thank you for watching!!!!!!!!!!!!!!!!!!!!
