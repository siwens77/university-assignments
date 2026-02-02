#1)
file = read.csv("flights.csv",sep=";")
class(file)
for(year in 1:length(file)){
  hist(file[,year], xlab="Passengers", ylab="number",
       main=substr(names(file)[year],2,5), col=year)
}

#2)
data=read.csv("notes.csv", sep=";", dec=",")
data
par(mfrow=c(2,4))
for(group in 1:length(data)){
  discrete.histogram(na.omit(data[,group]), main=paste0("Group: ", group),
                     xlab="Grades")
  pie(table(na.omit(data[,group])), main=paste0("Group: ", group))
}


#3)
strawb=read.csv("strawberries.csv", sep=";")
par(mfrow=c(1,2))
for(year in 1:length(strawb)){
  hist(strawb[,year], freq=FALSE, xlab=paste0("strawberries"),
  main=paste0("Histogram year: ",substr(names(strawb)[year],6,9)))
  
  pie(table(cut(strawb[,year], breaks=5)), 
  main=paste0("Piechart year ",substr(names(strawb)[year],6,9)))
}
boxplot(strawb[,1], strawb[,2])