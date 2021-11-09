# ------------------ TESTES PROBABILIDADE ------------------ 
testeProb1 = read.table("testeProb1.txt", header=TRUE)

n <- boxplot(time_in_seconds ~ probability_pairs, data = testeProb1);
testeProb1_without_outlier <- testeProb1[-which(testeProb1$time_in_seconds %in% n$out), ]
ag_testeProb1 = aggregate(time_in_seconds ~ probability_pairs, data = testeProb1_without_outlier, mean)

plot(testeProb1$probability_pairs,testeProb1$time_in_seconds)
plot(ag_testeProb1$probability_pairs,ag_testeProb1$time_in_seconds)

#-----
testeProb2 = read.table("testeProb2.txt", header=TRUE)

n <- boxplot(time_in_seconds ~ probability_pairs, data = testeProb2)
testeProb2_without_outlier <- testeProb2[-which(testeProb2$time_in_seconds %in% n$out), ]
ag_testeProb2 = aggregate(time_in_seconds ~ probability_pairs, data = testeProb2_without_outlier, mean)

plot(testeProb2$probability_pairs,testeProb2$time_in_seconds)
plot(ag_testeProb2$probability_pairs,ag_testeProb2$time_in_seconds)

#-- GRAFICO BOM

plot(ag_testeProb1$probability_pairs,ag_testeProb1$time_in_seconds, 
     main = paste("------ Teste Probabilidade ------\n-> 20 exames (fixo) ; Probabilidade [2:2:92]\n->40 testes por valor de probabilidade"), 
     xlab = "Probabilidade (em %)",
     ylab ="Tempo de execução (em segundos)",
     ylim = range(0:45),
     type = "l",
     col = "red")

lines(ag_testeProb2$probability_pairs,ag_testeProb2$time_in_seconds, 
      col = "blue")

legend( x="topleft", 
        legend=c("code1.c","code2.c"),
        col=c("red","blue"), lwd=1, lty=c(1,1), 
        pch=c(NA,NA) )







# ------------------ TESTES EXAMES ------------------ 
testeExams1 = read.table("testeExams1.txt", header=TRUE)

n <- boxplot(time_in_seconds ~ n_exams, data = testeExams1);
testeExams1_without_outlier <- testeExams1[-which(testeExams1$time_in_seconds %in% n$out), ]
ag_testeExams1 = aggregate(time_in_seconds ~ n_exams, data = testeExams1_without_outlier, mean)

