## Read in the Data ##
## My R can read in the data without garbled text, please note the encoding is utf8.

library(readr)
links <- read_csv("https://raw.githubusercontent.com/kho7/tw_sna/master/data/180820_leg_edges.csv")
View(links)

nodes <- read_csv("https://raw.githubusercontent.com/kho7/tw_sna/master/data/180820_leg_nodes.csv")
View(nodes)

## Examine Data ##
install.packages("utf8")
library(utf8)
## Examine Data ##
head(nodes)

head(links)

nrow(nodes); length(unique(nodes$billProposer1))
nrow(links); nrow(unique(links[,c("from", "to")]))

## Aggregate Links ##

# lauren_ 
links <- aggregate(links[,3], links[,-3], sum)
links <- links[order(links$from, links$to),]

colnames(links)[4] <- "weight"

names(nodes)[1] <- "id"
# nodes1=filter(nodes, !is.na(id) & !is.na(KMT) & !is.na(DPP))

## Turning Networks into igraph object ##
install.packages("igraph")
library(igraph)

net <- graph_from_data_frame(d=links, vertices=nodes, directed=T) 

class(net)

net

## Intial Network Attributes ##

E(net)       # The edges of the "net" object

V(net)       # The vertices of the "net" object

E(net)$type  # Edge attribute "type"

V(net)$media # Vertex/Node attribute "media"

