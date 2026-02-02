data = read.csv("data_hip.csv", sep=";")

#exercise 1
win = na.omit(data$wind)
mu0=4
#H0: mu2<=4
#H1: mu2>4
alpha=0.05
xbar = mean(win)
S=sd(win)
n=length(win)
t=(xbar-mu0)/(S/sqrt(n))
quant = qt(1-alpha, n-1)
#R = (1.796, inf)
#Reject H0
t.test(win, mu=mu0, alternative="greater")
#p-value < alpha -> reject H0


#exercise 2
pump = na.omit(data$COP)
mu0=3.5
#H0: mu >= mu0
#H1: mu < mu0
alpha=0.01
xbar=mean(pump)
S=sd(pump)
n=length(pump)
t=(xbar-mu0)/(S/sqrt(n))
quant=-qt(1-alpha,n-1)
#R = (-inf, -2.8)
#there is no reason to reject H0
t.test(pump,mu=mu0,alternative="less")
#p-value > alpha -> not reject H0



#exercise 3
sprinkler = na.omit(data$temperature)
#H0: mu = mu0
#H1: mu != mu0
mu0=54
alpha=0.01
S=2
n=length(sprinkler)
xbar=mean(sprinkler)
z = (xbar-mu0)/(S/sqrt(n))
quant = qnorm(1-alpha/2) #2.57
#R = (-inf,-2.57) or (2.57,inf)
#z is not in R so there is not reason to reject H0
z.test(sprinkler,sigma.x = S, mu=mu0, alternative="two.sided")  
#p-value > alpha -> no reason to reject H0



#exercise 4
S=5
dep = na.omit(data$depth)
n=length(dep)
alpha=0.05
mu0 =870
xbar =mean(dep)
#H0: mu= mu0
#H1: mu != mu0
z = (xbar-mu0)/(S/sqrt(n))
quant = qnorm(1-alpha/2)
#R = (-inf, -1.96) or (1.96, inf)
#z is not in R so there is no reason to reject H0
z.test(dep,sigma.x = S, mu=mu0, alternative="two.sided")
#p-value > alpha -> no reason to reject H0



#exercise 5
thick = na.omit(data$thickness)
#H0: mu>=mu0
#H1: mu<mu0
mu0=0.04
n=length(thick)
alpha=0.05
xbar=mean(thick)
S=sd(thick)
z=(xbar-mu0)/(S/sqrt(n))
quant = qnorm(1-alpha)
#R = (-inf, 1.6)
#z is in R so H0 is rejected
zsum.test(xbar,S,n,mu=mu0,alternative="less")
#p-value < alpha -> H0 is rejected



#exercise 6
cuck = na.omit(data$length)
#a)
#H0: mu = 16
#H1: mu != 16
mu0=16
S=sd(cuck)
n=length(cuck)
alpha=0.05
xbar=mean(cuck)
t=(xbar-mu0)/(S/sqrt(n))#4.9268
qt(1-alpha/2,n-1)
#R = (-inf, -2) or (2,inf)
#t in R so H0 is rejected
t.test(cuck,mu=mu0,alternative="two.sided")

#b)
sigma0 = 3
S = sd(cuck)
#H0: sigma = 3
#H1: sigma != 3
chis = (n-1)*S^2/sigma0^2 #10.7
q1 = qchisq(alpha/2,n-1) #9.6
q2 = qchisq(1-alpha/2, n-1) #
#R = (0, 9.6) or (34, inf)
#chis not in critical region so no reason to reject H0
sigma.test(cuck, sigmasq = sigma0, alternative = "two.sided")

#c)
t.test(cuck) #(17.36, 19.37)



#exercise 8
mu0 =55
sigma0 = 18
n=100
xbar = 60
S = 20
alpha=0.01
#H0: mu <= mu0.  and.  sigma <= sigma0
#H1: mu > mu0.   and.  sigma > sigma0

Z = (xbar - mu0)/(S/sqrt(n))# 2.5
qnorm(1-alpha)
#R = (-inf, -2.3) and (2.3, inf)
#Z is in R so reject H0
chis = (n-1)*S^2/sigma0^2#122.22
q1 = qchisq(alpha/2,n-1)
q2 = qchisq(1-alpha/2,n-1)
#R = (0, 66.5) and (138.99, inf)
#chis is not in R so there is no reason to reject H0

#this company is against the law



#exercise 9
#H0: p <= 0.9
#H1: p > 0.9
n=1100
t=n-100
phat = t/n
p0=0.9
alpha=0.05
n=1100
Z = (phat-p0)/(sqrt(p0*(1-p0))/sqrt(n)) #1.005
quan = qnorm(1-alpha) #1.64
#R = (1.64, inf)
#Z not in R so no reason to reject H0
binom.test(t,n,p=p0,alternative="greater")
prop.test(t,n,p=p0,alternative="greater")



#exercise 10
#H0: p != p0
#H1: p = p0
n=150
t=82
phat=t/n
p0=0.4
alpha=0.01
Z = (phat-p0)/(sqrt(p0*(1-p0))/sqrt(n)) #3.6
q1 = qnorm(1-alpha) #2.3
#R = (-inf, -2.3) or (2.3, inf)
#Z is in R so reject H0

