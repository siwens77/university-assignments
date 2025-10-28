bike = c(4,3,4,4,4,4,3,3,3,2,5,5,3,4,6,7)
ozone=read.csv("ozone.csv", sep=";")
View(ozone)

sort(bike)
table(bike)#how many times each number

discrete.histogram(bike,freq=T)
?discrete.histogram

plot(table(bike))

pie(table(bike))

ozone=read.csv("ozone.csv", sep=";")
oz=ozone$ozon
table(oz)

br=seq(0,12,2)
pie(table(cut(oz,breaks=br)))
#cut connect intervals (breaks)

hist(oz,breaks=br, prob=T)
pie(table(cut(oz,br)))