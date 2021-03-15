#clear all variables
rm(list = ls())
#DATA PREP CASE1: reading a file with NA's and falty data
#read input
person<- read.csv(file.choose())
person
#read input again and neglect header and row names
person<- read.csv(file.choose(), header = F,row.names = NULL,col.names = c("age","height"), sep = " ")
person
#explore structure of data
str(person)
#note: height is treated as factor here
#..............lets try another method..............#
person<- read.csv(file.choose(),header = T,row.names = NULL, col.names = c("AGE","HEIGHT"),sep = " ",stringsAsFactors = F)
person
str(person)
#height is still a string but not factor 
#lets convert
attach(person)
HEIGHT<- as.numeric(HEIGHT)
person$HEIGHT<- as.numeric(person$HEIGHT)
str(person)




#DATA PREP CASE2- reading a datafile with readlines

#typical steps for dile data processing
# 1) read the data with readlines character
#2)select the lines containig data character
#3) split lines into separate fields list of character vector
#4) standardize rows list of equivalent vectors
#5)transform to data framee
#6) normalise and coerce to correct type data.frame


#1) 
txt<- readLines("dalton.txt")
txt


#2) getting rid of comment lines
#detect lines starting with percent sign
I<- grepl('^%', txt)
I
#throw them out
dat<- txt[!I]
dat


#split lines
fieldList<- strsplit(dat,split = ",")
fieldList


#standardize rows
#1) every row should have same number of fields
#2) fields should be in right order
assignFields<- function(x){
  out<- character(3)
  #get names
  i<- grepl("[[:alpha:]]",x)
  out[1]<-x[i]
  #get birthdate (if any)
  i<-which(as.numeric(x)<1890)
  out[2]<- ifelse(length(i)>0,x[i],NA)
  #get death date
  i<- which(as.numeric(x)>1890)
  out[3]<- ifelse(length(i)>0,x[i],NA)
  return(out)
}

standardFields<- lapply(fieldList,assignFields)
standardFields


#5)coerce to dataframe
#create a matrix
M<- matrix(unlist(standardFields),nrow = length(standardFields),byrow = T)
M


# set col names of matrix
colnames(M)<- c("name","birth","death")
M

#polpulate dataframe
daltons<- as.data.frame(M,stringsAsFactors = F)
daltons

# normalise to correct data type
daltons$birth<- as.numeric(daltons$birth)
daltons$death<-as.numeric(daltons$death)
daltons
str(daltons)


#now data frame is ready for EDA
#handling NA while doing EDA

age_vec<-c(23,16,NA)
mean_age<- mean(age_vec)
mean_age
#oops
#bypass NA
mean_age<- mean(age_vec,na.rm = T)
mean_age


#back to daltons example
#how many rows have NA
NA_row_count<- nrow(daltons)- sum(complete.cases(daltons))
NA_row_count

#how can i remove rows which have NA
good_rows<- na.omit(daltons)
good_rows


#IMPUTATION:can i replace NA with mean of the below vector
age_vec<- c(23,16,15,26,19,NA)
mean_age<- mean(age_vec,na.rm = T)
mean_age
#impute with mean
age_vec[is.na(age_vec)]<-mean_age
age_vec
