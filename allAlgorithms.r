library(igraph)

#dir <- "/home/lrd900/rProject/dbp_s-o_unweighted_litAsNode"
#setwd(dir);
filename = "dbp.nt"

tab5rows <- read.delim(filename, header=FALSE, sep="\t", quote="", nrows = 5)
#get classes (types) of first 5 rows, and use these as colClasses for loading of complete file
#this should make loading a lot faster
classes <- sapply(tab5rows, class)
input = read.delim(filename, header=FALSE, sep="\t", quote="", colClasses = classes);

graph <- graph.data.frame(input, directed=FALSE)

degree <- degree(graph, normalized=TRUE)
write.table(degree, file = "analysis/undirected_degree.nt", append = FALSE, quote = FALSE, sep = "\t", row.names = TRUE, col.names = FALSE) #row names to true: takes attribute value (i.e. uri) from vector

pagerank <- page.rank(graph, directed = FALSE)
write.table(pagerank$vector, file = "analysis/undirected_pagerank.nt", append = FALSE, quote = FALSE, sep = "\t", row.names = TRUE, col.names = FALSE) #row names to true: takes attribute value (i.e. uri) from vector

#betweenness <- betweenness.estimate(graph, directed=FALSE, cutoff=5) #gets us a numeric vector with uris as attributes
#write.table(betweenness, file = "undirected_betweenness.nt", append = FALSE, quote = FALSE, sep = "\t", row.names = TRUE, col.names = FALSE) #row names to true: takes attribute value (i.e. uri) from vector




graph <- graph.data.frame(input, directed=TRUE)

degree <- degree(graph, normalized=TRUE, mode="in")
write.table(degree, file = "analysis/directed_indegree.nt", append = FALSE, quote = FALSE, sep = "\t", row.names = TRUE, col.names = FALSE) #row names to true: takes attribute value (i.e. uri) from vector
degree <- degree(graph, normalized=TRUE, mode="out")
write.table(degree, file = "analysis/directed_outdegree.nt", append = FALSE, quote = FALSE, sep = "\t", row.names = TRUE, col.names = FALSE) #row names to true: takes attribute value (i.e. uri) from vector

pagerank <- page.rank(graph, directed = TRUE)
write.table(pagerank$vector, file = "analysis/directed_pagerank.nt", append = FALSE, quote = FALSE, sep = "\t", row.names = TRUE, col.names = FALSE) #row names to true: takes attribute value (i.e. uri) from vector

#betweenness <- betweenness.estimate(graph, directed=TRUE, cutoff=5) #gets us a numeric vector with uris as attributes
#so, directed, with cutoff of 5, takes 5,5 hours
#write.table(betweenness, file = "analysis/directed_betweenness.nt", append = FALSE, quote = FALSE, sep = "\t", row.names = TRUE, col.names = FALSE) #row names to true: takes attribute value (i.e. uri) from vector



