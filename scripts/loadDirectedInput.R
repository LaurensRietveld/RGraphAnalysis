library(igraph)
filename = "input"
print("loading input")
tab1000rows <- read.delim(filename, header=FALSE, sep="\t", quote="", nrows = 1000)
#get classes (types) of first 1000 rows, and use these as colClasses for loading of complete file
#this should make loading a lot faster
classes <- sapply(tab1000rows, class)
input = read.delim(filename, header=FALSE, sep="\t", quote="", colClasses = classes);
graph <- graph.data.frame(input, directed=TRUE)