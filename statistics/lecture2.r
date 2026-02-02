n = 300#num of trials
x = 0:n#range
p = 0.6#prob of win
prob = dbinom(x, n,p)#binomial distribution 
rbind(x,prob)
sum(dbinom(2:3,n,p))#P(X>=2)
sum(prob[x>=2])#P(X>=2)
prob[x==2]#P(X=2)
expect = sum(x*prob)#expected value
var = (sum(x^2*prob)-expect^2)#variance
sqrt(var)#standard deviation 
plot(x,dbinom(x,n,p), type="h")#graph



f=function(x){0.01*exp(-0.01*x)}
integrate(f,0,50)#density function(P(X<=50))

#cumulative function = how is area changing when x changing
#important to remember P(X<=a)=F(a)

lambda=0.01
pexp(50,lambda)#exp distribution

#normal distribution
mu =30
sig=0.2
pnorm(29.55,mu,sig)#F(29.55) in normal distribution


#example 3
#X_i ~ N(miu, sig)
miu = 70
sig=10
n=8

# T=X_1+...X_9 ~ N(n mu, sqrt(n) sig)
#P(T>650)
muT=n*mu
sigT=sqrt(n)*sigT

1-pnorm(650, muT, sigT)
