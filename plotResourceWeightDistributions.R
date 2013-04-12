


alg <- "directed_indegree"
subset <- 0.5 #only take half of the table for the plot (will have a long tail anyway)
inputFilename <- paste("output/", alg, sep="")
outputPdf <- paste("plots/", alg, ".pdf", sep="")
outputTop100 <- paste("top100/", alg, setp="")
tab5rows <- read.delim(inputFilename, header=FALSE, sep="\t", quote="", nrows = 5000)
#get classes (types) of first 5 rows, and use these as colClasses for loading of complete file
#this should make loading a lot faster
classes <- sapply(tab5rows, class)
input = read.delim(inputFilename, header=FALSE, sep="\t", quote="", colClasses = classes);
input$V2 <- sort(input$V2, decreasing = TRUE)

write.table(input[1:100,], file = outputTop100, append = FALSE, quote = FALSE, sep = "\t", row.names = TRUE, col.names = FALSE) #row names to true: takes attribute value (i.e. uri) from vector
pdf(outputPdf);
plot(input$V2[1:(nrow(input)/2)], type="l")
dev.off()




alg <- "directed_outdegree"
inputFilename <- paste("output/", alg, sep="")
outputPdf <- paste("plots/", alg, ".pdf", sep="")
outputTop100 <- paste("top100/", alg, sep="")
tab5rows <- read.table(inputFilename, header=FALSE, sep="\t", quote="", nrows = 50)
#get classes (types) of first 5 rows, and use these as colClasses for loading of complete file
#this should make loading a lot faster
classes <- sapply(tab5rows, class)
input = read.delim(inputFilename, header=FALSE,  sep="\t", quote="",colClasses = classes);
input$V2 <- sort(input$V2, decreasing = TRUE)

write.table(input[1:100,], file = outputTop100, append = FALSE, quote = FALSE, sep = "\t", row.names = TRUE, col.names = FALSE) #row names to true: takes attribute value (i.e. uri) from vector
pdf(outputPdf);
plot(input$V2[1:(nrow(input)/2)], type="l")
dev.off()