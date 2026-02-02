#example1
x = c(1, 1.5 ,2 ,3 ,4 ,10, 16, 20, 25, 32)
y = c(1, 2.5, 3, 3.5, 4, 5, 6, 7, 8, 9)
plot(x,y)
sxy = cov(x,y)
#there is some positive relationship between the amount of 
#raw materials and final yield of the product,
#with increase of the amount of raw materials the final yield increases
r=cor(x,y)
sxsq=var(x)
beta1hat=sxy/sxsq

xbar=mean(x)
ybar=mean(y)
beta0hat=ybar-beta1hat*xbar
#yhat=0.222x+2.356
curve(beta0hat+beta1hat*x,add=TRUE)

line=lm(y~x)

plot(x,y)
abline(line)

#determination coefficient
r^2
#variability of final yield is explained in almost 94%
#by variability of the amount of raw material

#compute y if x=8,23,28
predict(line,data.frame(x=c(8,23,28)))

#checking significance of beta1
#H0: beta1=0
#H1: beta1!=0
anova(line)
#alpha=0.05 > 0=pvalue -> reject H0
#regression is significant

summary(line)
