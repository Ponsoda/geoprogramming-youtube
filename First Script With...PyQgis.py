# Welcome to a new geoprogramming video 
# today we will have our first script with pyQgis
# we will learn how to import a shapefile and how to make a selection and a field calculation
# the first goal will be to import the layer
#to do so, let´s get the path
# we will use a european rivers layer (will keep it in the description)
# the source I mean
# I already have it downloaded and it is save it on C, so
layer_path = "C:\wise_large_rivers\Large_rivers.shp"
layer_path
'C:\\wise_large_rivers\\Large_rivers.shp'
#Let's also define the layer name
layer_name = "rivers"
#♦ and let´s load it using qgis vector layer to define and then the addMapLayer
vlayer = QgsVectorLayer(layer_path, layer_name, "ogr")
vlayer
<QgsMapLayer: 'rivers' (ogr)>
#now we have our MapLayerAction
# to load the layer, we can use the follow comand
QgsProject.instance().addMapLayer(vlayer)
<QgsMapLayer: 'rivers' (ogr)>
#and here it is., we have the layer
# we can use the iface to select elements of the layer
layer = iface.activeLayer()
layer.selectAll()
# and all are selected
layer.removeSelection()
#and all unselected
# or also we can use conditional selections
layer.selectByExpression("Shape_Leng" > 1000000)
Traceback (most recent call last):
  File "C:\OSGEO4~1\apps\Python37\lib\code.py", line 90, in runcode
    exec(code, self.locals)
  File "<input>", line 1, in <module>
TypeError: '>' not supported between instances of 'str' and 'int'
layer.selectByExpression("Shape_Leng" > "1000000")
Traceback (most recent call last):
  File "C:\OSGEO4~1\apps\Python37\lib\code.py", line 90, in runcode
    exec(code, self.locals)
  File "<input>", line 1, in <module>
TypeError: QgsVectorLayer.selectByExpression(): argument 1 has unexpected type 'bool'
layer.selectByExpression('"Shape_Leng" > 1000000')
# remember to use the single cuotes to wrap the sentece ('your sentence')
layer.removeSelection()
# finally, we will learn how to create a new field and how to populate it
# the first part is populate it
#Create the field I mean
# we can do that by using a data provider
data_pr = vlayer.dataProvider()
data_pr.addAttributes([QgsField('len_km', QVariant.Double)])
True
vlayer.updateFields()
# this part is a bit complex, I will keep some code examples to you to understand it, but let´s try to split it in a logic way
# first we need the expression 
expression = QgsExpression('"Shape_Leng"/1000')
# then it is needed to create a context for the function
context  = QgsExpressionContext()
context.appendScopes(QgsExpressionConntextUtils.globalProjectLayerScopes(vlayer))
Traceback (most recent call last):
  File "C:\OSGEO4~1\apps\Python37\lib\code.py", line 90, in runcode
    exec(code, self.locals)
  File "<input>", line 1, in <module>
NameError: name 'QgsExpressionConntextUtils' is not defined
context.appendScopes(QgsExpressionContextUtils.globalProjectLayerScopes(vlayer))
# and finally, we need to loop the vlayer to edit it, get the features from the layer, apply the expression and then, update the feature
# step by step it looks like thishost
with edit(vlayer):
	for f in vlayer.getFeatures():
		context.setFeature(f)
f['len_km'] = expression.evaluate(context)

# this codes with different locations is better to create it outside and then copypaste, so let's do that
with edit(vlayer):
  for f in vlayer.getFeatures():
    contexxt.setFeature(f)
    f['len_km'] = expression.evaluate(context)
   vlayer.updateFeature(f)
  
#iteration problem again
with edit(vlayer):
	for f in vlayer.getFeatures():
		contexxt.setFeature(f)
Traceback (most recent call last):
  File "C:\OSGEO4~1\apps\Python37\lib\code.py", line 90, in runcode
    exec(code, self.locals)
  File "<input>", line 3, in <module>
NameError: name 'contexxt' is not defined
with edit(vlayer):
	for f in vlayer.getFeatures():
		 context.setFeature(f)
		f['len_km'] = expression.evaluate(context)

# one last  try

with edit(vlayer):
    for f in vlayer.getFeatures():
        context.setFeature(f)
        f['len_km'] = expression.evaluate(context)
    vlayer.updateFeature(f)

with edit(vlayer):
    for f in vlayer.getFeatures():
        context.setFeature(f)
        f['len_km'] = expression.evaluate(context)
	    vlayer.updateFeature(f)
      
# if you understand what happend here, it has just updated one of the fields as we did it in a wrong order
# if we fix that it should work this time
with edit(vlayer):
    for f in vlayer.getFeatures():
        context.setFeature(f)
        f['len_km'] = expression.evaluate(context)
        vlayer.updateFeature(f)

# and that it´s it
# we found a real problem and we check how to solve it on the video
# that is all for today, thank you for watch geoprogramming videos
