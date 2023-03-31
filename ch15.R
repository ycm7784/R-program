library(tidyverse)
library(reshape2)

#1. 통계청 출산 데이터 (시계열, 회귀)
#2. 집 값 데이터(켈리포이나) => 대표적인 회귀
#3. 손글씨 분류 =>(0~9분류) / iris

house <- read.csv("../data/housing.csv")
head(house)

summary(house)

#비지도가 필요할때 : 그룹을 못나눌때
## 데이터 시각화(데이터 확인을 위한)
par(mfrow = c(2,5))
colnames(house)
ggplot(data = melt(house), mapping = aes(x = value)+ geom_histogram(bins=30)+facet_wrap(-variable),
       scale = 'free_x')

#결측값 처리
house$mean_beadroom = house$total_bedrooms /house$households
house$mean_rooms = house$total_rooms / house$households

drop = c('total_bedrooms','total_rooms')

house = house[ , !(names(house) %in% drop)]

head(house)

## 전처리(상식을 사용해서 가정에 대한 데이터를 별도로 분리)
categories = unique(house$ocean_proximity)
cat_house = data.frame(ocean_proximity = house$ocean_proximity)

for(cat in categories){
  cat_house[,cat] = rep(0,times = nrow(cat_house))
}
for(i in 1:length(cat_house$ocean_proximity)){
  cat = as.character(cat_house$ocean_proximity[i])
  cat_house[,cat][i] = 1

}
head(cat_house)
