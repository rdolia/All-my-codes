a = c(1,2,3,4,5)
is.character(a)

b = seq(1,21,4)
print(b)
rep("test",5)
rep("test",5,each=2)

c = c(1,2,3,4,5)
d = c(2,2,3,4)

e = c*d

w <- c('a','2','c','d','e')
w[1]
w[1]<-'c'
w[-1]
#CHECK THIS INBUILT FUNCTION
iris
iris[1,1]
iris[2,2]

m1 = matrix( nrow=4,ncol=4)
dim(m1)

data<- c(1:20)
a<-matrix(data,4,5)
a
a[3,2]
b<-matrix(data,4,5,byrow=T)
b
x<-1:3
y<-10:18
cbind(x,y)
#either elements match or it has to be a multiple like 3 and 9 elements
factor

#check factor function in R
#dataframe create.  use $ sign
#list function check

#creating data frame

height <- c(175,167,158,176)
weight <- c(49,60,60,80)
name   <- c("John","Donald","Tim","Betty")
team <- data.frame(name,height,weight)
team
team[2,1]

team[3,3]

test <-team$name
test

#creating a list

s <- c(1:25)
t <- matrix(s,5,5)
t
q <- c("rachit","dolia")
r <- c(seq(1:9))
r
list1 <- list(t,q,r)
list1
list1[1]
z<- list1[1]
z[2][2]
z[1,2]

z



z[1]

c <- matrix(c(1:25),nrow = 5)
c
c[1,2]
c[1,2]<-10
c[1,2]
c

test1 <- c(1:10)
test2 <- c(3,6,45,76,76,89,43,23,12,34)
test3 <- c("aa","bb","cc","dd","ee","ff","gg","hh","ii","jj")

frame <- data.frame(test3,test1,test2)
frame

#HEAD OF DATA FRAME WITH 3 FIRST 3 ROWS TO BE DISPLAYED
head(frame,n=3)

#TAIL OF DATA FRAME WITH 3 FIRST 4 ROWS TO BE DISPLAYED
tail(frame, n= 4)

#dimension of data frame
dim(frame)

#number of rows
nrow(frame)
ncol(frame)
str(frame)

# lists the name of the frame.
names(frame)

#subsetting vector prints 4th item 
test2
test2[4]
#subsetting more than 1 item
test2[c(10,2)]
#drop second element
test2[-2]
#logical operator selection select elements higher than 40
test2[test2>40]
#SAME APPLIES TO LISTS


#subsetting lists
list1 <- as.list(100:110)
list1
list1[1]
list2 <- list1[2:6]
list3 <- list1[c(1,3,5)]
list3

# creating, naming columns, rows and subsetting a matrix

matrix1 <-matrix(1:50,nrow = 10)
matrix1
colnames(matrix1) <- c("Number","Name","Height","Weight","Age")
matrix1
rownames(matrix1) <- c("Result1","Result2","Result3","Result4","Result5","Result6","Result7","Result8","Result9","Result10")
matrix1
matrix1[2:4,]
matrix1[2,5]
matrix1[,3:5]

#INDEXING - SELECTING CONDITION - LOCATION A AND pH ------
my.dataset <- data.frame(location=c("A","B","A","A","B"),season=c("Winter","Summer","Summer","Spring","Fall"),pH=c(4.5,6.3,8.6,7.2,8.9))
my.dataset
my.dataset[my.dataset$location == "A",'pH']

# SELECTING ALL THE RECORDS WHERE SUMMER IS THERE AND pH

my.dataset[my.dataset$season=='Summer',c('season','pH')]
my.dataset[my.dataset$location=='A',c('location','season','pH')]

#SELECT RECORDS WHERE pH bigger than 7
my.dataset[my.dataset$pH > 7, ]

#IFELSE FOR VECTOR
test1
ifelse(test1>=10,"bigger than 10","smaller than 10")

#FOR LOOP

test1
test3
for (i in 1:10) {
  print(test1[i])
}
for (i in 1:10) {
  print(test3[i])
}
for (i in seq(test3)) {
  print(test3[i])
}

#DATA IMPORT FROM EXCEL 
library(xlsx)
teamdata<-read.xlsx("D:/Rachit/Full data rate card.xlsx",1)

#DATA EXPORT TO EXCEL
library(xlsx)
write.xlsx(teamdata,"D:/rachit/exportrate.xlsx")

#SAMPLE FUNCTION
sample(test2)
sample(test2,1)


#FOR LOOP PRINTING A MATRIX USING I AND J 
m <-matrix(1:10,2)

for (i in seq(nrow(m))){
 for (j in seq(ncol(m))){
   print(m[i,j])
 } 
}
#FOR LOOP FOR EVEN NUMBER AND NEXT

for (i in 1:20) {
  if(i%%2==1){
    print(i)
  }
  
}

#which CHECK THIS.....

letters
which(letters=="r")



#PASTE FUNCTION concatenates two items. 
#paste0 concatenates without space

r<-"My name is name name "
v<-"Rachit"
paste(r,v)
paste(v,r)
paste0(r,v)


#grep find a char or word in a string.
grep('name',r)

#install ggplot2 for diamonds data set
library(ggplot2)
View(diamonds)
#check sorting example from gaurav code
mtcars
newdata<-mtcars[order(qsec),]
newdata

#adding column in data set
mtcars$brand<-rownames(mtcars)
mtcars
#MERGE
section1<-mtcars[,c(1,2,4,5,6)]
section2<-mtcars[,c(4,6,8,9)]
section3<-merge(section1,section2,by='hp')
section3

# to extract or replace strings in char vector substr(x, start, stop)
ddd<-"Test message to check the command"
substr(ddd,5,15)

#sub and gsub fo rreplacing a character for an item in a string
sub("message","boo",ddd)
#gsub() replaces all occurences with new string. 