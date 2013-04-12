print("running pagerank")
pagerank <- page.rank(graph, directed = TRUE)
print("storing pagerank")
write.table(pagerank$vector, file = "output/directed_pagerank", append = FALSE, quote = FALSE, sep = "\t", row.names = TRUE, col.names = FALSE) #row names to true: takes attribute value (i.e. uri) from vector