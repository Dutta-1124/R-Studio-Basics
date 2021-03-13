getwd()
#CLEAR ALL VARIABLES
rm(list=ls())
#INSTALLING PACKAGES
install.packages("Hmisc")
install.packages("pastecs")
install.packages("psych")


##### GET DATA###

#import data set in the working directory
data<- read.csv(file.choose(), header = T)
data
# explore the data
View(data)
names(data)
# rename the first col
colnames(data)[1]<- "age"
names(data)
#dimesnions
dim(data)
#structure of data
str(data)
#type of data
class(data)
#display first 5 rows
head(data, n=5)
#display last 5 rows
tail(data,n=5)
.............................
#UNIVARIATE STATS
#load packages
library(Hmisc)
library(pastecs)  
library(psych)  
library(dplyr)

#summary of data
summary(data)
#choose subset of a data for EDA
var<- c("age","marital","education","housing")
var
eda_data<-select(data,var)
#names
names(eda_data)

#stats on age
attach(data)
attach(eda_data)
summary(age)

#let us use the describe function now from "Hmisc" package

#number of rows
#standard deviation
#trimmed mean
#mean absolute deviation
#skewness
#kurtosis
#standard error

describe(age)
dim(age)
dim(eda_data)

#stat.desc() function which is a part of pastec package
#gives us additionally
#varience
#coefficient of variation
#confidence interval for mean

stat.desc(age)



#GRAPHICAL VIEWS: 1 HISTOGRAM
hist(age,main = "HISTOGRAM OF AGE", xlab = "AGE IN YEARS")

#GRAPHICAL VIEWS: 2 BOXPLOT
boxplot(age, main= toupper("box plot of age"), ylab="AGE IN YEARS", col = "blue")


#KERNEL DENSITY PLOT
d<- density(age)
plot(d,main = "kernel density")
polygon(d, col = "red", border = "blue")




#DESCRIPTIVE STATS
#read the data file
pcdata<- read.csv(file.choose(), header = T)
pcdata

# EXPLORE THE DATA
#provide basic descriptive statistics

summary(pcdata)
#open data editor
edit(pcdata)
#provide structure of the data set
str(pcdata)
#list variables in the data
names(pcdata)
#first few rows of the dataset
head(pcdata)
#first 2 rows of the dataset
head(pcdata,n=2)
#last few rows
tail(pcdata)
#rows 2 to 4
pcdata[2:4,]
#rows 2 to 4 with cols 1 to 3
pcdata[2:4,1:3]
#rows 2 to 4 with cols 1 and 3
pcdata[2:4,c(1,3)]



#DESCRIPTIVE STATISTICS
#mean of a perticular column
attach(pcdata)
mean(Units_Shipped_Q1_2016)
# another way of getting mean
with(pcdata,mean(Units_Shipped_Q1_2016))
#median
median(Units_Shipped_Q1_2016)
#varience
var(Units_Shipped_Q1_2016)
#standard deviation
sd(Units_Shipped_Q1_2016)
#maximum
max(Units_Shipped_Q1_2016)
#range
range(Units_Shipped_Q1_2016)
#quantile 25%
quantile(Units_Shipped_Q1_2016, probs = 0.25)
#length
length(Units_Shipped_Q1_2016)
#whch is max
Company[which.max(Units_Shipped_Q1_2016)]


# apply#
#create a matrix
mat1<-matrix(rep(seq(4),4), ncol = 4)
mat1
matrix(seq(1,4), nrow = 4,ncol = 4,byrow = F)
seq(4)

#row sums of matrix
apply(mat1,1,sum)
#column sums of matrix
apply(mat1,2,sum)
#apply a user defined function accross rows
#row sum+2
apply(mat1,1,function(x) sum(x)+2)



#lapply
#create a data frame using mat1
mat1.df<- data.frame(mat1)
mat1.df
#obtaining thhe sum of each variable in mat1.df
lapply(mat1.df,sum)
#storing the results of lapply function in list y
y<- lapply(mat1.df,sum)
y
#check 
is.list(y)

#user defined function with multiple arguments
#function defined under lapply
y1<- lapply(mat1.df,function(x,y) sum(x)+y,y=5)
y1

#display the first 2 results in the list
y1[1:2]


#sapply
y2<-sapply(mat1.df,function(x,y) sum(x+y),y=5)
y2
#test the vector
is.vector(y2)


#tapply
#consider the inbuilt dataset
#a sneek peek into iris 
head(iris)
attach(iris)
#how many species in dataset
unique_speciesCNT<- unique(Species)
unique_speciesCNT
unique_speciesCNT<- length(unique(Species))
unique_speciesCNT
# what are the different species in the data
unique_species<- unique(Species)
unique_species
#find mean sepal length in data iris,
#split the result by species
tapply(Sepal.Length,Species,mean)
