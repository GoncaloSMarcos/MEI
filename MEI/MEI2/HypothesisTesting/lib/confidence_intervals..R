library(DataExplorer)
library(ggcorrplot)
library(ggplot2)
library(reshape2)
library(plotly)
library(R.utils)

require(dplyr)


# NOTE: This path should be changed by you. Just get your path from your terminal using the command $ pwd
setwd("/home/aeloi/Documents/Faculdade/Mestrado/MEI/git/Experimental-Methods-in-Computer-Science/HypothesisTesting/lib")
data <- read.csv(file="confidence.csv", header=TRUE, sep=",")

# bubble sort range from 1k to 20k
bubbleData = subset(data, Sorting.Algorithm == "bubblesort")
bubbleDataSubset = subset(bubbleData, N <= 20000, -c(Sorting.Algorithm))
bubbleDataSubset = subset(bubbleDataSubset, N >= 1000)


