library(igraph)

filename = "dbp"

tab5rows <- read.delim(filename, header=FALSE, sep="\t", quote="", nrows = 100)
#get classes (types) of first 5 rows, and use these as colClasses for loading of complete file
#this should make loading a lot faster
classes <- sapply(tab5rows, class)
input = read.delim(filename, header=FALSE, sep="\t", quote="", colClasses = classes);


graph <- graph.data.frame(input, directed=TRUE)

pagerank <- page.rank(graph, directed = TRUE)
write.table(pagerank$vector, file = "output/directed_pagerank", append = FALSE, quote = FALSE, sep = "\t", row.names = TRUE, col.names = FALSE) #row names to true: takes attribute value (i.e. uri) from vector




