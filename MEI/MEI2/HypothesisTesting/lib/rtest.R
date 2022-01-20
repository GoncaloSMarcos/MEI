library(DataExplorer)
library(ggcorrplot)
library(ggplot2)
library(reshape2)
library(plotly)
library(R.utils)

require(dplyr)


# NOTE: This path should be changed by you. Just get your path from your terminal using the command $ pwd
setwd("/home/aeloi/Documents/Faculdade/Mestrado/MEI/git/Experimental-Methods-in-Computer-Science/HypothesisTesting/lib")
data = read.csv("data.csv")

# Separation by algorithm
bubbleData = subset(data, Sorting.Algorithm == "bubblesort")
insertionData = subset(data, Sorting.Algorithm == "insertionsort")
mergeData = subset(data, Sorting.Algorithm == "mergesort")
quickData = subset(data, Sorting.Algorithm == "quicksort")

# Create a new subset with elements N<=100k and remove column sorting.algorithm
N_less_equal = 100000
bubbleDataB = subset(bubbleData, N <= N_less_equal, -c(Sorting.Algorithm))
insertionDataB = subset(insertionData, N <= N_less_equal, -c(Sorting.Algorithm))
mergeDataB = subset(mergeData, N <= N_less_equal, -c(Sorting.Algorithm))
quickDataB = subset(quickData, N <= N_less_equal, -c(Sorting.Algorithm))


# x = insertionDataB[1]
# y = insertionDataB[9]
# s <- data.frame(x, y) 
# plot(s, type = "l", xlab = "Array Size", ylab = "Ratio")

# N / Ratio

# Creates a two collumn set with the mean of the 1st param
resultBubble = aggregate(X.Ratio.of..Comp.failure.no.failure~N,bubbleDataB,FUN=mean)
resultInsert = aggregate(X.Ratio.of..Comp.failure.no.failure~N,insertionDataB,FUN=mean)
resultMerge = aggregate(X.Ratio.of..Comp.failure.no.failure~N,mergeDataB,FUN=mean)
resultQuick = aggregate(X.Ratio.of..Comp.failure.no.failure~N,quickDataB,FUN=mean)

# Colocar so os de 10000
resultCutBubble = subset(resultBubble, N <= 10000)
resultCutInsert = subset(resultInsert, N <= 10000)
resultCutMerge = subset(resultMerge, N <= 10000)
resultCutQuick = subset(resultQuick, N <= 10000)

# buscar coluna N e faz uma linha com esses N
xdata = resultCutBubble$N
yBubble = resultCutBubble$X.Ratio.of..Comp.failure.no.failure
yInsert = resultCutInsert$X.Ratio.of..Comp.failure.no.failure
yMerge = resultCutMerge$X.Ratio.of..Comp.failure.no.failure
yQuick = resultCutQuick$X.Ratio.of..Comp.failure.no.failure

plot(xdata,yBubble, type = "l", col="red", xlab = "Array Size", ylab = "Ratio", ylim = c(0,1.1))
lines(xdata, yInsert, col="blue",lty=2)
lines(xdata, yMerge, col="green",lty=2)
lines(xdata, yQuick, col="orange",lty=2)

# Testing N / Unsorted 

resultBubble = aggregate(X.Unsorted.Sub.Arrays~N,bubbleDataB,FUN=mean)
resultInsert = aggregate(X.Unsorted.Sub.Arrays~N,insertionDataB,FUN=mean)
resultMerge = aggregate(X.Unsorted.Sub.Arrays~N,mergeDataB,FUN=mean)
resultQuick = aggregate(X.Unsorted.Sub.Arrays~N,quickDataB,FUN=mean)

resultCutBubble = subset(resultBubble, N <= 52000)
resultCutInsert = subset(resultInsert, N <= 52000)
resultCutMerge = subset(resultMerge, N <= 52000)
resultCutQuick = subset(resultQuick, N <= 52000)

xdata = resultCutBubble$N

yBubble = resultCutBubble$X.Unsorted.Sub.Arrays
yInsert = resultCutInsert$X.Unsorted.Sub.Arrays
yMerge = resultCutMerge$X.Unsorted.Sub.Arrays
yQuick = resultCutQuick$X.Unsorted.Sub.Arrays

plot(xdata,yBubble, type = "l", col="red", xlab = "Array Size", ylab = "Number of Unsorted Sub-Arrays")
lines(xdata, yInsert, col="blue", type='l')
lines(xdata, yMerge, col="green",type='l')
lines(xdata, yQuick, col="orange",type='l')

# 3rd scatter graph


# Insert Sort scatter
resultCut = subset(bubbleDataB,MaxR>N/2.5)
resultCut = subset(resultCut,MaxR<N-15)


p <- plot_ly(resultCut, x = resultCut$N, y =  resultCut$Eps, z =  resultCut$X.Ratio.of..Comp.failure.no.failure, color = "blue", opacity=0.19, size = I(10)) %>%
  add_markers() %>%
  layout(scene = list(xaxis = list(title = 'N'),
                      yaxis = list(title = 'EPS'),
                      zaxis = list(title = 'LNDS')))

p


setwd("/home/aeloi/Documents/Faculdade/Mestrado/MEI/git/Experimental-Methods-in-Computer-Science/HypothesisTesting/lib")

### BubbleSort EPS / RATIO
data = read.csv("data.csv")

# Separation by algorithm
bubbleData = subset(data, Sorting.Algorithm == "quicksort")
bubbleData = subset(bubbleData,MaxR>N/2.5)
bubbleData = subset(bubbleData,MaxR<N-15,-c(Sorting.Algorithm))
bubbleDataB = subset(bubbleData, N == 80000)
sort(bubbleDataB, bubbleDataB$Eps)
#resultBubble = aggregate(X.Ratio.of..Comp.failure.no.failure~N,bubbleDataB,FUN=mean)


xdata = bubbleDataB$Eps
yBubble = bubbleDataB$LNDS
plot(xdata,yBubble, type = "o", col="red", xlab = "EPS", ylab = "LNDS")


# Buscar população de N com eps = 5 %
# NOTE: This path should be changed by you. Just get your path from your terminal using the command $ pwd
setwd("/home/aeloi/Documents/Faculdade/Mestrado/MEI/git/Experimental-Methods-in-Computer-Science/HypothesisTesting/lib")
data = read.csv("data.csv")

quickData = subset(data, Sorting.Algorithm == "quicksort")
quickData = subset(quickData,MaxR>N/2.5)
quickData = subset(quickData,MaxR<N-15,-c(Sorting.Algorithm))
quickData = subset(quickData, Eps == 0.05)


