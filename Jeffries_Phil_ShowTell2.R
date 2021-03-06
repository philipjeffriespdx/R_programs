#Author: Phil Jeffries
#4-4-2016
#CSC311
#Library Demo - Show and Tell
#Leaflet

#examples from http://rstudio.github.io/leaflet/
install.packages("leaflet")
install.packages(c("devtools","RJSONIO", "knitr", "shiny", "httpuv"))
library(leaflet)

m <- leaflet()
m <- addTiles(m)
m <- addMarkers(m, lng=-117.250125, lat=32.718303, popup="Bresee Lab - PLNU")
m


library(sp)
Sr1 = Polygon(cbind(c(2, 4, 4, 1, 2), c(2, 3, 5, 4, 2)))
Sr2 = Polygon(cbind(c(5, 4, 2, 5), c(2, 3, 2, 2)))
Sr3 = Polygon(cbind(c(4, 4, 5, 10, 4), c(5, 3, 2, 5, 5)))
Sr4 = Polygon(cbind(c(5, 6, 6, 5, 5), c(4, 4, 3, 3, 4)), hole = TRUE)
Srs1 = Polygons(list(Sr1), "s1")
Srs2 = Polygons(list(Sr2), "s2")
Srs3 = Polygons(list(Sr4, Sr3), "s3/4")
SpP = SpatialPolygons(list(Srs1, Srs2, Srs3), 1:3)
leaflet(height = "300px") %>% addPolygons(data = SpP)


#earthquake map
data(quakes)
View(quakes)
# Show first 20 rows from the `quakes` dataset
leaflet(data = quakes[1:20,]) %>% addTiles() %>%
  addMarkers(~long, ~lat, popup = ~as.character(mag))



