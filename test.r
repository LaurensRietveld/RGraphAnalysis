library(igraph)

smallfilename = "small"

smalltab5rows <- read.table(smallfilename, header=FALSE, sep="\t", quote="", nrows = 5)
#get classes (types) of first 5 rows, and use these as colClasses for loading of complete file
#this should make loading a lot faster
smallclasses <- sapply(smalltab5rows, class)
smallinput = read.delim(smallfilename, header=FALSE,  sep="\t", quote="",colClasses = smallclasses);
# 
smallgraph <- graph.data.frame(smallinput, directed=FALSE)

smalldegree <- degree(smallgraph, normalized=TRUE)
write.table(smalldegree, file = "smalldegree", append = FALSE, quote = FALSE, sep = "\t", row.names = TRUE, col.names = FALSE) #row names to true: takes attribute value (i.e. uri) from vector

smallbetweenness <- betweenness.estimate(smallgraph, directed=FALSE, cutoff=2) #gets us a numeric vector with uris as attributes
write.table(smallbetweenness, file = "smallbetweenness", append = FALSE, quote = FALSE, sep = "\t", row.names = TRUE, col.names = FALSE) #row names to true: takes attribute value (i.e. uri) from vector
