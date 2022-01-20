from random import *

n = 20
eps = 0.01
maxr = n/2

f = open("data.in","w")
f.write(str(eps) + " " + str(n))

for i in range(n):
    f.write(" " + str(randint(1,maxr)))
f.write("\n")

f.close()
