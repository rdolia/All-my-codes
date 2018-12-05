x1<-c(2.5,1.4,6.3,4.6,9)
x1
Vineet <- c(1,2,3,"a")
Vineet[2]
class(Vineet)
mode(x1)
length(x1)
sort(x1)
x2<-c(TRUE,FALSE,TRUE,FALSE,FALSE)
x2
class(x2)
mode(x2)
length(x2)
x3<-c("DataMining","Statistics","Analytics","Projects","MachineLearning")
class(x3)
length(x3)
x3
x4<-c(2,5,1,6,3,4,6,9,0)
class(x4)<-"integer"
class(x4)
mode(x4)<- "integer"
mode(x4)
length(x4)
x5<-c(1L,2L,3L)
class(x5)
#--------

#COMBINING VECTORS INTO r THROUGH C-----will see theat in the functions.All mathematical operations in R happe in the double mode it automatically stores all integers in double.
A <- c(1,2,3,4,5,6,7,"a")
A
B<- c(1,2,3,4,5)
B
is.integer(B)
is.double(B)
is.character(A)
is.integer(x1)
is.double(x1)
class(A)
v1 <- c(1L,2L)
v1
is.integer(v1)
v3 <- c("a","b","c","hello",7)
class(v3)
is.integer(v3)
#seq-- similar like :-------
seq(1,15)
1:15
seq(1:15)
seq(1,15,0.5)
z <- seq(1,17,4)
z
v3
#rep-----replicate
rep(3,150)
?rep
v3
rep("a",5)
rep(v3,4)
abc <- rep(v3,4,each=3)
abc

#----------------
a<-c(1,2,3,6)
a
b<-c(6,7,8)
b
a*b
y<- c(1,123,444,4,7,8)
x<- c(2,3,4)
x
y
x*y
w <- c("a","b","c","d","e")
w[1]
#change values in vector
w[1]<-"c"
w
w[-2]
w[-1]
w[1:3]
w[4:5]
w[6]
w[5:1]
w[c(1,3,5)]
w[c(1,4)]
w[c(1,1,1)]
w[c(1,3,5)]
w[-5]
w[-4]
w[-6]
w[1:3]
w[c(1:3)]
iris
View(iris)
iris$Sepal.Length
iris[1,1]
iris[1,]
iris[,1]
#Multiplications----------
N <- 100
N
a <- rnorm(N)
a
b <- rnorm(N)
b
c<- a * b
c
a
b
#--------------------------
m1 <- matrix(nrow = 4, ncol = 4)
m1
class(m1)
mode(m1)
dim(m1)
m2 <- 1:16
m2
dim(m2) <- c(4,4)
m2
data <- c(1:20)
data
A <- matrix(data,4,5)
A
A[3,2]
A[2,3]
B <- matrix(data,4,6,byrow = T)
B
x <- 1:8
y <- 9:16
cbind(x, y)
x
x <- 1:3
y <- 9:16
cbind(x, y)
rbind(x,y)
x1<-c(0.5,1.0,2.3,5.6,8.9)
class(x1)
x1
x1
x2<-c(TRUE,FALSE,TRUE,FALSE,FALSE)
class(x2)
x3<-c(T,F,T,T,T)
class(x3)
x4<-c("dog","cat","rat","bag","bag")

class(x4)
x8<-c(0.5,1.0,2.3,5.6,8.9,"dog","dog")
class(x8)
x6=as.factor(x8)
x6
class(x6)
table(x6)
x5<-c(1:5)
class(x5)
x7<-as.factor(x5)
x<-as.numeric(x7)
x6<-c(1+0i,NA,2+2i,4+1i,6+55i)
class(x6)
x6
x
m1 <- matrix(nrow = 4, ncol = 4)
m1
dim(m1)
m1 <- matrix(1:16,nrow = 4, ncol = 4)
m1
m2 <- 1:16
dim(m2) <- c(4,4)
m2
x <- 1:8
y <- 9:16
cbind(x, y)
rbind(x,y)
m <- matrix(1:16, nrow = 4, ncol = 4, byrow = TRUE,
dimnames = list(c("row1", "row2","row3","row4"),
c("C.1", "C.2", "C.3","C.4")))
m
mm <- matrix(1:16, nrow = 4, ncol = 4, byrow = FALSE,
dimnames = list(c("row1", "row2","row3","row4"),
c("C.1", "C.2", "C.3","C.4")))
mm
str(iris)
x <- list(1, "a", TRUE, 1 + (0+4i))
x[1]
head(iris,n=10)
list1<-list(a=iris[1:3,1:2],b=iris[4:7,2:3],c=head(iris),d=tail(iris))
list1

