
outputPdf <- paste("plots/", filename, ".pdf", sep="")
tab5rows <- read.delim(filename, header=FALSE, sep="\t", quote="", nrows = 5000)
#get classes (types) of first 5 rows, and use these as colClasses for loading of complete file
#this should make loading a lot faster
classes <- sapply(tab5rows, class)
input = read.delim(filename, header=FALSE, sep="\t", quote="", colClasses = classes);
input$V1 <- sort(input$V1, decreasing = TRUE)

pdf(outputPdf);
plot(input$V1, type="l")
dev.off()
