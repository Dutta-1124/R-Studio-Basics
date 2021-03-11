getwd()
cat("\041")
rm(list=ls())

# ASSIGNMENT
x<-11;y<-4
z<-x+y
z
z<-x-y
z
z<-x*y
z
z<- x^y
z
z<-x%%y
z
z<-x%/%y
z

# LOG & EXPONENTIALS

vec<- (1:10)
vec
z<- log(vec)
z
y<- exp(z)
y
z<- log(vec,base = 10)
z
sqrt(4)
z<-factorial(4)
z
n=5;r=3
num<- choose(n,r)
num
num2<- choose(n,n-r)
num2



#ROUNDING OFF NUMBERS
x<-123.456
z<- round(x,digits = 2)
z
z<-floor(x)
z
z<-ceiling(x)
z
z<-trunc(x)
z


#INFINITE
z<- x/0
z
y<- is.finite(z)
y
y1<-is.nan(z)
y1



#VECTORS
my_first_vector<- c(12,4,4,6,9,3)
my_first_vector
my_second_vector<- seq(from=2.5,to=5.0,by=0.5)
my_second_vector
my_third_vector<- 10*my_first_vector+20*my_second_vector
my_third_vector

first_and_second<- c(my_first_vector,my_second_vector)
first_and_second

#REPEAT A VECTOR
vec3<-c(0,0,7)
vec3
Rvec3<-rep(vec3,times=3)
Rvec3

vec2<- seq(from=2.5,to=7,length.out = 10)
VEC2
vec2

Rvec321<-rep(c(1,2,3),times=c(3,2,1))
Rvec321
Rvecn<-rep(c(1,2,3),each=3)
Rvecn



#LOGICAL VECTORS
player_1<-c(10,34,54,78,99)
player_2<-c(4,24,67,49,100)
player_1
player_2
#find out how player 1 performed vs player2
player_1.success<- player_1>player_2
player_1.success
#which matches did player1 win?
player_1_win<- which(player_1.success)
player_1_win
#what did player1 score in the matches player1 won
p1_win_scores<- player_1[player_1_win]
p1_win_scores

#summarizing logical vectors
#how many matches did player1 win?
sum(player_1.success)
#Did player1 win any matches?
any(player_1.success)
#Did player1 win all matches?
all(player_1.success)











#TEXT & STRINGS
#Define a string
x<-"Hello world"
x
#get length
lenx<- length(x)
lenx
#how many characters in x?
ncharx<- nchar(x)
ncharx

#Define a vector of 2 strings
y<-c("Hello","world")
y
#length
leny<-length(y)
leny
#how many characters?
nchary<-nchar(y)
nchary





#NAMING STRINGS
#create a vector month.days
month.days<-c(31,28,31,30,31,30,31,31,30,31,30,31)
month.days
#assign month short names
mon.shortname<-c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
mon.shortname

names(month.days)<-mon.shortname
month.days

#print name of 5th month
names(month.days[5])
#print month name having days=31
names(month.days[month.days==31])

month.days==31
month.days[month.days==31]

#print names in descending order of month lengths, consider the largest 5 months
names(sort(month.days,decreasing = TRUE)[1:5])

sort(month.days, decreasing = TRUE)
sort(month.days, decreasing = TRUE)[1:5]




#MATRICES
#define 2 by 3 matrix
A<- matrix(c(2,4,3,1,5,7),nrow = 2,ncol = 3,byrow = TRUE)
A
#Extract 2nd row 3rd column
A23=A[2,3]
A23
#Extracting a vector from the matrix
ARow2vec<- A[2, ]
ARow2vec
#Extracting a sub matrix from the given matrix
A2by2<-A[1:2,1:2]
A2by2
#Adding row and columns name
dimnames(A)=list(c("Row1","Row2"),c("Col1","Col2","Col3"))
A





#DATA FRAMES
#Define induvidual vectors
n<-c(2,3,5)
s<-c("aa","bb","cc")
b<-c(TRUE,FALSE,TRUE)

#Defining data frame
df<-data.frame(n,s,b)
df

#Get first 6 rows of a built in data frame"mtcars"
head(mtcars)
#Extract a perticular element with row and column names\
mtcars["Mazda RX4","cyl"]
#Get number of rows information
nrow(mtcars)
#Get number of columns information
ncol(mtcars)





#LIST
n<-c(2,3,5)
s<-c("aa","bb","cc","dd","ee")
b<-c(TRUE,FALSE,TRUE,FALSE,FALSE)
# x contains copies of n,s,b
x<- list(n,s,b,3)
x
#extracting child_list
child_list<-x[c(2,4)]
child_list
#slicing the list to extract a member
second_elem_slice<- x[2]
second_elem_slice
#chech class
class(second_elem_slice)
#directly refering a member of a list
sec_member<-x[[2]]
sec_member
#check class
class(sec_member)





#LIST INITALIZATION CONCEPTS
#create list column names
mylist.names<-c("Col1","Col2","Col3")
#create empty list
mylist<-vector("list",length(mylist.names))
mylist
#Initialize the list with 3 vectors of different lengths
mylist<- list(a=1,b=1:2,c=1:3)
mylist
#Name list columns
names(mylist)<-mylist.names
#check mylist
mylist

