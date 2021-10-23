data1 = read.table("data.txt", header=TRUE)

data1$n
data1$time


lm.out=lm(data1$time~data1$n)
summar = summary(lm.out)
plot(data1$n,data1$time)
abline(lm.out)
sqrt(summar$r.squared)


lm.out$residuals

lm.out$residuals^2
sum(lm.out$residuals^2)
mean(data1$time)

data1$time-mean(data1$time)
(data1$time-mean(data1$time))^2
sum((data1$time-mean(data1$time))^2)

1-(sum(lm.out$residuals^2)/sum((data1$time-mean(data1$time))^2))



data2 = read.table("data2.txt", header=TRUE)

data2$queries
data2$time
em.out2=em(data2$time~data2$queries)
summar = summary(em.out)
plot(data2$queries,data2$time)
abline(em.out2)
