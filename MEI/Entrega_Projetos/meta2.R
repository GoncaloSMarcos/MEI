library(dplyr)
filenames <- list.files(pattern=".txt", full.names=TRUE)
tables <- lapply(filenames, read.csv)
teste <- setNames(data.frame(matrix(ncol = 6, nrow = 0)), c("Workload", "Algorithm", "TAT", "WT", "RT", "instance"))
verifica <- 0
index <- 1

conta_fcfs_w1 <-1
conta_rr_w1 <- 1
conta_sjf_w1 <- 1
conta_srtf_w1 <- 1

conta_fcfs_w2 <-1
conta_rr_w2 <- 1
conta_sjf_w2 <- 1
conta_srtf_w2 <- 1

conta_fcfs_w3 <-1
conta_rr_w3 <- 1
conta_sjf_w3 <- 1
conta_srtf_w3 <- 1

if_fcfs <- 0
is_rr <- 0
is_sjf <- 0
is_srtf <-0

for (i in 1:(length(tables))) {
  tat <- mean(tables[[i]][,6])
  wt <- mean(tables[[i]][,7])
  rt <- mean(tables[[i]][,8])
  
  if(grepl("fcfs",filenames[i])){
    if_fcfs <- 1
    verifica <- 1
    algorithm <- "FCFS"
  }
  
  else if(grepl("rr",filenames[i])){
    if(grepl("_q_0.3",filenames[i])){
      is_rr <- 1
      verifica <- 1
      algorithm <- "RR"
    }
  }
  else if(grepl("sjf",filenames[i])){
    is_sjf <- 1
    verifica <- 1
    algorithm <- "SJF"
  }
  else if(grepl("srtf",filenames[i])){
    is_srtf <- 1
    verifica <- 1
    algorithm <- "SRTF"
  }
  if(grepl("w1",filenames[i])){
    workload <- "1"
    if(if_fcfs == 1){
      inst <- conta_fcfs_w1
      conta_fcfs_w1 <- conta_fcfs_w1+1
    }
    else if(is_rr == 1){
      inst <- conta_rr_w1
      conta_rr_w1 <- conta_rr_w1+1
    }
    else if(is_sjf == 1){
      inst <- conta_sjf_w1 
      conta_sjf_w1 <- conta_sjf_w1+1
    }
    else if(is_srtf == 1){
      inst <- conta_srtf_w1
      conta_srtf_w1 <- conta_srtf_w1+1
    }
  }
  else if(grepl("w2",filenames[i])){
    workload <- "2"
    if(if_fcfs == 1){
      inst <- conta_fcfs_w2
      conta_fcfs_w2 <- conta_fcfs_w2+1
    }
    else if(is_rr == 1){
      inst <- conta_rr_w2
      conta_rr_w2 <- conta_rr_w2+1
    }
    else if(is_sjf == 1){
      inst <- conta_sjf_w2
      conta_sjf_w2 <- conta_sjf_w2+1
    }
    else if(is_srtf == 1){
      inst <- conta_srtf_w2
      conta_srtf_w2 <- conta_srtf_w2+1
    }
  }
  else if(grepl("w3",filenames[i])){
    workload <- "3"
    if(if_fcfs == 1){
      inst <- conta_fcfs_w3
      conta_fcfs_w3 <- conta_fcfs_w3+1
    }
    else if(is_rr == 1){
      inst <- conta_rr_w3
      conta_rr_w3 <- conta_rr_w3+1
    }
    else if(is_sjf == 1){
      inst <- conta_sjf_w3
      conta_sjf_w3 <- conta_sjf_w3+1
    }
    else if(is_srtf == 1){
      inst <- conta_srtf_w3
      conta_srtf_w3 <- conta_srtf_w3+1
    }
  }
  if(verifica == 1){
    teste[index,2] <- algorithm
    teste[index,1] <- workload
    teste[index,3] <- tat
    teste[index,4] <- wt
    teste[index,5] <- rt
    teste[index,6] <- inst
    index <- index+1
  }
  verifica <- 0
  if_fcfs <- 0
  is_rr <- 0
  is_sjf <- 0
  is_srtf <-0
}

w1_data <- teste %>% filter(Workload == "1")
w2_data <- teste %>% filter(Workload == "2")
w3_data <- teste %>% filter(Workload == "3")

#===========================================Turnaround Time===========================================#

