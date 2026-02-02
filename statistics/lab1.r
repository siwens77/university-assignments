#1)
sin(2*pi) 
cos(3/4)
tg(pi)
log(100, base=10)
log(15, base=exp(1))
log(7,base=1/7)
exp(1)^3
64^(1/3)

#2)
sum(seq(1,10,1))

#3)
x=seq(2,20,2)
x^x
x^2
rev(x)
sum(x)
length(x)
sqrt(sum(x^2))

#4)
y=seq(5,10,length(13))

#5)
z1=rep(c(1,2), times=5)
z2=rep(c(1,2), each=5)
z1*z1
t(z1)%*%z2
z1%*%t(z2)

#6)
a=c(1,3,6,2,7,4)
min(a)
which.min(a)
which(a<4)
sum(a)
sum(a^2)
sqrt(sum(a^2))
a[3]
a+4
b=a[-c(4)]
c=a+b
d=a[a>4]

#7)
A=rbind(c(2,3,0), c(1,-1,2), c(1,1,-1))
t(A)
det(A)
sum(diag(A))
A%*%A
A*A
A%*%diag(A)
A%*%solve(A)
a=A[,3]
b=A[2,]
a*b
a%*%b

#8)
x=seq(1,10,1)
y=seq(10,19,1)
plot(x,y)
plot(data.frame(x,y))
plot(rbind(x,y))
plot(cbind(x,y))

#9)
curve(x^2+3*x-5,-3,4)
