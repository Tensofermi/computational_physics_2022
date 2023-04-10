import math as np
import random

def PDF(x):
    Z = 12.217257554294116
    res = np.exp(-0.5 * x*x - 3 * np.sin(23.5 *x + 2.3) )/Z
    return res

NC = int(10e5)  # sampling number
Nd = 2000  # bin preciseness

dis = [0]*(2*Nd+1)  # distribution

Pi = 3.1415926535897932384626433832795028841971693993751
ds = Pi/float(Nd)   # bin size

Nt = 1    # sampling indicator
X0 = 0.0  # initial config

cal = 0.0

for i in range(NC-1):
    cal = cal + X0*X0
    xtrial = 2.0*(random.random()-0.5)*Pi # range from [-Pi,Pi]
    ratio = PDF(xtrial)/PDF(X0)   # accpetable probability

    if(random.random()<=ratio):
        X0 = xtrial   # update X0
    Nt = Nt + 1    # sampling ++
    j = int(X0/ds) + Nd
    dis[j] = dis[j] + 1.0

rho = 0
for i in range(2*Nd+1):
    rho = rho + dis[i]/Nt
print(rho)

cal = cal/Nt
print(cal)