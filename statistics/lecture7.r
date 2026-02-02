#example1
data = read.csv("mine.csv", sep=";")
b1 = na.omit(data$b1)
b2 = na.omit(data$b2)
b3 = na.omit(data$b3)

n1=length(b1)
n2=length(b2)
n3=length(b3)
n=n1+n2+n3

t1=sum(b1)
t2=sum(b2)
t3=sum(b3)
t=t1+t2+t3

SSG=sum(b1^2)+sum(b2^2)+sum(b3^2)-t^2/n #df = n-1 = 26
SST=t1^2/n1+t2^2/n2+t3^2/n3-t^2/n #df = k-1 = 2
SSE = SSG - SST #df = n-k = 24

MST=SST/2
MSE=SSE/24

F=MST/MSE
alpha = 0.05
qf(1-alpha, 2,24)
#R = (3.4, inf)
#F belongs to R so H0 is rejected
#not all of them are similar populations



#example2
#H0: var1=var2=var3
#H1: ~H0
data=read.csv("mine.csv", sep=";")
alpha=0.05
results=c(na.omit(data$b1), na.omit(data$b2), na.omit(data$b3))
treatments=rep(c("b1","b2","b3"), c(length(na.omit(data$b1)), length(na.omit(data$b2)), length(na.omit(data$b3))))
bartlett.test(results~treatments)
#p-value=0.7734 > alpha = 0.05 so no reason to reject H0
#we can perform ANOVA

#H0: mu1=mu2=mu3
#H1: ~H1
anova(lm(results~treatments))
#Pr(>F)=0.03056 < alpha = 0.05 so reject H0

#Benferroni method
n1=length(na.omit(data$b1))
xbar1=mean(na.omit(data$b1))
n2=length(na.omit(data$b2))
xbar2=mean(na.omit(data$b2))
n3=length(na.omit(data$b3))
xbar3=mean(na.omit(data$b3))
k=3
n=n1+n2+n3
m=k*(k-1)/2
MSE=39.94
SE12=qt(1-alpha/(2*m),n-k)*sqrt(MSE*(1/n1+1/n2))
R12 = c(xbar1-xbar2-SE12, xbar1-xbar2+SE12)
#R12 includes 0 so no significant difference in mu1 and mu2


#The Least Significance difference (Fisher)
alpha=0.05
xbar3=30
xbar1=37.556
xbar2=37.6
MSE=39.94
LSD12=qt(1-alpha/2, n-k)*sqrt(MSE*(1/n1+1/n2))
xbar12 = abs(xbar1-xbar2)
#xbar12 = 0.04 < LSD12 = 5.993 so no significant difference



#The Honest Significance Difference (Tukey)
HSD12=qtukey(1-alpha,k,n-k)*sqrt(MSE*0.5*(1/n1+1/n2))
xbar12 = abs(xbar1-xbar2)
#xbar12 = 0.044 < HSD = 7.25 so no significanct difference

plot(TukeyHSD(aov(results~treatments), ordered=TRUE))