#================ANOVA ALGORITMOS Workload 1===========================#

aov_w1_tat_erro = aov(RT~Algorithm+Error(instance), data = w1_data)
summary(aov_w1_tat_erro)

aov_w1_tat = aov(RT~Algorithm, data = w1_data)
summary(aov_w1_tat)


#Ver se os residuos seguem uma distribuição normal
png(file="~/Desktop/Rosarinho/Mestrado/MEI/assignment/meta2/sim_out/qqnorm_TAT_w1.png",
    width=600, height=350)
qqnorm(aov_w1_tat$residuals)
qqline(aov_w1_tat$residuals)
dev.off()
#para ter a certeza que seguem uma distribuicao normal podemos fazer o shapiro test
shapiro.test(aov_w1_tat$res)

#Ver se as variâncias são homogeneas
bartlett.test(TAT~Algorithm, data = w1_data)

#Investigar comparações multiplas
t_tat = TukeyHSD(aov_w1_tat, alternative="two.sided")
t_tat

kruskal.test(TAT~Algorithm, data = w1_data)
#================ANOVA ALGORITMOS Workload 2===========================#

aov_w2_erro_tat = aov(RT~Algorithm+Error(instance), data = w2_data)
summary(aov_w2_erro_tat)

aov_w2_tat = aov(TAT~Algorithm, data = w2_data)
summary(aov_w2_tat)

#Ver se os residuos seguem uma distribuição normal
png(file="~/Desktop/Rosarinho/Mestrado/MEI/assignment/meta2/sim_out/qqnorm_TAT_w2.png",
    width=600, height=350)
qqnorm(aov_w2_tat$residuals)
qqline(aov_w2_tat$residuals)
dev.off()
#para ter a certeza que seguem uma distribuicao normal podemos fazer o shapiro test
shapiro.test(aov_w2_tat$res)

#Ver se as variâncias são homogeneas
bartlett.test(TAT~Algorithm, data = w2_data)

#Investigar comparações multiplas
t1_tat = TukeyHSD(aov_w2, alternative="two.sided")
t1_tat

kruskal.test(TAT~Algorithm, data = w2_data)
#================ANOVA ALGORITMOS Workload 3===========================#

aov_w3_erro_tat = aov(RT~Algorithm+Error(instance), data = w3_data)
summary(aov_w3_erro_tat)

aov_w3_tat = aov(RT~Algorithm, data = w3_data)
summary(aov_w3_tat)

#Ver se os residuos seguem uma distribuição normal
png(file="~/Desktop/Rosarinho/Mestrado/MEI/assignment/meta2/sim_out/qqnorm_TAT_w3.png",
    width=600, height=350)
qqnorm(aov_w3_tat$residuals)
qqline(aov_w3_tat$residuals)
dev.off()
#para ter a certeza que seguem uma distribuicao normal podemos fazer o shapiro test
shapiro.test(aov_w3_tat$res)

#Ver se as variâncias são homogeneas
bartlett.test(TAT~Algorithm, data = w3_data)

#Investigar comparações multiplas
t3_tat = TukeyHSD(aov_w3_tat, alternative="two.sided")
t3_tat

kruskal.test(TAT~Algorithm, data = w3_data)

#=============================================Waiting Time===========================================#

#================ANOVA ALGORITMOS Workload 1===========================#

aov_w1_erro_wt = aov(WT~Algorithm+Error(instance), data = w1_data)
summary(aov_w1_erro_wt)

aov_w1_wt = aov(WT~Algorithm, data = w1_data)
summary(aov_w1_wt)

#Ver se os residuos seguem uma distribuição normal
png(file="~/Desktop/Rosarinho/Mestrado/MEI/assignment/meta2/sim_out/qqnorm_WT_w1.png",
    width=600, height=350)
qqnorm(aov_w1_wt$residuals)
qqline(aov_w1_wt$residuals)
dev.off()
#para ter a certeza que seguem uma distribuicao normal podemos fazer o shapiro test
shapiro.test(aov_w1_wt$res)

#Ver se as variâncias são homogeneas
bartlett.test(WT~Algorithm, data = w1_data)

#Investigar comparações multiplas
t_wt = TukeyHSD(aov_w1_wt, alternative="two.sided")
t_wt

kruskal.test(WT~Algorithm, data = w1_data)
#================ANOVA ALGORITMOS Workload 2===========================#

