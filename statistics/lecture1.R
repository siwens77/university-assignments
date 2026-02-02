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


data = read.csv("ozone.csv")
oz = data$ozon
mean(oz)
table(bike)

mean(bike)
quantile(bike)
summary(bike)
quantile(bike, probs=0.6)

groupA = c(3.0, 3.0, 4.0, 4.5, 4.5)
groupB = c(2.0, 3.5, 4.0, 4.5, 5)
summary(groupA)
#Range = between max and min
var(groupA)#variance s^2= (sum of (average-point)^2)/(n-1)
sd(groupA)#standard deviation s = sqrt(s) = average deviation from mean
sd(groupA)/mean(groupA)#variability index = v = s/mean*100%

boxplot(groupA, groupB)#min, max, quartiles, range!
