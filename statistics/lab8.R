#exercise 1
data1=read.csv("Reg_1_materials_yield.csv", sep=";")
x = data1$X
y = data1$Y
#a)
cov(x,y)
#b)
cor(x,y)#close to 1 so they are related 
#c)
plot(x,y)
#d)
line=lm(y~x)
#y=22.4+3.6x
#e)
#it will increase by 3.62
#f)
predict(line,data.frame(x=c(15)))
#h)
cor(x,y)^2
#i)
summary(line)
#H0: beta1=0
#H1: beta1!=0
#p-value=0.00046<alpha=0.05 -> reject H0
#regression line is important


#exercise 2
data2=read.csv("Reg_2_arsenic.csv",sep=";")
x=data2$pH
y=data2$arsenic
#a)
cov(x,y)
#b)
cor(x,y)
#there is strong negative linear regression between them
#c)
plot(x,y)
#d)
line=lm(y~x)
abline(line, col=2)
#y=190.27-18x
#e)
#it will decrease by 18%
#f)
predict(line, data.frame(x=c(7.5)))
#g)
predict(line, data.frame(x=c(9)))
#h)
cor(x,y)^2
#i)
#H0: beta1=0
#H1: beta1!=0
summary(line)
#p-value=small<alpha=0.05. -> reject H0
#regression line is important


#exercise 3
data3=read.csv("Reg_3_bricks.csv",sep=";")
x=data3$Air
y=data3$Dry
#a)
cov(x,y)
#b)
cor(x,y)
#there is strong negative linear regression between them
#c)
plot(x,y)
#d)
line=lm(y~x)
line
abline(line, col=2)
#y=126.25-0.92x
#e)
#it will decrease by 0.92lb/ft^3
#f)
predict(line, data.frame(x=c(11)))
#g)
predict(line, data.frame(x=c(23)))
#h)
cor(x,y)^2
#i)
#H0: beta1=0
#H1: beta1!=0
summary(line)
#p-value=small<alpha=0.05 -> reject H0
#regression line is important


#exercise 4
data4=read.csv("Reg_4_time_temp.csv", sep=";")
x=data4$operation.time
y=data4$temperature
#a)
cov(x,y)
cor(x,y)
#b)
plot(x,y)
#c)
line=lm(y~x+I(x^2))
a = line$coefficients[3]
b = line$coefficients[2]
c = line$coefficients[1]

line2=lm(y~x+I(x^2)+I(x^3))
a1=line2$coefficients[4]
b1=line2$coefficients[3]
c1=line2$coefficients[2]
d1=line2$coefficients[1]
#d)
curve(a*x^2+b*x+c,add=TRUE,col=2)
curve(a1*x^3+b1*x^2+c1*x+d1,add=TRUE,col=3)
#e)
#y=ax^3+bx^2+cx+d
#H0: a=0, b=0, c=0, d=0
#H1: ~H0
summary(line2)
#pval-A and pval-B and pval-C < alpha =0.05   -> reject H0
#pval-D > alpha = 0.05 -> not reject H0
#f)
predict(line2, data.frame(x=c(15,48)))
#g)
summary(line2)
#it is very close to 1 so it is quiet well fitted