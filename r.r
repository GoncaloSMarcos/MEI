data1 = read.table("results_code1.txt", header=TRUE)
data2 = read.table("results_code2.txt", header=TRUE)


n <- boxplot(time_in_seconds ~ probability_pairs, data = data1);

data1_without_outlier <- data1[-which(data1$time_in_seconds %in% n$out), ]

ag = aggregate(time_in_seconds ~ probability_pairs, data = data1_without_outlier, mean)

plot(ag$probability_pairs,ag$time_in_seconds)






plot(data1$probability_pairs,data1$time_in_seconds)
plot(data2$probability_pairs,data2$time_in_seconds)


lm.out=lm(data1$time_in_seconds~data1$probability_pairs)
summar = summary(lm.out)
