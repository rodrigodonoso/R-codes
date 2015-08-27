#### **** Marriage in Renaissance Florence **** ####

## load the igraph package
library(igraph) 
f <- read.table("firenze.txt")

florence <- as.matrix(read.table("firenze.txt"))

## create the graph object
marriage <- graph.edgelist(florence, directed=FALSE) #esta funcion genera la red
marriage
## set some color atributes (V() gives back the 'vertices' = nodes)
V(marriage)$color = "pink"
V(marriage)["Medici"]$color <- "blue"
V(marriage)$frame.color = 0 #circulo alrededor del nodo
V(marriage)$label.color = "black"


## plot it
plot(marriage, edge.curved=F) #si pongo TRUE, tira la linea curva.


## print the degree for each family #RD: da el num de conexiones
sort(degree(marriage))

## calculate and color a couple shortest paths
PtoA <- get.shortest.paths(marriage, from="Peruzzi", to="Acciaiuoli")
PtoA
## you shortest paths are a list, with element vpath.  
## First element of vpath is then your vector 
## of vertices along the path.  confusing, sorry.
V(marriage)$name[PtoA$vpath[[1]]]
GtoS <- get.shortest.paths(marriage, from="Ginori", to="Strozzi") #shortest path
V(marriage)$name[GtoS$vpath[[1]]]
## set fat edges and default grey (E() returns edges)
E(marriage)$width <- 2  #grab the edges and changes
E(marriage)$color <- "grey"
E(marriage, path=PtoA$vpath[[1]])$color <- "green"
E(marriage, path=GtoS$vpath[[1]])$color <- "blue"
plot(marriage)

## print the betweenness for each family
sort(round(betweenness(marriage),1))  #midel el grado de conexion

betweenness(marriage) #calcula el grado de betweenness