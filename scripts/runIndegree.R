print("running indegree")
degree <- degree(graph, normalized=TRUE, mode="in")
print("storing indegree")
write.table(degree, file = "output/directed_indegree", append = FALSE, quote = FALSE, sep = "\t", row.names = TRUE, col.names = FALSE) #row names to true: takes attribute value (i.e. uri) from vector