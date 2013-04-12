# inputFilename <- "tail.txt"
subset <- 0.5 #only take half of the table for the plot (will have a long tail anyway)
tab1000rows <- read.delim(inputFilename, header=FALSE, sep="\t", quote="", nrows = 1000)
#get classes (types) of first 1000 rows, and use these as colClasses for loading of complete file
#this should make loading a lot faster
classes <- sapply(tab1000rows, class)


input = read.delim(inputFilename, header=FALSE, sep="\t", quote="", colClasses = classes);
input <- input[ order(-input[,2]), ]

write.table(input[1:100,], file = outputTop100, append = FALSE, quote = FALSE, sep = "\t", row.names = TRUE, col.names = FALSE) #row names to true: takes attribute value (i.e. uri) from vector
pdf(outputPdf);
plot(input$V2[1:(nrow(input)/2)], type="l")
dev.off()
