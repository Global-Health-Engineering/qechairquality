# Description -------------------------------------------------------------

# This R script prepares a map of the air quality sensor locations.

# Code --------------------------------------------------------------------

## load libraries

library(dplyr)
library(leaflet)
library(mapview)

## read data

locations <- readr::read_csv("data/raw/sensor-locations/sensor-locations.csv")

# Create a fire icon
# Icon from: https://github.com/apancik/public-domain-icons/blob/master/dist/symbol%20fire.svg

fire_icon <- makeIcon(iconUrl = "img/symbol-fire.png", 
                  iconWidth = 50, 
                  iconHeight = 50)

# Create a palette that maps factor levels to colors
pal <- colorFactor(c("#EE4B2B", "navy"), domain = c("sensor", "fire"))

fire_loc <- locations %>% 
  filter(type == "fire")

sensor_loc <- locations %>% 
  filter(type == "sensor")

leaflet(sensor_loc) %>% 
  setView(lng = 35.021431999805755, 
          lat = -15.803069709021687,
          zoom = 18) %>% 
  #addProviderTiles(providers$Stamen) %>% 
  addTiles() %>% 
  addMarkers(
    lng = fire_loc$long, 
    lat = fire_loc$lat,
    label = fire_loc$location,
    icon = ~fire_icon,
    labelOptions = labelOptions(noHide = T,
                                textsize = "15px",
                                direction = "bottom",
                                offset = c(0, 20),
                                style = list(
                                  "box-shadow" = "3px 3px rgba(0,0,0,0.25)",
                                  "border-color" = "rgba(0,0,0,0.5)"
                                  #"font-style" = "italic"
                                ))
    ) %>% 
  addCircleMarkers(
    lng = ~long, 
    lat = ~lat,
    label = ~location,
    radius = 16,
    stroke = FALSE,
    fillOpacity = 1,
    color = ~pal(type),
    #icon = ~fire_icon,  
    labelOptions = labelOptions(noHide = T,
                                textsize = "15px",
                                direction = "bottom",
                                offset = c(0, 10),
                                style = list(
                                  "box-shadow" = "3px 3px rgba(0,0,0,0.25)",
                                  "border-color" = "rgba(0,0,0,0.5)"
                                  #"font-style" = "italic"
                                ))) 

mapshot(file = "figs/map-blantyre-hospital.png")

