library(igraph)
filename = "dbp"

tab5rows <- read.delim(filename, header=FALSE, sep="\t", quote="", nrows = 5)
#get classes (types) of first 5 rows, and use these as colClasses for loading of complete file
#this should make loading a lot faster
classes <- sapply(tab5rows, class)
input = read.delim(filename, header=FALSE, sep="\t", quote="", colClasses = classes);



graph <- graph.data.frame(input, directed=TRUE)
betweenness <- betweenness.estimate(graph, directed=TRUE, cutoff=5) #gets us a numeric vector with uris as attributes
#so, directed, with cutoff of 5, takes 5,5 hours
write.table(betweenness, file = "output/directed_betweenness", append = FALSE, quote = FALSE, sep = "\t", row.names = TRUE, col.names = FALSE) #row names to true: takes attribute value (i.e. uri) from vector

graph <- graph.data.frame(input, directed=FALSE)
betweenness <- betweenness.estimate(graph, directed=FALSE, cutoff=5) #gets us a numeric vector with uris as attributes
write.table(betweenness, file = "output/undirected_betweenness", append = FALSE, quote = FALSE, sep = "\t", row.names = TRUE, col.names = FALSE) #row names to true: takes attribute value (i.e. uri) from vector


