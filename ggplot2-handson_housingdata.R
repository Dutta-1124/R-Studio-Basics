#remove all variables

rm(list = ls())
#import data
housing<- read.csv(file.choose(),header = T)

housing

#load dplyr and ggplot2 packages
library(dplyr)
library(ggplot2)

#glimpse of data
glimpse(housing)

#remove duplicated
housing<- distinct(housing)

#check the data
glimpse(housing)

#for checking names
fix(housing)

#check the glimpse
glimpse(housing)

attach(housing)

#select the variables : year,Total  units, Expenses, Marketvalue,Building,state
housing %>% select(Building.Classification,Total.Units,Year.Built,Expense.per.SqFt,Market.Value.per.SqFt,state)


#.........................................................................#
#DATA VISUALISATION USING GGPLOT2

#..........................................................................#
#HISTOGRAM WITH STATE
ggplot(housing,aes(Year.Built,fill=state))+geom_histogram(binwidth = 2)+ggtitle("TOTAL UNITS BUILT")+xlab("year")+facet_wrap(~state,ncol = 2)


#..............................................................................#
#FREQUENCY POLYGON TO FINDOUT THE NUMBER OF HOUSING PROJECTS
ggplot(housing,aes(Year.Built,color=state))+geom_freqpoly(binwidth=5)+labs(title = "HOUSING PROJECTS ACROSS VARIOUS STATES",X="year")+facet_wrap(~state,ncol = 2)

#.............................................................#

#BOXPLOT TO FIND THE TOTAL UNITS BUILT
p<- ggplot(housing,aes(Year.Built,Total.Units))+geom_boxplot(aes(fill=state),outlier.colour = "red")
p+ ggtitle("TOTAL UNITS BUILT")+xlab("Year")+ylab("units built")+facet_wrap(~state,ncol = 2)


#.............................................................................#\
#BARPLOT

ggplot(housing)+stat_count(mapping = aes(x= state,fill=Building.Classification),position = "dodge")
ggplot(housing,aes(state,fill=Building.Classification))+stat_count(position = "dodge")

#...................................................................#
#BOXPLOT T0 COMPARE PRICE PER SQUAREFEET
p<- ggplot(housing,aes(Year.Built,Total.Units))+geom_boxplot(aes(fill=state),outlier.colour = "red")
p+ggtitle("TOTAL UNITS BUILT")+xlab("year")+ylab("units built")+facet_wrap(~state,ncol = 2)

#......................................................................#

p<- ggplot(housing,aes(state,Expense.per.SqFt))
p+geom_boxplot(aes(fill=Building.Classification))+xlab("state")+ylab("Expenses incurred per. sq.feet")

#.................................................................#

#SCATTERPLOT
p<- ggplot(housing,aes(Year.Built,Expense.per.SqFt))
p+geom_point(aes(color=Building.Classification))+ xlab("year")+ylab("Expenses incurred per.sq.feet")+facet_wrap(~state)

#..................................................................#

#SCATTERPLOT MATRIX
pairs(~Year.Built+Total.Units+Expense.per.SqFt+Market.Value.per.SqFt,data = housing,main="SIMPLE SCATTERPLOT MATRIX")

