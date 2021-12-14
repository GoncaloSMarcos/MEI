dados = read.table("in.txt", header=TRUE)
A = c(dados$alg_a)
B = c(dados$alg_b)
C = c(dados$alg_c)
D = A - B
E = A - C
t.test(A,B,paired=TRUE, conf.level = 0.9)
t.test(A,C,paired=TRUE, conf.level = 0.9)

qqnorm(D)
qqline(D)

qqnorm(E)
qqline(E)
