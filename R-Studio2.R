#clear all data variables
rm(list = ls())

#FILE I/O
# REPORTING CAR DATA FOR MODELS HEAVY SALES>500

# READ THE CAR SALES CSV FILE
car_data<- read.csv(file.choose(),header = T)
#DISPLAY CARSALES DATA
car_data
#SUBSET- CHOOSE CAR MAKE&MODEL,SALES FOR SALES >300
top_sales<- subset(car_data,sales>300)
attach(car_data)
top_sales<- subset(car_data,Sales>300)
top_sales
# AND LIST IN DESCENDING ORDER
sorted_topsales<- top_sales[order(-Sales),]
#DISPLAY SORTED DATA
sorted_topsales
#WRITE OUTPUT FILE
write.table(sorted_topsales,file = "sorted_top_sales",sep=",",row.names = FALSE)





#MISC-CONTROL FUNCTION
#CONDITIONAL FUNCTIONS
#CREATE A VECTOR OF 5 NUMBERS
vec1<-c(15,2,32,45,50)
vec1
#RETURN 1 IF VALUE IS 2 RETURN 0 OTHERWISE
ifelse(vec1==2,1,0)
#CHECK FOR ODD & EVEN
test_vec<- c(5,9,2,3)
test_vec
Resultvec<- ifelse(test_vec%%2==0,"even","odd")
#DISPLAY RESULT VECTOR
Resultvec







#CONCATINATION
paste("a","b")
paste("hello","world",sep = " ")
string1<-c("hello","world")
paste(string1)
paste(string1,collapse = " ")
paste(string1,collapse = "")





#CHECKING FOR NULL
#CREATE A VECTOR FOR NULL
vec1<-c(1,2,3,NA,4,5,NA,NA)
vec1
#CHECK FOR NULL
is.na(vec1)
#COPY NON NULL VALUES TO ANOTHER VECTOR 

Nonullvec<-vec1[!is.na(vec1)]
Nonullvec
#REPLACE NULL WITH ZERO IN THE ORIGINAL VECTOR
vec1[is.na(vec1)]<-0
#DISPLAY VEC
vec1


#MERGE DATA FRAMES
df1<- data.frame(customerId=c(1:6),product=c(rep("Toaster",3),rep("Radio",3)))
df2<- data.frame(customerId=c(2,4,6),state=c(rep("alabana",2),rep("ohio",1)))
df1
df2
#EXAMPLE OF INNER JOIN
inner_merged<-merge(x=df1,y=df2,by="customerId")
inner_merged
#EXAMPLE OF OUTERJOIN
outer_merged<-merge(x=df1,y=df2,by="customerId",all = T)
outer_merged
#EXAMPLE OF LEFT OUTERJOIN

l_outer_merged<-merge(x=df1,y=df2,by="customerId",all.x = T)
l_outer_merged
#RIGHT OUTER JOIN
r_outer_merged<-merge(x=df1,y=df2,by="customerId",all.y = T)
r_outer_merged



#LOAD &SAVE
ls()
#CLEAR UP
#A VECTOR OF 20 RANDOM VARIABLES
y.vector<- runif(20)


#SAVE TO WORKING DIRECTORY
save(y.vector,file = "yvec.saved")
#removed
rm(y.vector)

#LOADED BACK IN
load("yvec.saved")
class(ls())
y.vector
class(y.vector)
x<- "a"
rm(list = c("x","y.vector"))
ls()



#ONE WAY TWO WAY TABLES
#CREATE GENDER VECTOR
gender<-c("Male","Male","Female","Male","Female")
#CREATE MARITIAL STATUS VECTOR
Mstatus<-c("Married","single","Married","Single","Married")
#ONE WAY TABLE
table(gender)
#TWO WAY TABLE
table(gender,Mstatus)




#LOOPS
#for loop
for(i in 1:5){
  print(i)
}

for(i in 1:5){
  j
}
j

i<-1:5
for(j in i){
  print(j)
}

#WHILE LOOP
x<-0
while(x<5){
  print(x<-x+1)
}

#REPEAT SIMILAR TO DO-WHILE LOOP
y<-0
repeat{
  print(y<-y+1)
  if(y>5){
    break
  }
}


#function definition without arguments
Hello_world<- function(){
  print("Hello world")
  return(0)
}
#function call
Hello_world()
#function with arguments
sum_two_nos<- function(a,b){
  sum2<-a+b
  print(paste("sum is",sum2))
}
#function call
sum_two_nos(5,10)



#_Multiple input values, multiple output
#function definition
compute_mean_std_tot<- function(x,y){
  tot<- x+y
  mu<-mean(x+y)
  sigma<-sd(x+y)
  return(list(mean=mu,stand_dev=sd,totals=tot))
}
vec1<-c(1,2,3,4,5)
vec2<-c(1,2,3,4,5)
answer<-compute_mean_std_tot(vec1,vec2)
#display answer
answer
