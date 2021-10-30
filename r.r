data1 = read.table("results_code2.txt", header=TRUE)

data1$min_time_slots
data1$time_in_seconds


lm.out=lm(data1$time_in_seconds~data1$probability_pairs)
summar = summary(lm.out)
plot(data1$probability_pairs,data1$time_in_seconds)
