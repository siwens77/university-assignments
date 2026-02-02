therapy = c(8, 12, 26, 10, 23, 21, 16, 22, 18,17, 36, 9)
mean(therapy)
#the mean time to recover by ALL patients using the therapy 
#is estimated to be 18h10min: x_=mu^

#------------------------
#example1, we dont know sd - 3rd case
alpha=0.05
n=length(therapy)
s=sd(therapy)
xbar=mean(therapy)
q=qt(1-alpha/2, n-1)

L=xbar-q*s/sqrt(n)
U=xbar+q*s/sqrt(n)
L
U
U-L
#we are 95% confident that the interval from 13h to 24h covers
#the true mean time spent by ALL patients under recovery
ttt=t.test(therapy)
ttt$conf.int