aov_w2_erro_wt = aov(WT~Algorithm+Error(instance), data = w2_data)
summary(aov_w2_erro_wt)

aov_w2_wt = aov(WT~Algorithm, data = w2_data)
summary(aov_w2_wt)

#Ver se os residuos seguem uma distribuição normal
png(file="~/Desktop/Rosarinho/Mestrado/MEI/assignment/meta2/sim_out/qqnorm_WT_w2.png",
    width=600, height=350)
qqnorm(aov_w2_wt$residuals)
qqline(aov_w2_wt$residuals)
dev.off()
#para ter a certeza que seguem uma distribuicao normal podemos fazer o shapiro test
shapiro.test(aov_w2_wt$res)

#Ver se as variâncias são homogeneas
bartlett.test(WT~Algorithm, data = w2_data)

#Investigar comparações multiplas
t1_wt = TukeyHSD(aov_w2_wt, alternative="two.sided")
t1_wt

kruskal.test(WT~Algorithm, data = w2_data)
#================ANOVA ALGORITMOS Workload 3===========================#

aov_w3_erro_wt = aov(WT~Algorithm+Error(instance), data = w3_data)
summary(aov_w3_erro_wt)

aov_w3_wt = aov(WT~Algorithm, data = w3_data)
summary(aov_w3_wt)

#Ver se os residuos seguem uma distribuição normal
png(file="~/Desktop/Rosarinho/Mestrado/MEI/assignment/meta2/sim_out/qqnorm_WT_w3.png",
    width=600, height=350)
qqnorm(aov_w3_wt$residuals)
qqline(aov_w3_wt$residuals)
dev.off()
#para ter a certeza que seguem uma distribuicao normal podemos fazer o shapiro test
shapiro.test(aov_w3_wt$res)

#Ver se as variâncias são homogeneas
bartlett.test(WT~Algorithm, data = w3_data)

#Investigar comparações multiplas
t3_wt = TukeyHSD(aov_w3_wt, alternative="two.sided")
t3_wt

kruskal.test(WT~Algorithm, data = w3_data)
#===============================================Response Time===========================================#

#================ANOVA ALGORITMOS Workload 1===========================#

aov_w1_erro = aov(RT~Algorithm+Error(instance), data = w1_data)
summary(aov_w1_erro)

aov_w1 = aov(RT~Algorithm, data = w1_data)
summary(aov_w1)


#Ver se os residuos seguem uma distribuição normal
png(file="~/Desktop/Rosarinho/Mestrado/MEI/assignment/meta2/sim_out/qqnorm_RT_w1.png",
    width=600, height=350)
qqnorm(aov_w1$residuals)
qqline(aov_w1$residuals)
dev.off()
#para ter a certeza que seguem uma distribuicao normal podemos fazer o shapiro test
shapiro.test(aov_w1$res)

#Ver se as variâncias são homogeneas
bartlett.test(RT~Algorithm, data = w1_data)

#Investigar comparações multiplas
t = TukeyHSD(aov_w1, alternative="two.sided")
t

png(file="~/Desktop/Rosarinho/Mestrado/MEI/assignment/meta2/sim_out/tukey_RT_w1.png",
    width=600, height=350)
plot(t)
dev.off()

kruskal.test(RT~Algorithm, data = w1_data)
#================ANOVA ALGORITMOS Workload 2===========================#

aov_w2_erro = aov(RT~Algorithm+Error(instance), data = w2_data)
summary(aov_w2_erro)

aov_w2 = aov(RT~Algorithm, data = w2_data)
summary(aov_w2)

#Ver se os residuos seguem uma distribuição normal
png(file="~/Desktop/Rosarinho/Mestrado/MEI/assignment/meta2/sim_out/qqnorm_RT_w2.png",
    width=600, height=350)
qqnorm(aov_w2$residuals)
qqline(aov_w2$residuals)
dev.off()
#para ter a certeza que seguem uma distribuicao normal podemos fazer o shapiro test
shapiro.test(aov_w2$res)

#Ver se as variâncias são homogeneas
bartlett.test(RT~Algorithm, data = w2_data)

#Investigar comparações multiplas
t1 = TukeyHSD(aov_w2, alternative="two.sided")
t1
png(file="~/Desktop/Rosarinho/Mestrado/MEI/assignment/meta2/sim_out/tukey_RT_w2.png",
    width=600, height=350)
plot(t1)
dev.off()

