#example 1
#H0: nu_i=20 (vi=vi0 for all i)
#H1: there exists nu_i != 20
obs = c(32, 28, 16, 14, 10)
expect = c(20, 20, 20, 20, 20)
alpha=0.05
k=length(obs)
sum((obs-expect)^2/expect)
qchisq(1-alpha,k-1)
#R = (9.49, +inf)
#chisqtest=18
#test statistic in R -> reject H0
#data confirms that there are significant differences in flavours

chisq.test(obs, p=exp/(sum(expect)))
#p-value=0.001 < alpha -> reject H0




#test for normality (wtf xd)
raw_data=read.csv("normality_data.csv", sep=";")
t=raw_data$t
summary(t)
xbar=mean(t)
s=sd(t)
n=length(t)

k=length(br)-1
br=seq(83,164,length=7)
hist(t,prob=TRUE,breaks=br)
curve(dnorm(x,xbar,s), xlim=c(br[1], br[k+1]), col=3, add=T)

#frequency table
data=cut(t,br)
y=table(data)
y

#compute vector with frequencies
observedf=c();
for(i in 1:dim(y)){
  observedf=c(observedf,y[[i]])
}
observedf

#compute probabilities for every interval (expected probabilites)
normprobabilities=c();
for (i in 1:length(br)-1){
  normprobabilities=c(normprobabilities, pnorm(br[i+1],xbar,s)-pnorm(br[i],xbar,s)) 
}
normprobabilities

#it fails because first and last interval must be extended
#chisq.test(observedf, p=normprobabilities)

normprobabilities[1]=pnorm(br[2],xbar,s)
normprobabilities[length(br)-1]=1-pnorm(br[length(br)-1],xbar,s)
chisq.test(observedf, p=normprobabilities)

normalfreq=normprobabilities*n
normalfreq

normprobabilities[k-1]=normprobabilities[k-1]+normprobabilities[k]
normprobabilities=normprobabilities[-k]

normalfreq[k-1]=normalfreq[k-1]+normalfreq[k]
normalfreq=normalfreq[-c(k)]

chisq.test(observedf, p=normprobabilities)
#alpha=0.05 < 0.34=p-val -> 
#H0 (variable has normal distribution) is not rejected
#END OF WTF


#testing normality
pearson.test(t,n.classes=6, adjust=F)
pearson.test(t,n.classes=6, adjust=T)
lillie.test(t)#only for normal if we have small sample
shapiro.test(t)#only for normal

#checking independence
nursers=c(100,80,20)
doctors=c(50,120,30)
ContingencyTable=data.frame(nursers,doctors)
chisq.test(ContingencyTable)
#reject H0 -> they are NOT independent