#example 2
#H0: mu<=50
#H1: mu>50
# normality, sigma unknown (3)
data=c(53.417, 51,48.583,53,49,51,52,50)
alpha=0.05
S=sd(data)
xbar=mean(data)
n=length(data)
mu0=50

t=(xbar-mu0)/(S/sqrt(n)) #t=1.6
qt(1-alpha,n-1)
#R=(1.89, +inf)

#t doesn't belong to R -> H0 is not rejected

#on significance level 5% data does not confirm that 
#the average life of produced tires is more than 50.000miles
t.test(data,mu=mu0,alternative="greater")
#if alpha<p-value -> H0 not reject
#if alpha>p-value -> H0 reject
#p-value = minimum value of alpha to reject H0

#----------

#example3
#H0:sigmasq >= 25
#H1:sigmasq < 25
time = c(10, 10, 15, 12, 9, 8, 4, 10, 3, 4, 6, 5, 7, 8, 13)
alpha=0.05
sigma0sq=25
ssq=var(time)
n=length(time)
chisq=(n-1)*ssq/sigma0sq #6.91
qchisq(alpha,n-1) #6.57
#R=(0,6.57)
#chisq does not belong to R -> H0 is not rejected
#on significance level 5% data does not confirm that
#variance of waiting time is less than 25

sigma.test(time,sigmasq=sigma0sq, alternative="less")
#alpha=0.05 is lower than p-value=0.06 -> H0 not rejected



#-----------



#example 4
#H0: p = 0.5
#h1: p != 0.5
n=200
T=111
phat=T/n
p0=0.5
Z=(phat-p0)/sqrt(p0*(1-p0)/n) #1.56
qnorm(1-alpha/2)
#R=(-inf, -1.96) or (1.96,inf)
#z does not belong to R -> H0 not rejected
#on significance level 5% does not confirm that 
#proportion have changed

binom.test(T,n,p=p0)
prop.test(T,n,p=p0)


