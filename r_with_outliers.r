# ------------------ TESTES PROBABILIDADE ------------------ 
testeProb1 = read.table("testeProb1.txt", header=TRUE)

n <- boxplot(time_in_seconds ~ probability_pairs, data = testeProb1)
ag_testeProb1 = aggregate(time_in_seconds ~ probability_pairs, data = testeProb1, mean)
ag_testeProb1_sd = aggregate(time_in_seconds ~ probability_pairs, data = testeProb1, sd)

plot(testeProb1$probability_pairs,testeProb1$time_in_seconds)

#-----
testeProb2 = read.table("testeProb2.txt", header=TRUE)

n <- boxplot(time_in_seconds ~ probability_pairs, data = testeProb2)
ag_testeProb2 = aggregate(time_in_seconds ~ probability_pairs, data = testeProb2, mean)
ag_testeProb2_sd = aggregate(time_in_seconds ~ probability_pairs, data = testeProb2, sd)

plot(testeProb2$probability_pairs,testeProb2$time_in_seconds)
plot(ag_testeProb2$probability_pairs,ag_testeProb2$time_in_seconds)

#-- GRAFICO BOM

plot(ag_testeProb1_sd$probability_pairs,ag_testeProb1_sd$time_in_seconds, 
     main = paste("------ Experiência 2 ------\n-> 20 exames ; Probabilidade [2:2:96]\n-> 40 testes por valor de probabilidade"), 
     xlab = "Probabilidade (em %)",
     ylab ="Desvio Padrão do Tempo de Execução (em segundos)",
     xlim = range(0:100),
     type = "l",
     col = "red")

lines(ag_testeProb2_sd$probability_pairs,ag_testeProb2_sd$time_in_seconds, 
      col = "blue")

legend( x="topleft", 
        legend=c("code1.c","code2.c"),
        col=c("red","blue"), lwd=1, lty=c(1,1), 
        pch=c(NA,NA) )







# ------------------ TESTES EXAMES ------------------ 
testeExams1 = read.table("testeExams1.txt", header=TRUE)

n <- boxplot(time_in_seconds ~ n_exams, data = testeExams1);
ag_testeExams1 = aggregate(time_in_seconds ~ n_exams, data = testeExams1, mean)
ag_testeExams1_sd = aggregate(time_in_seconds ~ n_exams, data = testeExams1, sd)

plot(testeExams1$n_exams,testeExams1$time_in_seconds, 
     main = "Teste Exames 1 - Raw data", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")
plot(ag_testeExams1$n_exams,ag_testeExams1$time_in_seconds, 
     main = "Teste Exames 1 - Valor médio por número de exames", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)",
     xlim = c(0,52),
     ylim = c(0,60))



#-----
testeExams2 = read.table("testeExams2.txt", header=TRUE)

n <- boxplot(time_in_seconds ~ n_exams, data = testeExams2);
ag_testeExams2 = aggregate(time_in_seconds ~ n_exams, data = testeExams2, mean)
ag_testeExams2_sd = aggregate(time_in_seconds ~ n_exams, data = testeExams2, sd)

