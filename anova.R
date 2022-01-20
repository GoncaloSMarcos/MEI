library(gplots)
library(ggplot2)
library(ggpubr)

##------- ANOVA 
setwd("C:\\Users\\gonca\\Desktop\\MEI")

hip1 = read.table("hip1.txt", header=TRUE)
model  <- lm(time_in_seconds ~ code * probability_pairs, data = hip1)
# Create a QQ plot of residuals
qq = ggqqplot(residuals(model), ggtheme = theme_bw()) 
show(qq)
aov.out = aov(time_in_seconds~factor(code)*factor(probability_pairs), data=hip1)
summary(aov.out)

plot(TukeyHSD(aov.out))

hip2 = read.table("hip2.txt", header=TRUE)
model  <- lm(time_in_seconds ~ code * n_exams, data = hip2)
# Create a QQ plot of residuals
qq = ggqqplot(residuals(model), ggtheme = theme_bw()) 
show(qq)

aov.out = aov(time_in_seconds~factor(code)*factor(n_exams), data=hip2)
summary(aov.out)
plot(aov.out)
