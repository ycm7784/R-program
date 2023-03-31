#7장 연습문제 2번
setwd("D:/양철민/R프로그래밍/works/rscpit")
dataset <- read.csv("../data/dataset.csv",header = T)
dataset2 <- subset(dataset, price >= 2 & price <= 8)
summary(dataset2$resident)
sum(dataset2$resident)
sum(dataset2$resident, na.rm = T)
resident2 <-na.omit(dataset2$price)
resident2
#7장 연습문제 3번
#? 5와 2어디서 나온지 모르겠습니다
dataset2
dataset2$gender[dataset2$gender ==1]<-'남자'
dataset2$gender[dataset2$gender ==2]<-'여자'
table(dataset2$gender)
pie(table(dataset2$gender))

#7장 연습문제 4번
dataset2$age2[dataset2$age <= 30] <- "청년층"
dataset2$age2[dataset2$age > 30 & dataset2$age <= 55] <- "중년층"
dataset2$age2[dataset2$age > 55 ] <- "장년층"

dataset2$age3[dataset2$age <= 30] <- 1
dataset2$age3[dataset2$age > 30 & dataset2$age <= 55] <- 2
dataset2$age3[dataset2$age > 55 ] <- 3
dataset2$age
dataset2$age2
dataset2$age3

#8장 연습문제 1번
install.packages("lattice")
library(lattice)
depthgroup <- equal.count(quakes$depth, number = 3, overlap = 0)
depthgroup
magnitudegroup <- equal.count(quakes$mag, number = 2, overlap =0)
magnitudegroup

xyplot(lat ~ long | depthgroup * magnitudegroup, data = quakes, 
       main = "Fiji Earthquakes", 
       ylab = "latitude", xlab = "longitude", 
       pch = "@", col = c("red", "blue"))

#8장 연습문제 2번
install.packages("latticeExtra")
library(latticeExtra)
SeatacWeather
xyplot(max.temp+min.temp~month ,data = SeatacWeather,type="l")
