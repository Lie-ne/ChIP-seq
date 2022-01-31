# Import the libraries
library(rtracklayer)
library(ChIPpeakAnno)

# Set the extraCols for narrowPeak
extraCols_narrowPeak <- c(signalValue = "numeric", pValue = "numeric",
                          qValue = "numeric", peak = "integer")

# Create the GRanges files for your replicates
FLAG_rep1 <- import('FLAG-ChIP_rep1.narrowPeak', format = "BED",
                       extraCols = extraCols_narrowPeak)

FLAG_rep2 <- import('FLAG-ChIP_rep2.narrowPeak', format = "BED",
                       extraCols = extraCols_narrowPeak)

# Find the overlaps
ol <- findOverlapsOfPeaks(FLAG_rep1, FLAG_rep2)

# Make Venn diagram
makeVennDiagram(ol, fill=c("green", "blue"), # circle fill color
                col=c("black", "black"), #circle border color
                cat.col=c("green", "blue")) # label color