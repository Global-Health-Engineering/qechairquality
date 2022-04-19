# Description -------------------------------------------------------------

# This R script prepares a map of the air quality sensor locations.

# Code --------------------------------------------------------------------

## load libraries

library(dplyr)
library(leaflet)
library(mapview)

## prep map

## icons
#icons <- awesomeIcons(
#  icon = 'close-outline',
#  iconColor = 'black',
#  library = 'ion',
#  markerColor = "blue"
#)



map_hosptal_blantyre <- leaflet() %>% 
  setView(lng = 35.021831999805755, 
          lat = -15.803069709021687,
          zoom = 17) %>% 
  addTiles() %>% 

  #addProviderTiles(providers$Stamen.Toner) %>% 
  addAwesomeMarkers(lng = 35.018831999805755, 
             lat = -15.803069709021687,
             label = "Guardian",
             #icon = icons,  
             labelOptions = labelOptions(noHide = T,
                                         textsize = "15px",
                                         direction = "bottom",
                                         style = list(
                                           "box-shadow" = "3px 3px rgba(0,0,0,0.25)",
                                           "border-color" = "rgba(0,0,0,0.5)",
                                           "font-style" = "italic"
                                         )))

