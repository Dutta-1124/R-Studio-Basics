#clear all data variables
rm(list = ls())

#SLICING VECTORS
#define a vector
vec1<-c(12,4,4,6,9,3)
vec1
#Extract the third element
third_element<- vec1[3]
third_element


#SLICING MATRICES
#define2 by 3 matrix
A<- matrix(c(2,4,3,1,5,7),nrow = 2,ncol = 3,byrow = T)
A
#extract element of 2nd row and 3rd column
A23<-A[2,3]
A23
#extract a vector (2nd row) from the matrix
ARow2vec<- A[2,]
ARow2vec
#extracting a submatrix from a given matrix
A2by2<- A[1:2,1:2]
A2by2



#SLICING DATAFRAMES
#data frames
#create a dataframe from vectors
n<-c(2,3,5)
s<-c("aa","bb","cc")
b<-c(TRUE,FALSE,TRUE)
df<- data.frame(n,s,b)
df
#extract elements in 1st row and 2nd column
df[1,2]
#extract 1st row
df[1,]
#extract 2nd col
df[,2]



#SUBSETTING OF DATA FRAME
#using subset features
#create building blocks
Make<- c("Toyota"," Hyundai"," Maruti","Toyota"," Hyundai"," Maruti","Toyota"," Hyundai"," Maruti")
Model<-c("Corolla","i20","Alto","Camry","i10","Baleno","Fortuner","Sonata","Astra")
Sales<-c(345,800,2000,150,200,350,50,68,120)
#create data frames
cardata<-data.frame(Make,Model,Sales)
cardata       
#choose car Make,Model& Sales for sales>300& list in descending order
topsales<-subset(cardata,Sales>300)
topsales
attach(cardata)
attach(topsales)
sorted_topsales<- topsales[order(-Sales),]
sorted_topsales


#using which funtion to subset
#get index/row postions meeting any perticular criteria
idx_pos<- which(Sales>300)
#get subset using index positions
carsale_gt_300<- cardata[idx_pos,]
carsale_gt_300
#get rows for which sales are less than 300
carsale_lt_300<- cardata[-idx_pos,]
carsale_lt_300

#get the model name for the max sale value
max_sale_model<- Model[which.max(Sales)]
max_sale_model




    #IMPORTANCE OF DPLYR PACKAGE
install.packages("dplyr")
library(dplyr)

#the <select > verb
#selecting model columns from cardata
car_models<- select(cardata,Model)
car_models

#the <filter> verb
#select rows which have sales >500
sales_gt_500<- filter(cardata,Sales>500)
sales_gt_500


#the <arrange> verb
sorted_cardata<- arrange(cardata,desc(Sales))
sorted_cardata


#the <mutate> verb
# create new column per_tot_sales
cardata<- mutate(cardata,per_tot_sales<- Sales*100/(sum(Sales)))
cardata


#the <summarise> verb
# get the summary statistics
sale_summary<- summarise(cardata,avg_sales<- mean(Sales),
                         min_sales<-min(Sales),
                         max_sales<-max(Sales),
                         tot_sales<-sum(Sales))
sale_summary



#the <group_by > verb
#get summary statistics average sale by car manufacturers
mf_avg_sales<-cardata %>% group_by(Make) %>% summarise(avg_sales= mean(Sales))
mf_avg_sales



#CONVERT BETWEEN DATA TYPES
#the example shows 3 vectors converted into 3 dataframes
df1<- as.data.frame(c("anish","john","kumar"))
df2<- as.data.frame(c("anish2","john2","kumar2"))
df3<- as.data.frame(c("anish3","john3","kumar3"))

#convert data frame to list
#define list with 3 elements
my.list<- vector("list",3)
my.list
#populate list with data frames
my.list[[1]]<-list(df1)
my.list[[2]]<-list(df2)
my.list[[3]]<-list(df3)

my.list
list(df1)


#convert list to dataframe
finaldf<- as.data.frame(my.list)
finaldf
#set column names
names(finaldf)<- c("col1","col2","col3")
finaldf
