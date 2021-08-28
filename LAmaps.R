# project 2

# We install the ggmap package
# This only needs to be done ONE TIME.
# You will not need to do this again.
install.packages("ggmap")

# We load the ggmap.
# This needs to be done every time
# that you want to make a map.
library(ggmap)

# Now we load the information from the AirBnB data
# for the city of LONDON.
myDF <- read.csv("/class/datamine/data/airbnb/united-kingdom/england/london/2019-07-10/visualisations/listings.csv")

# Here are the first 6 lines of this file:
head(myDF)
# and the dimensions of the file:
dim(myDF)

# These are the longitudes and latitudes:
myDF$longitude
myDF$latitude

# Now we build a new data.frame containing
# only the longitudes and latitudes.
mypoints <- data.frame(lon=myDF$longitude,lat=myDF$latitude)

# use MY Google API key,
# so that we are able to load maps in Google.
register_google(key = "AIzaSyC478uTdS41ch9yTzfFEf4lchUgKt9VrZE", write = TRUE)

# In preparation for making a map,
# we get the center of LONDON from Google:
la_center = as.numeric(geocode("London"))
# Then we build a map of London
LAmap <- ggmap(get_googlemap(center=la_center,zoom=9))
# and we display it.
LAmap

# Finally, we add the points to the map
LAmap <- LAmap + geom_point(data=mypoints, size=0.1)
# and we display the map again.
LAmap
# One final remark:
# 3 locations are far enough away from the center
# of Los Angeles that they do not show up.