kruskal.test(RT~Algorithm, data = w2_data)
#================ANOVA ALGORITMOS Workload 3===========================#

aov_w3_erro = aov(RT~Algorithm+Error(instance), data = w3_data)
summary(aov_w3_erro)

aov_w3 = aov(RT~Algorithm, data = w3_data)
summary(aov_w3)

#Ver se os residuos seguem uma distribuição normal
png(file="~/Desktop/Rosarinho/Mestrado/MEI/assignment/meta2/sim_out/qqnorm_RT_w3.png",
    width=600, height=350)
qqnorm(aov_w3$residuals)
qqline(aov_w3$residuals)
dev.off()
#para ter a certeza que seguem uma distribuicao normal podemos fazer o shapiro test
shapiro.test(aov_w3$res)

#Ver se as variâncias são homogeneas
bartlett.test(RT~Algorithm, data = w3_data)

#Investigar comparações multiplas
t3 = TukeyHSD(aov_w3, alternative="two.sided")
t3

png(file="~/Desktop/Rosarinho/Mestrado/MEI/assignment/meta2/sim_out/tukey_RT_w3.png",
    width=600, height=350)
plot(t3)
dev.off()

kruskal.test(RT~Algorithm, data = w3_data)
#==================================TWO-WAY ANOVA Turnaround Time===================================#
aov_tat_erro.out = aov(TAT~Workload*Algorithm+Error(instance), data = teste)
summary(aov_tat_erro.out)

aov_tat.out = aov(TAT~Workload*Algorithm, data = teste)
summary(aov_tat.out)

#Ver se os residuos seguem uma distribuição normal
png(file="~/Desktop/Rosarinho/Mestrado/MEI/assignment/meta2/sim_out/qqnorm_TAT_total.png",
    width=600, height=350)
qqnorm(aov_tat.out$residuals)
qqline(aov_tat.out$residuals)
dev.off()
#para ter a certeza que seguem uma distribuicao normal podemos fazer o shapiro test
shapiro.test(aov_tat.out$res)

#Ver se as variâncias são homogeneas
bartlett.test(TAT~interaction(Workload,Algorithm), data = teste)

#Investigar comparações multiplas
t4_tat = TukeyHSD(aov_tat.out, alternative="two.sided")
t4_tat
#==================================TWO-WAY ANOVA Waiting Time===================================#
aov_wt_erro.out = aov(WT~Workload*Algorithm+Error(instance), data = teste)
summary(aov_wt_erro.out)

aov_wt.out = aov(WT~Workload*Algorithm, data = teste)
summary(aov_wt.out)

#Ver se os residuos seguem uma distribuição normal
png(file="~/Desktop/Rosarinho/Mestrado/MEI/assignment/meta2/sim_out/qqnorm_WT_total.png",
    width=600, height=350)
qqnorm(aov_wt.out$residuals)
qqline(aov_wt.out$residuals)
dev.off()
#para ter a certeza que seguem uma distribuicao normal podemos fazer o shapiro test
shapiro.test(aov_wt.out$res)

#Ver se as variâncias são homogeneas
bartlett.test(WT~interaction(Workload,Algorithm), data = teste)

#Investigar comparações multiplas
t4_wt = TukeyHSD(aov_wt.out, alternative="two.sided")
t4_wt
#==================================TWO-WAY ANOVA Response Time===================================#
aov_rt_erro.out = aov(RT~Workload*Algorithm+Error(instance), data = teste)
summary(aov_rt_erro.out)

aov.out = aov(RT~Workload*Algorithm, data = teste)
summary(aov.out)

#Ver se os residuos seguem uma distribuição normal
png(file="~/Desktop/Rosarinho/Mestrado/MEI/assignment/meta2/sim_out/qqnorm_RT_total.png",
    width=600, height=350)
qqnorm(aov.out$residuals)
qqline(aov.out$residuals)
dev.off()
#para ter a certeza que seguem uma distribuicao normal podemos fazer o shapiro test
shapiro.test(aov.out$res)

#Ver se as variâncias são homogeneas
bartlett.test(RT~interaction(Workload,Algorithm), data = teste)

#Investigar comparações multiplas
t4 = TukeyHSD(aov.out, alternative="two.sided")
t4

#================ ONE WAY ANOVA - WORKLOADS - Response Time ===========================#

aov_cw1 = aov(RT~Workload, data = teste)
summary(aov_cw1)

