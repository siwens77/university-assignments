#example1
#no normality, independence
#t-test with no normality
#wilcoxon rank sum
d1=c(1.96, 2.24, 1.71, 2.41, 1.62, 1.93)
d2=c(2.11, 2.43, 2.07, 2.71, 2.5, 2.84, 2.88)
wilcox.test(d1,d2,exact=F)

#example2
#no normality, no independence
#t-test with no normality, no independece
#wilcoxon signed rank
d1=c(6,8,4,9,4,7,6,5,6,8)
d2=c(4,5,5,8,1,9,2,3,7,2)
wilcox.test(d1-d2,exact=F)

#example3
#no normality, independent
#anova with no normality
#kruskal-wallis H test
l1=c(6,38,3,17,11,30,15,16,25,5)
l2=c(34,28,42,13,40,31,9,32,39,27)
l3=c(13,35,19,4,29,0,7,33,18,24)
results = c(l1,l2,l3)
treatments = c(rep("A",10), rep("B", 10), rep("C", 10))
kruskal.test(results~treatments)

#example4
#no normality, no independence
#anova with no normality, no independence (anova with blocks?)
#Friedman test
A=c(1.21,1.63,1.42,2.43,1.16,1.94)
B=c(1.48,1.85,2.06,1.98,1.27,2.44)
C=c(1.56,2.01,1.7,2.64,1.48,2.81)
results=c(A,B,C)
treatments=c(rep("A", 6), rep("B", 6), rep("C",6))
blocks=rep(c("b1","b2", "b3", "b4","b5", "b6"),3)
data.frame(results,treatments,blocks)
friedman.test(results,treatments,blocks)

#example5
#no normality, no independence
#we have ranks
#spearman's rank correlation
A=c(4,1,9,5,2,10,7,3,6,8)
B=c(5,2,10,6,1,9,7,3,4,8)
cor.test(A, B, method = 'spearman',exact=F)

#example6
#no normality, no independence
#we dont have ranks
#spearman's test for rank correlation
item=c(12,15,35,21,20,17,19,46,20,25,39,25,30,27,29)
quality=c(7.7,8.1,6.9,8.2,8.6,8.3,9.4,7.8,8.3,5.2,6.4,7.9,8,6.1,8.6)
cor.test(item,quality, method='spearman', exact=F)
