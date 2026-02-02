#exercise1
data1= read.csv("Anova_pressure.csv", sep=";")
results=c(data1$Low, data1$Moderate, data1$Strong, data1$VeryStrong)
treatments=rep(names(data1), c(length(na.omit(data1$Low)), 
                                length(na.omit(data1$Moderate)), 
                                length(na.omit(data1$Strong)), 
                                length(na.omit(data1$VeryStrong))))
data.frame(results,treatments)
#H0: sig1=sig2=sig3=sig4
#H1: ~H1
bartlett.test(results~treatments)
#p-value=0.5 > alpha=0.05 -> no reason to reject H0
#we can assume all variances are equal

#H0: mean1=mean2=mean3=mean4
#H1: ~H0
anova(lm(results~treatments))
#Pr(>F)=0.09 > alpha=0.05 -> no reason to reject H0
#all means are equal
#Pressure does not have impact on yield of the final product


#exercise 2
oil=read.csv("Anova_oil.csv", sep=";")
results=c(oil$Explosive.fracture,oil$WaterInjection,oil$SteamInjection,oil$ControlledPumping)
treatments=rep(names(oil), c(length(oil$Explosive.fracture), length(oil$WaterInjection),length(oil$SteamInjection),length(oil$ControlledPumping) ))
#H0: sig1=sig2=sig3=sig4
#H1: ~H1
bartlett.test(results~treatments)
#p-value=0.95 > alpha=0.05 -> no reason to reject H0
#we can perform anova

#H0: miu1=miu2=miu3=miu4
#H1: ~H1
anova(lm(results~treatments))
#Pr(>F)=0.6 > alpha=0.05 -> no reason to reject H0
#data does not confirm that there are better treatments



#exercise 3
measurements=read.csv("Anova_micrometer.csv",sep=";")
micro1=na.omit(measurements$micro1)
micro2=na.omit(measurements$micro2)
micro3=na.omit(measurements$micro3)
results=c(micro1,micro2,micro3)
treatments=rep(names(measurements),c( length(micro1), length(micro2), length(micro3)))
data.frame(results,treatments)
#H0: sig1=sig2=sig3
#H1: ~H0
bartlett.test(results~treatments)
#p-value=0.15 > alpha=0.05 -> no reason to reject H0

#H0: miu1=miu2=miu3
#H1: ~H0
anova(lm(results~treatments))
#Pr(>F)=0.07 > alpha=0.05 -> no reason to reject H0
#the choice of micrometer does not have an effect


#exercise 4
traps=read.csv("Anova_traps.csv", sep=";")
scattered = na.omit(traps$scattered)
concentrated=na.omit(traps$concentrated)
host.plant= na.omit(traps$host.plant)
aerial=na.omit(traps$aerial)
ground = na.omit(traps$ground)
results = c(scattered, concentrated,host.plant,aerial,ground)
treatments= rep(names(traps), c(length(scattered), length(concentrated), length(host.plant), length(aerial), length(ground)))
data.frame(results,treatments)
#H0: sig1=sig2=sig3=sig4
#H1: ~H1
bartlett.test(results~treatments)
#p-value=0.07 > alpha=0.05-> no reason to reject H0

#H0: miu1=miu2=miu3=miu4
#H1: ~H0
anova(lm(results~treatments))
#Pr(>F)=small < alpha=0.05 -> reject H0

#H0: pair of means is equal
#H1: pair of means is not equal
TukeyHSD(aov(results~treatments), ordered=TRUE)
#mu_scattered=mu_grounded
#mu_concentrated=mu_host.plant
#mu_aerial=mu_host.plant
#mu_aerial=mu_concentrated
#group1 = scattered, grounded
#group2 = concentrated, aerial, host.plant
plot(TukeyHSD(aov(results~treatments), ordered=TRUE))
#if 0 is in pair interval they are the same 



#exercise 5
smoke=read.csv("Anova_sportsmen.csv",sep=";")
results=c(smoke$NonSmokers,smoke$LightSmokers,smoke$MediumSmokers,smoke$HeavySmokers)
treatments = rep(names(smoke), each=length(smoke$NonSmokers))
#H0: sig1=sig2=sig3=sig4
#H1: ~H0
bartlett.test(results~treatments)
#pvalue=0.85 > alpha=0.05 -> no reason to reject H0

#H0: mu1=mu2=mu3=mu4
#H1: ~H0
anova(lm(results~treatments))
#pvalue=small < alpha=0.05 -> reject H0
#not all means are the same
TukeyHSD(aov(results~treatments), ordered=TRUE)
#mu_Medium = mu_Non
#mu_Heavy = mu_Non
#mu_Heavy = mu_Medium
#mu_Light = mu_Heavy
#group 1 = Medium, Non, Heavy
#group2 = Light