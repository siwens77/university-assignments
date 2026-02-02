data = read.csv("data_twoPop.csv", sep=";")
#exercise1
#a)
#H0: S1^2 = S2^2 
#H1: S1^2 != S2^2 
#cel1, cel2 ~ N
cel1 = na.omit(data$cellulose1)
cel2 = na.omit(data$cellulose2)
n1 = length(cel1)
n2 = length(cel2)
alpha = 0.02
U = qf(1-alpha/2, n1-1,n2-1)
L = qf(alpha/2, n1-1,n2-1)
f = var(cel1)/var(cel2)
#R = (0, 0.16) and (3.7, +inf)
#f not in R so no reason to reject H0
var.test(cel1,cel2, alternative = "two.sided")
#p-value = 0.32 > alpha so no reason to reject H0
#b)
#H0: mu1-mu2=0
#H1: mu1-mu2!=0
t.test(cel1,cel2,var.equal=TRUE,conf.level = 1-alpha,)
#p-value = 0.135 > alpha = 0.02
#no reason to reject H0
#c)
t.test(cel1,cel2,var.equal=TRUE,conf.level = 1-alpha, "two.sided")


#exercise 2
#a)
#H0: var1=var2
#H1: var1!=var2
trad=na.omit(data$traditional)
new=na.omit(data$new)
n1=length(trad)
n2=length(new)
alpha = 0.1

f=var(trad)/var(new)
L=qf(alpha/2, n1-1,n2-2)
U=qf(1-alpha/2, n1-1,n2-2)
#R = (0,0.18) and (5.3,+inf)
#f = 0.53 so not in R so no reason to reject H0 we can assume
#variances are the same

#H0: muT<=muN
#H1: muT>muN
xbar= mean(trad)
ybar = mean(new)
Ssqrp=((n1-1)*var(trad)+(n2-1)*var(new))/(n1+n2-2)
t=(xbar-ybar)/sqrt(Ssqrp*((1/n1)+(1/n2)))#t=-0.29
L=-qt(1-alpha/2,n1+n2-2)
U=qt(1-alpha/2,n1+n2-2)                     
#R=(-inf, -1.7) and (1.7, +inf)
#t not in R so no reason to reject H0
t.test(trad,new,var.equal = TRUE,alternative="greater", conf.level = 1-alpha)
#p-value=0.61 > alpha=0.1 so no reason to reject H0


#exercise 3
public=na.omit(data$public)
private=na.omit(data$private)
#H0: var1!=var2
#H0: var1=var2
alpha=0.1
var.test(public,private, alternative="two.sided", conf.level=1-alpha)
#p-value = 0.08 < alpha = 0.1
#reject H0 so variances are different

#H0: muPub>=muPriv
#H1: muPub<muPriv
t.test(public, private, var.equal= FALSE, alternative="less")
#t=-2.1
#p-value=0.023 < alpha=0.1
#reject H0


#exercise 4
#H0: var1>=var2
#H1: var1<var2
player1=na.omit(data$player1)
player2=na.omit(data$player2)
var.test(player1,player2,conf.level=0.95, alternative="less")
#p-value=0.21 > alpha=0.05
#no reason to reject H0


#exercise 5
medicine1=na.omit(data$medicine1)
medicine2=na.omit(data$medicine2)
#H0: var1=var2
#H1: var1!=var2
alpha=0.1
var.test(medicine1, medicine2, alternative="two.sided", conf.level=1-alpha)
#p-value=0.64 > alpha =0.1
#no reason to reject H0
#H0: mu1<=mu2
#H1: mu1>mu2
t.test(medicine1,medicine2, var.equal= TRUE, alternative="greater")
#p-value=0.08 < alpha =0.1
#reject H0


#exercise 6
alpha=0.1
n1=1200
phat1=0.78
n2=2000
phat2=0.8
T1=phat1*n1
T2=phat2*n2
L=phat1-phat2-qnorm(1-alpha/2)*sqrt(phat1*(1-phat1)/n1+phat2*(1-phat2)/n2)
U=phat1-phat2+qnorm(1-alpha/2)*sqrt(phat1*(1-phat1)/n1+phat2*(1-phat2)/n2)
c(L,U)
prop.test(c(T1,T2), c(n1,n2), conf.level=1-alpha)
#b)
#H0: p1>=p2
#H1: p1<p2
phat=(T1+T2)/(n1+n2)
Z=(phat1-phat2)/sqrt(phat*(1-phat)*(1/n1+1/n2))
U=-(qnorm(1-alpha))
#R=(-inf, -1.28)
#Z=-1.35 so in R so reject H0
prop.test(c(T1,T2), c(n1,n2), conf.level=1-alpha,alternative="less")


#exercise 7
#H0: p1 = p2
#H1: p1 != p2
n1=313+28
n2=145+56
phat1=313/n1
phat2=145/n2
alpha=0.05
phat=(313+145)/(313+28+145+56)
Z=(phat1-phat2)/sqrt(phat*(1-phat)*(1/n1+1/n2))
U=qnorm(1-alpha/2)
L=-U
#R =(-inf, -1.96) and (1.96 +inf)
#Z = 6.1 so in R so reject H0 so it depends on region
#b)
prop.test(c(313,145),c(n1,n2),conf.level=1-alpha)
#we are 95% sure that p1-p2 is between 0.12 and 0.27
#its not crossing zero so it confirms that they are different

#exercise 8
#H0: p1-p2>=0
#H1: p1-p2<0
prop.test(c(47,62),c(1000,1000),alternative= "less")
#p-value = 0.08 > alpha = 0.05
#do not reject H0, choose design B


#exercise 9
#H0: before=after
#H1: before!=after
before=na.omit(data$drugBefore)
after=na.omit(data$drugAfter)
n=9
D=before-after
Dbar=mean(D)
Ssqr=var(D)
t=Dbar/(sqrt(Ssqr)/sqrt(n))
U=qt(1-alpha/2,n-1)
L=-U
#R = (-inf,-2.3 ) and (2.3,inf)
#t not in R so no reason to reject H0
t.test(D,mu=0,alterative="two.sided")


#exercise 10
#H0: before=after
#H1: before!=after
ph1=na.omit(data$pH15)
ph2=na.omit(data$pH100)
D=ph1-ph2
alpha=0.1
n=length(D)
Dbar=mean(D)
Ssqr=var(D)
t=Dbar/(sqrt(Ssqr)/sqrt(n))
U=qt(1-alpha/2,n-1)
L=-U
#R = (inf,-2.3) and (2.3,inf)
#t = -1.31 so not in R so no reason to reject H0
#b)
t.test(D)
#p-value=0.23 > alpha=0.1 so no reason to reject H0