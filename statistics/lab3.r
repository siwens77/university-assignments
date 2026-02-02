set.seed(164186)
#1)
n=30
p=0.3
rbinom(1,n,p)

#2)
par(mfrow=c(1,2))
prob1=rbinom(20,30,0.3)
prob2=rbinom(2000,30,0.3)
hist(prob1, xlim=c(0,30), main=paste0("20 numbers"))
hist(prob2, xlim=c(0,30), main=paste0("2000 numbers"))

#3)
#S~number of wells contaminated
#S~binom(n=5,p=0.3)
dbinom(3,5,0.3)
1-pbinom(2,5,0.3)
pbinom(3,5,0.3)


#4)
#B~number of bulbs burning at least 500hrs
#B~binom(n=8,p=0.9)
n=8
p=0.9
dbinom(8,n,p)
dbinom(7,n,p)
1-pbinom(6,n,p)
E=n*p
SD=sqrt(n*p*(1-p))

#5)
#C~Poiss(lambda=0.01)
lambda=0.01
curve(dexp(x,lambda),xlim=c(0,400))
1-pexp(200,lambda)
pexp(100,lambda)
pexp(499,lambda)

#6
#E~Poiss(lambda=1/2.4)
#E~magnitude
lambda=1/2.4
1-pexp(3,lambda)
pexp(3,lambda)-pexp(2,lambda)
curve(dexp(x,lambda), xlim=c(0,3))

#7)
#W~norm(mu=0.13,sig=0.005)
#W~resistance of wire
mu=0.13
sig=0.005
curve(dnorm(x,mu,sig), xlim=c(mu-3*sig, mu+3*sig),col="RED")
pnorm(0.14,mu,sig)-pnorm(0.12,mu,sig)

#8)
#D~norm(mu=120,sig=15)
#D~Drying time
mu=120
sig=15
curve(dnorm(x,mu,sig), xlim=c(mu-3*sig, mu+3*sig),col="BLUE",
      main=paste0("N(120,15)"), xlab="Drying time", ylab="Probability")
pnorm(135,mu,sig)-pnorm(110,mu,sig)

#9)
#S~speed of motorcycle
#S~norm(mu=46.8, sig=1.75)
mu=46.8
sig=1.75
pnorm(50,mu,sig)
1-pnorm(48,mu,sig)

#10)
n=20
p=0.2
data=rbinom(500,n,p)
mu=n*p
sigma=sqrt(n*p*(1-p))
par(mfrow=c(1,3))
discrete.histogram(data)
plot(dbinom(0:20,n,p),type="h")
curve(dnorm(x,mu,sigma),xlim=c(0,20),add=TRUE,col="red")

par(mfrow=c(1,1))
hist(data,xlim=c(0,20), freq=FALSE)
curve(dnorm(x,mu,sigma), from=0,to=20,add=TRUE, col="red")

#11)
#X~number of students who applied to financial aid
#X~norm(n,p)
#Xhat~app~norm(np,sqrt(np(1-p)))
n=100
p=0.25
mu=n*p
sig=sqrt(n*p*(1-p))
pnorm(15,mu,sig)#app
pbinom(15,n,p)#exactly

#12)
mm=rep(0,0)
for(s in 1:200){
  sample=rnorm(30)
  mm[s]=mean(sample)
}
hist(mm, freq=FALSE)
curve(dnorm(x,0,1/sqrt(30)), add=TRUE,col="PINK")

#14)
#R~norm(mu=200,sig=0)
#R~resistance of ONE resistor
#Rtotal~norm(mu*n,sig*sqrt(n))
n=50
mu=200
sig=10
pnorm(202,mu,sig/sqrt(n))-pnorm(199,mu,sig/sqrt(n))
pnorm(10020, mu*n, sig*sqrt(n))

#15)
#C~?(mean=202,sd=14)
#C~cholesterol of one person
#C~app~N(mu,sig)
mu=202
sig=14
n=64
pnorm(206,mu,sig/sqrt(n))-pnorm(198,mu,sig/sqrt(n))

#16)
#S~strength of one thread
#S~?(mean,sd)
#Stotal~strength of rope
#Stotal~app~norm(mu,sig)
mu=0.5
sig=0.2
n=100
1-pnorm(47, mu*n, sig*sqrt(n))