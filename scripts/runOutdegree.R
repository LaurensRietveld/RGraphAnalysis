print("running outdegree")
degree <- degree(graph, normalized=TRUE, mode="out")
print("storing outdegree")
write.table(degree, file = "output/directed_outdegree", append = FALSE, quote = FALSE, sep = "\t", row.names = TRUE, col.names = FALSE) #row names to true: takes attribute value (i.e. uri) from vector