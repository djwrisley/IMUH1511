# trying the built in dataset iris

install.packages("dplyr")
install.packages("ggplot2")
library(dplyr)
iris
library(ggplot2)
ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species)) + geom_point(size=2)

# trying the Titanic dataset
# https://github.com/awesomedata/awesome-public-datasets/tree/master/Datasets

setwd("/Users/djw12/Downloads/")
titanic <- read.csv("titanic.csv")
ggplot(data=titanic, aes(x=date, y=attendees)) + geom_point(size=2) 

# trying the FIFA dataset

setwd("/Users/djw12/Downloads/")
titanic <- read.csv("FIFA.csv")
ggplot(data=titanic, aes(x=date, y=attendees)) + geom_point(size=2) 

# visualize the trend in the data as a linear line

setwd("/Users/djw12/Downloads/")
titanic <- read.csv("FIFA.csv")
ggplot(data=titanic, aes(x=date, y=attendees)) + geom_point(size=2) + geom_smooth(method = lm, se = TRUE)

