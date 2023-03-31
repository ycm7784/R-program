#직장인 -> 생상성과협력 -> 보고서(이해가능)

#회귀 => 값을 예측하는 것
# 단순 회귀

#캘리포니아 집 값을 예측

##예측을 어떻게 하는 거야?

#1.데이터를불러오기 확인 -> 시각적인 확인 시각확인이유 : 숫자로는 경향을 알수가 없다
#2-1.전처리 과정 ->NA
#2-2.후처리 과정 -> 표준화와 정규화
#3. 데이터를 분리 ->학습와 검증
#4. 학습 ->기울기와 절편
#5. 검증 -> 모델을 검증
library(tidyverse)
library(reshape2)

setwd("D:/양철민/R프로그래밍/works")
#1.데이터를불러오기 확인 -> 시각적인 확인
#데이터불러오기
housing = read.csv("./data/housing.csv")
head(housing)
#컬럼 확인하기
colnames(housing)
# 경향 확인 
ggplot(data = melt(housing), mapping = aes(x - value))+
  geom_histogram(bins = 30) + 
  facet_wrap(~variable, scales = 'free_x')

#2 전처리 
housing$total_bedrooms[is.na(housing$total_bedrooms)]<- median(housing$total_bedrooms,na.rm = TRUE)
sum(is.na(housing))

#정수 부연속적적인 값 히스토그램 
#연속적인 값 산점도

#2-2 후처리


#범주형 데이터 지우고 돌려

# 정규화는 반드시 한다
#데이터의 경향을보고 결정한다

#clean데이터 2번까지는 끝

#학습용7 문제지 3 원칙은 랜덤

#3.데이터 분리 -> 

#모든 선형 회귀는 단순 선형 회귀를 기본으로 한다

#데이터에 대한 인상
#clean데이터(전처리가 끝난 데이터)

#랜덤 포레스트
#xgboost