list1[[1]][[2]][[2]]
list1$a$Sepal.Width[[2]]
head(iris,n=10)
#Factor
data <- c("East","West","East","North","North","East","West","West","West","East","North")

data
is.factor(data)
is.character(data)
factor_data <- factor(data)
print(factor_data)
table(factor_data)
print(is.factor(factor_data))

# Create the vectors for data frame.
height <- c(132,151,162,139,166,147,122)
weight <- c(48,49,66,53,67,52,40)
gender <- c("male","male","female","female","male","female","male")

# Create the data frame.
input_data <- data.frame(height,weight,gender)
print(input_data)

# Test if the gender column is a factor.
print(is.factor(input_data$gender))

# Print the gender column so see the levels.
print(input_data$gender)

input_data$height
#numeric vector
x <- c(54, 62, 71, 48) 

#logical operator
x[x > 60]
#using which operator
x[which(x > 70)]
#null operator
x[]

#create a list
x <- as.list(100:110)
x

#first four elements
x[1:4]
# to get element 5
x[[5]]

#create a sample matrix
a <- matrix(1:9, nrow = 3)
a
#renaming the columns
colnames(a) <- c("A", "B", "C")
a
#selecting first two rows
a[1:2, ]
#selection based on logical values
a[c(T, F, T), c("B", "A")]

x1
x2
x3

x4
x5

x6
x7
df <-data.frame(x1,x2,x3,x4)
df$
df$x4
#select rows based on column x1
df[df$x1 == 2.3, ]
#select rows
df[c(1, 3), ]
#select columns x1 and x4
df[c("x1", "x4")]
#subset like a matrix
df[, c("x1", "x4")]
#difference in matrix subset
df[,"x1"] #dataframe subset
df["x1"] #matrix subset
x1
quit()##structure of if else condition#####
if (condition) {
  # do something
} else {
  # do something else
}

#example
x <- 1:15
x
sample(x,replace = T)
sample(x,1)
if (sample(x, 1) <= 10) {
  print("x is less than 10")
} else {
  print("x is greater than 10")
}

#vectorization form of ifelse
ifelse(x <= 10, "x less than 10", "x greater than 10")

if (sample(x, 1) < 10) {
  y <- 5
} else {
  y <- 0
}
y
y <- if (sample(x, 1) < 10) {
  5
} else {
  0
}
y

#for loop
for (i in 1:10) {
  print(i)
}

x <- c("apples", "oranges", "bananas", "strawberries")
x[4]
for (i in x) {
  print(x[i])
}

for (i in 1:4) {
  print(x[i])
}

for (i in seq(x)) {
  cat("value",x[i])
}

for (i in 1:4) print(x[i])

m <- matrix(1:10, 2)
m
for (i in seq(nrow(m))){
  for (j in seq(ncol(m))) {
    print(m[i, j])
  }
}

#while loop
i <- 1

while (i < 10) {
  print(i)
  i <- i + 1
}

#even number
for (i in 1:20) {
  if (i%%2 == 1) {
    next
  } else {
    print(i)
  }
}


f <- function(x) x


x <- 5
f <- function() {
  y <- 10
  c(x = x, y = y)
}
f()

x <- 5
g <- function() {
  x <- 20
  y <- 10
  c(x = x, y = y)
}
g()



# first row contains variable names, comma is separator 
# assign the variable id to row names
# note the / instead of \ on mswindows systems 
mydata <- read.table("c:/mydata.csv", header=TRUE, 
                     sep=",", row.names="id")


# read in the first worksheet from the workbook myexcel.xlsx
# first row contains variable names
library(xlsx)
mydata <- read.xlsx("c:/myexcel.xlsx", 1)

# read in the worksheet named mysheet

mydata <- read.xlsx("c:/myexcel.xlsx", sheetName = "mysheet")


# last option converts value labels to R factors




# input Stata file
library(foreign)
mydata <- read.dta("c:/mydata.dta")

# input Systat file
library(foreign)
mydata <- read.systat("c:/mydata.dta")


write.table(mydata, "c:/mydata.txt", sep="\t")

library(xlsx)
write.xlsx(mydata, "c:/mydata.xlsx")


# write out text datafile and
# an SPSS program to read it
library(foreign)
write.foreign(mydata, "c:/mydata.txt", 
              "c:/mydata.sps",   
              package="SPSS")

# write out text datafile and
# an SAS program to read it
library(foreign)
write.foreign(mydata, "c:/mydata.txt", 
              "c:/mydata.sas",   package="SAS")

# export data frame to Stata binary format 
#----------------
sort(x1)
sum(x1)
sort(x3)
