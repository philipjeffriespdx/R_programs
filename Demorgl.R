#Author: Phil Jeffries
#3-1-2016
#CSC311
#Library Demo - Show and Tell
#rgl 3d representations

install.packages("rgl")
library(rgl)

#points example
open3d()
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x, y)
plot3d(x, y, z, type='s', col = rainbow(1000))
#types p l h s


#shapes in 3d: triangles example
triangles3d(cbind(x=rnorm(9), y=rnorm(9), z=rnorm(9)), col = "green")
decorate3d()
aspect3d(1,1,1)


#different poligons
open3d()
cols <- rainbow(7)
layout3d(matrix(1:16, 4,4), heights=c(1,3,1,3))
text3d(0,0,0,"tetrahedron3d"); next3d()
shade3d(tetrahedron3d(col=cols[1])); next3d()
text3d(0,0,0,"cube3d"); next3d()
shade3d(cube3d(col=cols[2])); next3d()
text3d(0,0,0,"octahedron3d"); next3d()
shade3d(octahedron3d(col=cols[3])); next3d()
text3d(0,0,0,"dodecahedron3d"); next3d()
shade3d(dodecahedron3d(col=cols[4])); next3d()
text3d(0,0,0,"icosahedron3d"); next3d()
shade3d(icosahedron3d(col=cols[5])); next3d()
text3d(0,0,0,"cuboctahedron3d"); next3d()
shade3d(cuboctahedron3d(col=cols[6])); next3d()
text3d(0,0,0,"oh3d"); next3d()
shade3d(oh3d(col=cols[7]))


#Bison Example
file <- read.csv("BisonData.csv")
attach(file)
opar <- par(no.readonly =TRUE)
bison <- na.omit(file)
plot3d(Bullage,Mass,Offspring,type='s',col = rainbow(1000))
par(opar)
detach(file)


#http://www.r-bloggers.com/plot-3d-topographic-map-in-r/
#Volcano
data(volcano)
#View(volcano)
z<-3*volcano
x<-10*(1:nrow(z))
y<-10*(1:ncol(z))
zlim<-range(z)
zlen<-zlim[2]-zlim[1]+1
colorlut<-terrain.colors(zlen,alpha=0)
col<-colorlut[z-zlim[1]+1]
open3d()
rgl.surface(x,y,z,color=col,alpha=1,back="lines")
#plot3d(x,y,z, alpha=1,back="lines")
#rgl.surface(x,y,z, alpha=1,back="lines")
#decorate3d()

#picture example: http://stackoverflow.com/questions/6901238/overlay-a-map-on-top-of-a-3d-surface-map-in-r


#What else can you do with rgl?
#1 - change all the graphical parameters to cater to your specific 3d plot
#2 - create new shapes
#3 - manipulate existing shapes
#4 - create multi-figure layouts
#5 - animations

