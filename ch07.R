dataset <- read.csv("./data/dataset.csv",header = T)
dataset
print(dataset)
View(dataset)
head(dataset)
tail(dataset)

names(dataset)
attributes(dataset)

str(dataset)

dataset$age

x<-dataset$age

plot(dataset$price)
dataset[1]
dataset[c("job","price")]
summary(dataset)
sum(dataset$price,na.rm = T)
price2 <- na.omit(dataset$price)
price2

