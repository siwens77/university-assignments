#example1
type1=c(2830,2840,2800,2880,2820)
type2=c(2790 ,2720 ,2770, 2780, 2760)
alpha=0.01
#case(1)
n1=length(type1)
n2=length(type2)
xbar=mean(type1)
ybar=mean(type2)
df=n1+n2-2
s1sq=var(type1)
s2sq=var(type2)
spsq=((n1-1)*s1sq+(n2-1)*s2sq)/df
quant=qt(1-alpha/2, df)
L=xbar-ybar-quant*sqrt(spsq*(1/n1+1/n2))
U=xbar-ybar+quant*sqrt(spsq*(1/n1+1/n2))
#we are 99% confident that the interval from 9.7h
#to 130.3h covers the true difference in 
#mean life time of two types of bulbs
t.test(type1,type2, var.equal = TRUE, conf.level = 1-alpha)


#b)
#H0:mu1 <= mu2
#H1:mu1 > mu2
mu0=0
t=(xbar-ybar-mu0)/sqrt(spsq*(1/n1+1/n2)) #3.9
qt(1-alpha,df) #2.9
#R = (2.9, inf)
#t=3.9 belongs to R   ->   H0 is rejected
#on significance 1% data confirms that the mean lifetime
#of the first type of bulbs is longer than the mean lifetime
#of the second type of bulbs
t.test(type1,type2, var.equal=TRUE, alternative="greater")
#alpha = 0.01  > 0.02=p-value   ->   H0 is rejected



#sigma(cont)
#H0: sigma1sq  = sigma2sq
#H1: sigma1sq  != sigma2sq
var.test(type1,type2)
#alpha = 0.01 <  0.86=pval.  -> H0 is not rejected
#there is no evidence that variances of these two populations
#of bulbs lifetime are significantly different

f=s1sq/s2sq
qf(alpha/2, n1-1,n2-1)
qf(1-alpha/2, n1-1,n2-1)
#R = (0,0.04) or (23.16, inf)
#f=1.2
#f does not belong to R.  ->  H0 is not rejected


#--------


#example2
#H0: p1 >= p2
#H1: p1 < p2
n1=200
n2=200
T1=110
T2=130
p1hat=T1/n1
p2hat=T2/n2
phat=(T1+T2)/(n1+n2)
z=(p1hat-p2hat)/sqrt(phat*(1-phat)*(1/n1+1/n2)) #-2

alpha=0.05
qnorm(1-alpha)
#R=(-inf, -1.64)
#z=-2 belongs to R   ->  H0 is rejected
#there is an evidence that acceptance rate for the design A is 
#significantly lower than for the design B
prop.test(c(T1,T2), c(n1,n2), alternative = "less")
#alpha=0.05.  >   0.02=p-value.  ->    H0 is rejected



#example3
before = c(70, 80, 72, 76, 76, 76, 72, 78, 82, 64, 74, 92, 74, 68, 84)
after = c(68, 72, 62, 70, 58, 66, 68, 52, 64, 72, 74, 60, 74, 72, 74)
alpha=0.05
diff=after-before
t.test(diff)
#we are 95% confident that the interval (14.88 , -2.7) covers
#the true difference in mean blood pressures

#H0: mu_before <= mu_after.   mu_D >= 0
#H1:mu_before > mu_after.     mu_D < 0
t.test(diff, alternative = "less")
#alpha=0.05 >  0.0038=p-value    ->.  so H0 is rejected 
#data confirms significantly dicreasing effect of a pill