plot(testeExams2$n_exams,testeExams2$time_in_seconds, 
     main = "Teste Exames 2 - Raw data", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")
plot(ag_testeExams2$n_exams,ag_testeExams2$time_in_seconds, 
     main = "Teste Exames 2 - Valor médio por número de exames", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")


#-- GRAFICO BOM

plot(ag_testeExams1_sd$n_exams,ag_testeExams1_sd$time_in_seconds, 
     main = paste("------ Experiência 1 ------\n-> Número de Exames [2:2:60] ; Probabilidade 20%\n-> 40 repetições"), 
     xlab = "Número de Exames",
     ylab ="Desvio Padrão do Tempo de Execução (em segundos)",
     type = "l",
     col = "red")

lines(ag_testeExams2_sd$n_exams,ag_testeExams2_sd$time_in_seconds, 
      col = "blue")

legend( x="topleft", 
        legend=c("code1.c","code2.c"),
        col=c("red","blue"), lwd=1, lty=c(1,1), 
        pch=c(NA,NA) )







# ------------------ TESTES EXAMES 35 60 ------------------ 
testeExames1_35_60 = read.table("testeExames1_35-60.txt", header=TRUE)

n <- boxplot(time_in_seconds ~ n_exams, data = testeExames1_35_60);
ag_testeExames1_35_60 = aggregate(time_in_seconds ~ n_exams, data = testeExames1_35_60, mean)
ag_testeExames1_35_60_sd = aggregate(time_in_seconds ~ n_exams, data = testeExames1_35_60, sd)

plot(testeExames1_35_60$n_exams,testeExames1_35_60$time_in_seconds, 
     main = "Teste Exames 1 (35 a 60) - Raw data", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")
plot(ag_testeExames1_35_60$n_exams,ag_testeExames1_35_60$time_in_seconds, 
     main = "Teste Exames 1 (35 a 60) - Valor médio por número de exames", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")


#-----

testeExames2_35_60 = read.table("testeExames2_35-60.txt", header=TRUE)

n <- boxplot(time_in_seconds ~ n_exams, data = testeExames2_35_60);
ag_testeExames2_35_60 = aggregate(time_in_seconds ~ n_exams, data = testeExames2_35_60, mean)
ag_testeExames2_35_60_sd = aggregate(time_in_seconds ~ n_exams, data = testeExames2_35_60, sd)

plot(testeExames2_35_60$n_exams,testeExames2_35_60$time_in_seconds, 
     main = "Teste Exames 2 (35 a 60) - Raw data", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")
plot(ag_testeExames2_35_60$n_exams,ag_testeExames2_35_60$time_in_seconds, 
     main = "Teste Exames 2 (35 a 60) - Valor médio por número de exames", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")


#-- GRAFICO BOM

plot(ag_testeExames1_35_60$n_exams,ag_testeExames1_35_60$time_in_seconds, 
     main = paste("------ Experiência 3 ------\n-> Número de Exames [35:1:60] ; Probabilidade 20%\n-> 60 testes por valor de Número de Exames"), 
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












# ------------------ TESTES EXAME E PROB - EXAMS ------------------ 

testeExames_Prob1 = read.table("teste_Exames_Prob1.txt", header=TRUE)

n <- boxplot(time_in_seconds ~ n_exams, data = testeExames_Prob1);
ag_testeExames_Prob1 = aggregate(time_in_seconds ~ n_exams, data = testeExames_Prob1, mean)
ag_testeExames_Prob1_sd = aggregate(time_in_seconds ~ n_exams, data = testeExames_Prob1, sd)

plot(testeExames_Prob1$n_exams,testeExames_Prob1$time_in_seconds, 
     main = "Teste Exames e Prob 1 - Raw data (Probabilidades 2,5,25,50)", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")
plot(ag_testeExames_Prob1$n_exams,ag_testeExames_Prob1$time_in_seconds, 
     main = "Teste Exames e Prob 1 - Valor médio por número de exames (Probabilidades 2,5,25,50)", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")

# ------------------  ------------------ 
testeExames_Prob2 = read.table("teste_Exames_Prob2.txt", header=TRUE)

n <- boxplot(time_in_seconds ~ n_exams, data = testeExames_Prob2);
ag_testeExames_Prob2 = aggregate(time_in_seconds ~ n_exams, data = testeExames_Prob2, mean)
ag_testeExames_Prob2_sd = aggregate(time_in_seconds ~ n_exams, data = testeExames_Prob2, sd)

plot(testeExames_Prob2$n_exams,testeExames_Prob2$time_in_seconds, 
     main = "Teste Exames e Prob 2 - Raw data (Probabilidades 2,5,25,50)", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")
plot(ag_testeExames_Prob2$n_exams,ag_testeExames_Prob2$time_in_seconds, 
     main = "Teste Exames e Prob 2 - Valor médio por número de exames (Probabilidades 2,5,25,50)", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")


#-- GRAFICO BOM EXAMES

plot(ag_testeExames_Prob1_sd$n_exams,ag_testeExames_Prob1_sd$time_in_seconds, 
     main = paste("------ Experiência 5 ------\n-> Número de Exames [10:2:60] ; Probabilidade [2, 5, 15, 25, 50]%)\n-> 20 testes por combinação"), 
     xlab = "Número de Exames",
     ylab ="Desvio Padrão do Tempo de Execução (em segundos)",
     type="l",
     col = "red")

lines(ag_testeExames_Prob2_sd$n_exams,ag_testeExames_Prob2_sd$time_in_seconds, 
      col = "blue")

legend( x="topleft", 
        legend=c("code1.c","code2.c"),
        col=c("red","blue"), lwd=1, lty=c(1,1), 
        pch=c(NA,NA) )




# ------------------ TESTES EXAME E PROB - PROBS ------------------ 

testeExames_Prob2 = read.table("teste_Exames_Prob2.txt", header=TRUE)

n <- boxplot(time_in_seconds ~ probability_pairs, data = testeExames_Prob2);
ag_testeExames_Prob2 = aggregate(time_in_seconds ~ probability_pairs, data = testeExames_Prob2, mean)

plot(testeExames_Prob2$probability_pairs,testeExames_Prob2$time_in_seconds, 
     main = "Teste Exames e Prob 2 - Raw data (Exames 10 a 60, 2 em 2)", 
     xlab = "Probabilidade",
     ylab ="Tempo de execução (em segundos)")
plot(ag_testeExames_Prob2$probability_pairs,ag_testeExames_Prob2$time_in_seconds, 
     main = "Teste Exames e Prob 2 - Valor médio por número de exames (Exames 10 a 60, 2 em 2)", 
     xlab = "Probabilidade",
     ylab ="Tempo de execução (em segundos)")

# ------------------  ------------------ 

testeExames_Prob1 = read.table("teste_Exames_Prob1.txt", header=TRUE)

n <- boxplot(time_in_seconds ~ probability_pairs, data = testeExames_Prob1);
ag_testeExames_Prob1 = aggregate(time_in_seconds ~ probability_pairs, data = testeExames_Prob1, mean)

plot(testeExames_Prob1$probability_pairs,testeExames_Prob1$time_in_seconds, 
     main = "Teste Exames e Prob 1 - Raw data (Exames 10 a 60, 2 em 2)", 
     xlab = "Probabilidade",
     ylab ="Tempo de execução (em segundos)")
plot(ag_testeExames_Prob1$probability_pairs,ag_testeExames_Prob1$time_in_seconds, 
     main = "Teste Exames e Prob 1 - Valor médio por número de exames (Exames 10 a 60, 2 em 2)", 
     xlab = "Probabilidade",
     ylab ="Tempo de execução (em segundos)")


#-- GRAFICO BOM PROBS

plot(ag_testeExames_Prob1$probability_pairs,ag_testeExames_Prob1$time_in_seconds, 
     main = paste("------ Teste Exames e Probabilidade ------\n-> Número de Exames [10:2:60] ; Probabilidade [2, 5, 15, 25, 50]%)\n-> 20 testes por combinação"), 
     xlab = "Probabilidade (em %)",
     ylab ="Tempo de execução (em segundos)",
     type="l",
     col = "red")

lines(ag_testeExames_Prob2$probability_pairs,ag_testeExames_Prob2$time_in_seconds, 
      col = "blue")

legend( x="topleft", 
        legend=c("code1.c","code2.c"),
        col=c("red","blue"), lwd=1, lty=c(1,1), 
        pch=c(NA,NA) )













# ------------------ TESTES PROBABILIDADE 65 95 PROBABILIDADE ------------------ 
testeProb1_65_95 = read.table("ResultsExames1.txt", header=TRUE)

n <- boxplot(time_in_seconds ~ probability_pairs, data = testeProb1_65_95);
ag_testeProb1_65_95 = aggregate(time_in_seconds ~ probability_pairs, data = testeProb1_65_95, mean)
ag_testeProb1_65_95_sd = aggregate(time_in_seconds ~ probability_pairs, data = testeProb1_65_95, sd)

plot(testeProb1_65_95$probability_pairs,testeProb1_65_95$time_in_seconds, 
     main = "Teste Probabilidade 1 (65% a 95%) - Raw data", 
     xlab = "Probabilidade (em %)",
     ylab ="Tempo de execução (em segundos)")
plot(ag_testeProb1_65_95$probability_pairs,ag_testeProb1_65_95$time_in_seconds, 
     main = "Teste Probabilidade 1 (65% a 95%) - Valor médio por probabilidade", 
     xlab = "Probabilidade (em %)",
     ylab ="Tempo de execução (em segundos)")


#-----

testeProb2_65_95 = read.table("ResultsExams2.txt", header=TRUE)

n <- boxplot(time_in_seconds ~ probability_pairs, data = testeProb2_65_95);
ag_testeProb2_65_95 = aggregate(time_in_seconds ~ probability_pairs, data = testeProb2_65_95, mean)
ag_testeProb2_65_95_sd = aggregate(time_in_seconds ~ probability_pairs, data = testeProb2_65_95, sd)

plot(testeProb2_65_95$probability_pairs,testeProb2_65_95$time_in_seconds, 
     main = "Teste Probabilidade 2 (65% a 95%) - Raw data", 
     xlab = "Probabilidade (em %)",
     ylab ="Tempo de execução (em segundos)")
plot(ag_testeProb2_65_95$probability_pairs,ag_testeProb2_65_95$time_in_seconds, 
     main = "Teste Probabilidade 2 (65% a 95%) - Valor médio por probabilidade", 
     xlab = "Probabilidade (em %)",
     ylab ="Tempo de execução (em segundos)")


#-- GRAFICO BOM PROBS

plot(ag_testeProb1_65_95_sd$probability_pairs,ag_testeProb1_65_95_sd$time_in_seconds, 
     main = paste("------ Experiência 4 ------\n-> Número de Exames 20 ; Probabilidade [65:1:95]\n-> 40 testes por valor de Probabilidade"), 
     xlab = "Probabilidade (em %)",
     ylab ="Desvio Padrão do Tempo de Execução (em segundos)",
     type = "l",
     col = "red")

lines(ag_testeProb2_65_95_sd$probability_pairs,ag_testeProb2_65_95_sd$time_in_seconds, 
      col = "blue")

legend( x="topleft", 
        legend=c("code1.c","code2.c"),
        col=c("red","blue"), lwd=1, lty=c(1,1), 
        pch=c(NA,NA) )








# ------------------ TESTES EXAME E PROB EXPERIENCIA EXAMES ------------------ 

teste_exames10_40_prob1_16_1 = read.table("teste_exames10-40_prob1-16_1.txt", header=TRUE)

n <- boxplot(time_in_seconds ~ n_exams, data = teste_exames10_40_prob1_16_1)
ag_teste_exames10_40_prob1_16_1 = aggregate(time_in_seconds ~ n_exams, data = teste_exames10_40_prob1_16_1, mean)
ag_teste_exames10_40_prob1_16_1_sd = aggregate(time_in_seconds ~ n_exams, data = ag_teste_exames10_40_prob1_16_1, sd)


plot(teste_exames10_40_prob1_16_1$n_exams,teste_exames10_40_prob1_16_1$time_in_seconds, 
     main = "Teste Exames e Prob Experiencia 1 - Raw data (Probabilidades 1 a 16)", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")


plot(ag_teste_exames10_40_prob1_16_1$n_exams,ag_teste_exames10_40_prob1_16_1$time_in_seconds, 
     main = "Teste Exames e Prob Experiencia 1 - Valor médio por número de exames (Probabilidades 1 a 16)", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")

# ------------------  ------------------ 

teste_exames10_40_prob1_16_2 = read.table("teste_exames10-40_prob1-16_2.txt", header=TRUE)

n <- boxplot(time_in_seconds ~ n_exams, data = teste_exames10_40_prob1_16_2);
ag_teste_exames10_40_prob1_16_2 = aggregate(time_in_seconds ~ n_exams, data = teste_exames10_40_prob1_16_2, mean)
ag_teste_exames10_40_prob1_16_2_sd = aggregate(time_in_seconds ~ n_exams, data = teste_exames10_40_prob1_16_2, sd)


plot(teste_exames10_40_prob1_16_2$n_exams,teste_exames10_40_prob1_16_2$time_in_seconds, 
     main = "Teste Exames e Prob 1 - Raw data (Exames 10 a 60, 2 em 2)", 
     xlab = "Número de Exame",
     ylab ="Tempo de execução (em segundos)")
plot(ag_teste_exames10_40_prob1_16_2$n_exams,ag_teste_exames10_40_prob1_16_2$time_in_seconds, 
     main = "Teste Exames e Prob 1 - Valor médio por número de exames (Exames 10 a 60, 2 em 2)", 
     xlab = "Número de Exames",
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










# ------------------ TESTES EXAME E PROB EXPERIENCIA PROBABILIDADE------------------ 

teste_exames10_40_prob1_16_1 = read.table("teste_exames10-40_prob1-16_1.txt", header=TRUE)

n <- boxplot(time_in_seconds ~ probability_pairs, data = teste_exames10_40_prob1_16_1)
ag_teste_exames10_40_prob1_16_1 = aggregate(time_in_seconds ~ probability_pairs, data = teste_exames10_40_prob1_16_1, mean)
ag_teste_exames10_40_prob1_16_1_sd = aggregate(time_in_seconds ~ probability_pairs, data = ag_teste_exames10_40_prob1_16_1, sd)


plot(teste_exames10_40_prob1_16_1$probability_pairs,teste_exames10_40_prob1_16_1$time_in_seconds, 
     main = "Teste Exames e Prob Experiencia 1 - Raw data (Probabilidades 1 a 16)", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")


plot(ag_teste_exames10_40_prob1_16_1$probability_pairs,ag_teste_exames10_40_prob1_16_1$time_in_seconds, 
     main = "Teste Exames e Prob Experiencia 1 - Valor médio por número de exames (Probabilidades 1 a 16)", 
     xlab = "Número de Exames",
     ylab ="Tempo de execução (em segundos)")

# ------------------  ------------------ 

teste_exames10_40_prob1_16_2 = read.table("teste_exames10-40_prob1-16_2.txt", header=TRUE)

n <- boxplot(time_in_seconds ~ probability_pairs, data = teste_exames10_40_prob1_16_2);
ag_teste_exames10_40_prob1_16_2 = aggregate(time_in_seconds ~ probability_pairs, data = teste_exames10_40_prob1_16_2, mean)
ag_teste_exames10_40_prob1_16_2_sd = aggregate(time_in_seconds ~ probability_pairs, data = teste_exames10_40_prob1_16_2, sd)


plot(teste_exames10_40_prob1_16_2$probability_pairs,teste_exames10_40_prob1_16_2$time_in_seconds, 
     main = "Teste Exames e Prob 1 - Raw data (Exames 10 a 60, 2 em 2)", 
     xlab = "Probabilidade",
     ylab ="Tempo de execução (em segundos)")
plot(ag_teste_exames10_40_prob1_16_2$probability_pairs,ag_teste_exames10_40_prob1_16_2$time_in_seconds, 
     main = "Teste Exames e Prob 1 - Valor médio por número de exames (Exames 10 a 60, 2 em 2)", 
     xlab = "Probabilidade",
     ylab ="Tempo de execução (em segundos)")




#-- GRAFICO BOM

plot(ag_teste_exames10_40_prob1_16_1$probability_pairs,ag_teste_exames10_40_prob1_16_1$time_in_seconds, 
     main = paste("------ Teste Probabilidade (1% a 16%) ------\n-> Número de Exames [10:1:40] ; Probabilidade [1:1:16]\n-> 20 testes por valor de Probabilidade"), 
     xlab = "Probabilidade (em %)",
     ylab ="Tempo de execução (em segundos)",
     type = "l",
     col = "red")

lines(ag_teste_exames10_40_prob1_16_2$probability_pairs,ag_teste_exames10_40_prob1_16_2$time_in_seconds, 
      col = "blue")

legend( x="topleft", 
        legend=c("code1.c","code2.c"),
        col=c("red","blue"), lwd=1, lty=c(1,1), 
        pch=c(NA,NA) )




plot(testeProb1$probability_pairs,testeProb1$time_in_seconds)
plot(data2$probability_pairs,data2$time_in_seconds)


lm.out=lm(testeProb1$time_in_seconds~testeProb1$probability_pairs)
summar = summary(lm.out)