plot(testeExams1$n_exams,testeExams1$time_in_seconds, 
     main = "Teste Exames 1 - Raw data", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")
plot(testeExams1_without_outlier$n_exams,testeExams1_without_outlier$time_in_seconds, 
     main = "Teste Exames 1 - Sem outliers", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")
plot(ag_testeExams1$n_exams,ag_testeExams1$time_in_seconds, 
     main = "Teste Exames 1 - Sem outliers, valor médio por número de exames", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")

ag_testeExames1_com_outliers = aggregate(time_in_seconds ~ n_exams, data = testeExams1, mean)

plot(ag_testeExames1_com_outliers$n_exams,ag_testeExames1_com_outliers$time_in_seconds, 
     main = "Teste Exames 1 - Com outliers, valor médio por número de exames", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)",
     xlim = c(0,60),
     ylim = c(0,60))


#-----
testeExams2 = read.table("testeExams2.txt", header=TRUE)

n <- boxplot(time_in_seconds ~ n_exams, data = testeExams2);
testeExams2_without_outlier <- testeExams2[-which(testeExams2$time_in_seconds %in% n$out), ]
ag_testeExams2 = aggregate(time_in_seconds ~ n_exams, data = testeExams2_without_outlier, mean)

plot(testeExams2$n_exams,testeExams2$time_in_seconds, 
     main = "Teste Exames 2 - Raw data", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")
plot(testeExams2_without_outlier$n_exams,testeExams2_without_outlier$time_in_seconds, 
     main = "Teste Exames 2 - Sem outliers", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")
plot(ag_testeExams2$n_exams,ag_testeExams2$time_in_seconds, 
     main = "Teste Exames 2 - Sem outliers, valor médio por número de exames", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")


#-- GRAFICO BOM

plot(ag_testeExams1$n_exams,ag_testeExams1$time_in_seconds, 
     main = paste("------ Teste Número de Exames ------\n-> Número de Exames [2:2:54] ; Probabilidade 20% (fixa)\n->40 testes por valor de Número de Exames"), 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)",
     type = "l",
     col = "red")

lines(ag_testeExams2$n_exams,ag_testeExams2$time_in_seconds, 
      col = "blue")

legend( x="topleft", 
        legend=c("code1.c","code2.c"),
        col=c("red","blue"), lwd=1, lty=c(1,1), 
        pch=c(NA,NA) )







# ------------------ TESTES EXAMES 35 60 ------------------ 
testeExames1_35_60 = read.table("testeExames1_35-60.txt", header=TRUE)

n <- boxplot(time_in_seconds ~ n_exams, data = testeExames1_35_60);
testeExames1_35_60_without_outlier <- testeExames1_35_60[-which(testeExames1_35_60$time_in_seconds %in% n$out), ]
ag_testeExames1_35_60 = aggregate(time_in_seconds ~ n_exams, data = testeExames1_35_60_without_outlier, mean)

plot(testeExames1_35_60$n_exams,testeExames1_35_60$time_in_seconds, 
     main = "Teste Exames 1 (35 a 60) - Raw data", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")
plot(testeExames1_35_60_without_outlier$n_exams,testeExames1_35_60_without_outlier$time_in_seconds, 
     main = "Teste Exames 1 (35 a 60) - Sem outliers", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")
plot(ag_testeExames1_35_60$n_exams,ag_testeExames1_35_60$time_in_seconds, 
     main = "Teste Exames 1 (35 a 60) - Sem outliers, valor médio por número de exames", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")



ag_testeExames1_35_60_com_outliers = aggregate(time_in_seconds ~ n_exams, data = testeExames1_35_60, mean)

plot(ag_testeExames1_35_60_com_outliers$n_exams,ag_testeExames1_35_60_com_outliers$time_in_seconds, 
     main = "Teste Exames 1 (35 a 60) - Com outliers, valor médio por número de exames", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")



#-----

testeExames2_35_60 = read.table("testeExames2_35-60.txt", header=TRUE)

n <- boxplot(time_in_seconds ~ n_exams, data = testeExames2_35_60);
testeExames2_35_60_without_outlier <- testeExames2_35_60[-which(testeExames2_35_60$time_in_seconds %in% n$out), ]
ag_testeExames2_35_60 = aggregate(time_in_seconds ~ n_exams, data = testeExames2_35_60_without_outlier, mean)

plot(testeExames2_35_60$n_exams,testeExames2_35_60$time_in_seconds, 
     main = "Teste Exames 2 (35 a 60) - Raw data", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")
plot(testeExames2_35_60_without_outlier$n_exams,testeExames2_35_60_without_outlier$time_in_seconds, 
     main = "Teste Exames 2 (35 a 60) - Sem outliers", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")
plot(ag_testeExames2_35_60$n_exams,ag_testeExames2_35_60$time_in_seconds, 
     main = "Teste Exames 2 (35 a 60) - Sem outliers, valor médio por número de exames", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")


ag_testeExames2_35_60_com_outliers = aggregate(time_in_seconds ~ n_exams, data = testeExames2_35_60, mean)

plot(ag_testeExames2_35_60_com_outliers$n_exams,ag_testeExames2_35_60_com_outliers$time_in_seconds, 
     main = "Teste Exames 2 (35 a 60) - Com outliers, valor médio por número de exames", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")


#-- GRAFICO BOM

plot(ag_testeExames1_35_60$n_exams,ag_testeExames1_35_60$time_in_seconds, 
     main = paste("------ Teste Número de Exames (35 a 51) ------\n-> Número de Exames [35:1:51] ; Probabilidade 20% (fixa)\n->60 testes por valor de Número de Exames"), 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)",
     type = "l",
     col = "red")

lines(ag_testeExames2_35_60$n_exams,ag_testeExames2_35_60$time_in_seconds, 
      col = "blue")

legend( x="topleft", 
        legend=c("code1.c","code2.c"),
        col=c("red","blue"), lwd=1, lty=c(1,1), 
        pch=c(NA,NA) )












# ------------------ TESTES EXAME E PROB 1 ------------------ 

testeExames_Prob1 = read.table("teste_Exames_Prob1.txt", header=TRUE)

n <- boxplot(time_in_seconds ~ n_exams, data = testeExames_Prob1);
testeExames_Prob1_without_outlier <- testeExames_Prob1[-which(testeExames_Prob1$time_in_seconds %in% n$out), ]
ag_testeExames_Prob1 = aggregate(time_in_seconds ~ n_exams, data = testeExames_Prob1_without_outlier, mean)

plot(testeExames_Prob1$n_exams,testeExames_Prob1$time_in_seconds, 
     main = "Teste Exames e Prob 1 - Raw data (Probabilidades 2,5,25,50)", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")
plot(testeExames_Prob1_without_outlier$n_exams,testeExames_Prob1_without_outlier$time_in_seconds, 
     main = "Teste Exames e Prob 1 - Sem outliers (Probabilidades 2,5,25,50)", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")
plot(ag_testeExames_Prob1$n_exams,ag_testeExames_Prob1$time_in_seconds, 
     main = "Teste Exames e Prob 1 - Sem outliers, valor médio por número de exames (Probabilidades 2,5,25,50)", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")

# ------------------  ------------------ 

testeExames_Prob1 = read.table("teste_Exames_Prob1.txt", header=TRUE)

n <- boxplot(time_in_seconds ~ probability_pairs, data = testeExames_Prob1);
testeExames_Prob1_without_outlier <- testeExames_Prob1[-which(testeExames_Prob1$time_in_seconds %in% n$out), ]
ag_testeExames_Prob1 = aggregate(time_in_seconds ~ probability_pairs, data = testeExames_Prob1_without_outlier, mean)

plot(testeExames_Prob1$probability_pairs,testeExames_Prob1$time_in_seconds, 
     main = "Teste Exames e Prob 1 - Raw data (Exames 10 a 60, 2 em 2)", 
     xlab = "Probabilidade",
     ylab ="Tempo de execução (em segundos)")
plot(testeExames_Prob1_without_outlier$probability_pairs,testeExames_Prob1_without_outlier$time_in_seconds, 
     main = "Teste Exames e Prob 1 - Sem outliers (Exames 10 a 60, 2 em 2)", 
     xlab = "Probabilidade",
     ylab ="Tempo de execução (em segundos)")
plot(ag_testeExames_Prob1$probability_pairs,ag_testeExames_Prob1$time_in_seconds, 
     main = "Teste Exames e Prob 1 - Sem outliers, valor médio por número de exames (Exames 10 a 60, 2 em 2)", 
     xlab = "Probabilidade",
     ylab ="Tempo de execução (em segundos)")






# ------------------ TESTES EXAME E PROB 2 ------------------ 

testeExames_Prob2 = read.table("teste_Exames_Prob2.txt", header=TRUE)

n <- boxplot(time_in_seconds ~ n_exams, data = testeExames_Prob2);
testeExames_Prob2_without_outlier <- testeExames_Prob2[-which(testeExames_Prob2$time_in_seconds %in% n$out), ]
ag_testeExames_Prob2 = aggregate(time_in_seconds ~ n_exams, data = testeExames_Prob2_without_outlier, mean)

plot(testeExames_Prob2$n_exams,testeExames_Prob2$time_in_seconds, 
     main = "Teste Exames e Prob 2 - Raw data (Probabilidades 2,5,25,50)", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")
plot(testeExames_Prob2_without_outlier$n_exams,testeExames_Prob2_without_outlier$time_in_seconds, 
     main = "Teste Exames e Prob 2 - Sem outliers (Probabilidades 2,5,25,50)", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")
plot(ag_testeExames_Prob2$n_exams,ag_testeExames_Prob2$time_in_seconds, 
     main = "Teste Exames e Prob 2 - Sem outliers, valor médio por número de exames (Probabilidades 2,5,25,50)", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")

# ------------------  ------------------ 

testeExames_Prob2 = read.table("teste_Exames_Prob2.txt", header=TRUE)

n <- boxplot(time_in_seconds ~ probability_pairs, data = testeExames_Prob2);
testeExames_Prob2_without_outlier <- testeExames_Prob2[-which(testeExames_Prob2$time_in_seconds %in% n$out), ]
ag_testeExames_Prob2 = aggregate(time_in_seconds ~ probability_pairs, data = testeExames_Prob2_without_outlier, mean)

plot(testeExames_Prob2$probability_pairs,testeExames_Prob2$time_in_seconds, 
     main = "Teste Exames e Prob 2 - Raw data (Exames 10 a 60, 2 em 2)", 
     xlab = "Probabilidade",
     ylab ="Tempo de execução (em segundos)")
plot(testeExames_Prob2_without_outlier$probability_pairs,testeExames_Prob2_without_outlier$time_in_seconds, 
     main = "Teste Exames e Prob 2 - Sem outliers (Exames 10 a 60, 2 em 2)", 
     xlab = "Probabilidade",
     ylab ="Tempo de execução (em segundos)")
plot(ag_testeExames_Prob2$probability_pairs,ag_testeExames_Prob2$time_in_seconds, 
     main = "Teste Exames e Prob 2 - Sem outliers, valor médio por número de exames (Exames 10 a 60, 2 em 2)", 
     xlab = "Probabilidade",
     ylab ="Tempo de execução (em segundos)")




#-- GRAFICO BOM

plot(ag_testeExames_Prob1$n_exams,ag_testeExames_Prob1$time_in_seconds, 
     main = paste("------ Teste Exames e Probabilidade ------\n-> Número de Exames [10:2:60] ; Probabilidade [2, 5, 15, 25, 50]%)\n-> 20 testes por combinação"), 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)",
     ylim=range(0:25),
     type="l",
     col = "red")

lines(ag_testeExames_Prob2$n_exams,ag_testeExames_Prob2$time_in_seconds, 
      col = "blue")

legend( x="topleft", 
        legend=c("code1.c","code2.c"),
        col=c("red","blue"), lwd=1, lty=c(1,1), 
        pch=c(NA,NA) )













# ------------------ TESTES PROBABILIDADE 65 95 ------------------ 
testeProb1_65_95 = read.table("ResultsExames1.txt", header=TRUE)

n <- boxplot(time_in_seconds ~ probability_pairs, data = testeProb1_65_95);
testeProb1_65_95_without_outlier <- testeProb1_65_95[-which(testeProb1_65_95$time_in_seconds %in% n$out), ]
ag_testeProb1_65_95 = aggregate(time_in_seconds ~ probability_pairs, data = testeProb1_65_95_without_outlier, mean)

plot(testeProb1_65_95$probability_pairs,testeProb1_65_95$time_in_seconds, 
     main = "Teste Probabilidade 1 (65% a 95%) - Raw data", 
     xlab = "Probabilidade (em %)",
     ylab ="Tempo de execução (em segundos)")
plot(testeProb1_65_95_without_outlier$probability_pairs,testeProb1_65_95_without_outlier$time_in_seconds, 
     main = "Teste Probabilidade 1 (65% a 95%) - Sem outliers", 
     xlab = "Probabilidade (em %)",
     ylab ="Tempo de execução (em segundos)")
plot(ag_testeProb1_65_95$probability_pairs,ag_testeProb1_65_95$time_in_seconds, 
     main = "Teste Probabilidade 1 (65% a 95%) - Sem outliers, valor médio por probabilidade", 
     xlab = "Probabilidade (em %)",
     ylab ="Tempo de execução (em segundos)")


#-----

testeProb2_65_95 = read.table("ResultsExams2.txt", header=TRUE)

n <- boxplot(time_in_seconds ~ probability_pairs, data = testeProb2_65_95);
testeProb2_65_95_without_outlier <- testeProb2_65_95[-which(testeProb2_65_95$time_in_seconds %in% n$out), ]
ag_testeProb2_65_95 = aggregate(time_in_seconds ~ probability_pairs, data = testeProb2_65_95_without_outlier, mean)

plot(testeProb2_65_95$probability_pairs,testeProb2_65_95$time_in_seconds, 
     main = "Teste Probabilidade 2 (65% a 95%) - Raw data", 
     xlab = "Probabilidade (em %)",
     ylab ="Tempo de execução (em segundos)")
plot(testeProb2_65_95_without_outlier$probability_pairs,testeProb2_65_95_without_outlier$time_in_seconds, 
     main = "Teste Probabilidade 2 (65% a 95%) - Sem outliers", 
     xlab = "Probabilidade (em %)",
     ylab ="Tempo de execução (em segundos)")
plot(ag_testeProb2_65_95$probability_pairs,ag_testeProb2_65_95$time_in_seconds, 
     main = "Teste Probabilidade 2 (65% a 95%) - Sem outliers, valor médio por probabilidade", 
     xlab = "Probabilidade (em %)",
     ylab ="Tempo de execução (em segundos)")


#-- GRAFICO BOM

plot(ag_testeProb1_65_95$probability_pairs,ag_testeProb1_65_95$time_in_seconds, 
     main = paste("------ Teste Probabilidade (65% a 92%) ------\n-> Número de Exames 20 (fixo) ; Probabilidade [65:1:92]\n->40 testes por valor de Probabilidade"), 
     xlab = "Probabilidade (em %)",
     ylab ="Tempo de execução (em segundos)",
     type = "l",
     col = "red")

lines(ag_testeProb2_65_95$probability_pairs,ag_testeProb2_65_95$time_in_seconds, 
      col = "blue")

legend( x="topleft", 
        legend=c("code1.c","code2.c"),
        col=c("red","blue"), lwd=1, lty=c(1,1), 
        pch=c(NA,NA) )










# ------------------ TESTES EXAME E PROB EXPERIENCIA ------------------ 

teste_exames10_40_prob1_16_1 = read.table("teste_exames10-40_prob1-16_1.txt", header=TRUE)

n <- boxplot(time_in_seconds ~ n_exams, data = teste_exames10_40_prob1_16_1);
teste_exames10_40_prob1_16_1_without_outlier <- teste_exames10_40_prob1_16_1[-which(teste_exames10_40_prob1_16_1$time_in_seconds %in% n$out), ]
ag_teste_exames10_40_prob1_16_1 = aggregate(time_in_seconds ~ n_exams, data = teste_exames10_40_prob1_16_1_without_outlier, mean)

plot(teste_exames10_40_prob1_16_1$n_exams,teste_exames10_40_prob1_16_1$time_in_seconds, 
     main = "Teste Exames e Prob Experiencia 1 - Raw data (Probabilidades 1 a 16)", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")
plot(teste_exames10_40_prob1_16_1_without_outlier$n_exams,teste_exames10_40_prob1_16_1_without_outlier$time_in_seconds, 
     main = "Teste Exames e Prob Experiencia 1 - Sem outliers (Probabilidades 1 a 16)", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")
plot(ag_teste_exames10_40_prob1_16_1$n_exams,ag_teste_exames10_40_prob1_16_1$time_in_seconds, 
     main = "Teste Exames e Prob Experiencia 1 - Sem outliers, valor médio por número de exames (Probabilidades 1 a 16)", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")

# ------------------  ------------------ 

teste_exames10_40_prob1_16_2 = read.table("teste_exames10-40_prob1-16_2.txt", header=TRUE)

n <- boxplot(time_in_seconds ~ n_exams, data = teste_exames10_40_prob1_16_2);
teste_exames10_40_prob1_16_2_without_outlier <- teste_exames10_40_prob1_16_2[-which(teste_exames10_40_prob1_16_2$time_in_seconds %in% n$out), ]
ag_teste_exames10_40_prob1_16_2 = aggregate(time_in_seconds ~ n_exams, data = teste_exames10_40_prob1_16_2_without_outlier, mean)

plot(teste_exames10_40_prob1_16_2$n_exams,teste_exames10_40_prob1_16_2$time_in_seconds, 
     main = "Teste Exames e Prob 1 - Raw data (Exames 10 a 60, 2 em 2)", 
     xlab = "Probabilidade",
     ylab ="Tempo de execução (em segundos)")
plot(teste_exames10_40_prob1_16_2_without_outlier$n_exams,teste_exames10_40_prob1_16_2_without_outlier$time_in_seconds, 
     main = "Teste Exames e Prob 1 - Sem outliers (Exames 10 a 60, 2 em 2)", 
     xlab = "Probabilidade",
     ylab ="Tempo de execução (em segundos)")
plot(ag_teste_exames10_40_prob1_16_2$n_exams,ag_teste_exames10_40_prob1_16_2$time_in_seconds, 
     main = "Teste Exames e Prob 1 - Sem outliers, valor médio por número de exames (Exames 10 a 60, 2 em 2)", 
     xlab = "Probabilidade",
     ylab ="Tempo de execução (em segundos)")




#-- GRAFICO BOM

plot(ag_teste_exames10_40_prob1_16_1$n_exams,ag_teste_exames10_40_prob1_16_1$time_in_seconds, 
     main = paste("------ Teste Número de Exames (10 a 40) ------\n-> Número de Exames [10:1:40] ; Probabilidade [1:1:16]\n-> 20 testes por valor de Número de Exames"), 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)",
     type = "l",
     col = "red")

lines(ag_teste_exames10_40_prob1_16_2$n_exams,ag_teste_exames10_40_prob1_16_2$time_in_seconds, 
      col = "blue")

legend( x="topleft", 
        legend=c("code1.c","code2.c"),
        col=c("red","blue"), lwd=1, lty=c(1,1), 
        pch=c(NA,NA) )




plot(testeProb1$probability_pairs,testeProb1$time_in_seconds)
plot(data2$probability_pairs,data2$time_in_seconds)


lm.out=lm(testeProb1$time_in_seconds~testeProb1$probability_pairs)
summar = summary(lm.out)