#Ver se os residuos seguem uma distribuição normal
png(file="~/Desktop/Rosarinho/Mestrado/MEI/assignment/meta2/sim_out/qqnorm_RT_cw1.png",
    width=600, height=350)
qqnorm(aov_cw1$residuals)
qqline(aov_cw1$residuals)
dev.off()
#para ter a certeza que seguem uma distribuicao normal podemos fazer o shapiro test
shapiro.test(aov_cw1$res)

#Ver se as variâncias são homogeneas
bartlett.test(RT~Workload, data = teste)

#Investigar comparações multiplas
t5 = TukeyHSD(aov_cw1, alternative="two.sided")
t5

png(file="~/Desktop/Rosarinho/Mestrado/MEI/assignment/meta2/sim_out/tukey_RT_cw3.png",
    width=600, height=350)
plot(t5)
dev.off()

#================ ONE WAY ANOVA - WORKLOADS - Turnaround Time ===========================#

aov_cw1_tat = aov(TAT~Workload, data = teste)
summary(aov_cw1_tat)

#Ver se os residuos seguem uma distribuição normal
png(file="~/Desktop/Rosarinho/Mestrado/MEI/assignment/meta2/sim_out/qqnorm_TAT_cw1.png",
    width=600, height=350)
qqnorm(aov_cw1_tat$residuals)
qqline(aov_cw1_tat$residuals)
dev.off()
#para ter a certeza que seguem uma distribuicao normal podemos fazer o shapiro test
shapiro.test(aov_cw1_tat$res)

#Ver se as variâncias são homogeneas
bartlett.test(TAT~Workload, data = teste)

#Investigar comparações multiplas
t5_tat = TukeyHSD(aov_cw1_tat, alternative="two.sided")
t5_tat

#================ ONE WAY ANOVA - WORKLOADS - Waiting Time ===========================#

aov_cw1_wt = aov(WT~Workload, data = teste)
summary(aov_cw1_tat)

#Ver se os residuos seguem uma distribuição normal
png(file="~/Desktop/Rosarinho/Mestrado/MEI/assignment/meta2/sim_out/qqnorm_WT_cw1.png",
    width=600, height=350)
qqnorm(aov_cw1_wt$residuals)
qqline(aov_cw1_wt$residuals)
dev.off()
#para ter a certeza que seguem uma distribuicao normal podemos fazer o shapiro test
shapiro.test(aov_cw1_wt$res)

#Ver se as variâncias são homogeneas
bartlett.test(WT~Workload, data = teste)

#Investigar comparações multiplas
t5_wt = TukeyHSD(aov_cw1_wt, alternative="two.sided")
t5_wt

#================ Interaction Turnaround Time ===========================#
png(file="~/Desktop/Rosarinho/Mestrado/MEI/assignment/meta2/sim_out/interactions_TAT.png",
    width=600, height=350)
interaction.plot(teste$Algorithm, teste$Workload, teste$TAT, 
                 type="b",
                 col=c(2:3),
                 leg.bty="o",
                 leg.bg="beige",
                 trace.label = "Workload",
                 lwd=2,pch=c(18,24),
                 xlab="Algorithm",
                 ylab="TAT",
                 main="Interaction plot")

dev.off()

#================ Interaction Waiting Time ===========================#
png(file="~/Desktop/Rosarinho/Mestrado/MEI/assignment/meta2/sim_out/interactions_WT.png",
    width=600, height=350)
interaction.plot(teste$Algorithm, teste$Workload, teste$WT, 
                 type="b",
                 col=c(2:3),
                 leg.bty="o",
                 leg.bg="beige",
                 trace.label = "Workload",
                 lwd=2,pch=c(18,24),
                 xlab="Algorithm",
                 ylab="WT",
                 main="Interaction plot")

dev.off()

#================ Interaction Response Time ===========================#
png(file="~/Desktop/Rosarinho/Mestrado/MEI/assignment/meta2/sim_out/interactions_RT.png",
    width=600, height=350)
interaction.plot(teste$Algorithm, teste$Workload, teste$RT, 
                 type="b",
                 col=c(2:3),
                 leg.bty="o",
                 leg.bg="beige",
                 trace.label = "Workload",
                 lwd=2,pch=c(18,24),
                 xlab="Algorithm",
                 ylab="RT",
                 main="Interaction plot")

dev.off()