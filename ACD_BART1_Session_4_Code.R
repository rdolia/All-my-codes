letters
LETTERS
which(letters=="k")

sports<-c('football','cricket','basketball','baseball','hockey','tennis')
popularsports<-c('rugby','cricket','badminton','football','baseball','tennis','basketball')

sports[which(sports %in% popularsports)]
sports [which(sports %in% popularsports)]



x<-"R function to concatenate several strings into one string is paste"
x
y<- 'this is a paste function'
y

paste0(y,x)
paste(y,x)

grep('paste',x)
grep('paste',y)

install.packages('pryr')
library(pryr)
object_size(1:100000000)

object_size(mean)
library(ggplot2)
View(diamonds)
object_size(diamonds)

object_size(numeric())

object_size(logical())

object_size(raw())

object_size(list())

x <- 1:1e6
x
object_size(x)

y <- list(x, x, x)
object_size(y)

object_size(x, y)

x1 <- 1:1e6
y1 <- list(1:1e6, 1:1e6, 1:1e6)

object_size(x1)

object_size(y1)

object_size(x1, y1)

object_size(x1) + object_size(y1) == object_size(x1, y1)


object_size("business analytics and data science")

object_size(rep("business analytics and data science", 100))

library(pryr)
mem_used()
#Both R and the operating system are lazy: they won't reclaim memory until it's actually needed. R might be holdingon to memory because the OS hasn't yet asked for it back.

# Need about 4 mb to store 1 million integers
mem_change(x <- 1:1e6)
#mem_change() builds on top of mem_used() to tell you how memory changes during code execution.
# We get that memory back when we delete it
mem_change(rm(x))

mem_change(NULL)

# Create a big object
mem_change(x <- 1:1e6)

# Also point to 1:1e6 from y
mem_change(y <- x)

# Remove x, no memory freed because y is still pointing to it
mem_change(rm(x))

# Now nothing points to it and the memory can be freed

# sorting examples using the mtcars dataset
attach(mtcars)
View(mtcars)
# sort by mpg
mtcars[,2]
newdata <- mtcars[order(mpg),] 
head(newdata,n=10)
tail(newdata)
# sort by mpg and cyl
newdata <- mtcars[order(mpg, cyl),]
View(newdata)
#sort by mpg (ascending) and cyl (descending)
newdata <- mtcars[order(mpg, -cyl),] 
newdata
head(newdata)
detach(mtcars)

#add a column to the mtcars dataset
mtcars$brands <-rownames(mtcars)
View(mtcars)
dfA = mtcars[,c(1,2,12,5,6)]
head(dfA)

dfB = mtcars[,c(12,1,2,3,4,6,7)]
head(dfB)
# merge two data frames by brands
total <- merge(dfA,dfB,by="brands")
View(total)

# merge two data frames by two variables
total <- merge(dfA,dfB,by=c("brands","cyl"))
head(total)

#add a common column to the mtcars dataset
mtcars$brands <-rownames(mtcars)
dfA = mtcars[sample(10,nrow(mtcars),replace = T),]
head(dfA)
View(dfA)
dim(dfA)
View(dfB)
dfB = mtcars[sample(20,nrow(mtcars),replace = T),]
head(dfB)
dim(dfB)

# merge two data frames by row
total <- rbind(dfA,dfB)
head(total)
dim(total)

#Extract or replace substrings in a character vector.
x <- "AcadGild, a leading technical and business course provider,offers mentor-led online courses to help professionals upskill." 
substr(x, 1, 10) 
substr(x, 1, 20) 

#Search for pattern in x. If fixed =FALSE then pattern is a regular 
#expression. If fixed=TRUE then pattern is a text string. Returns matching indices
grep("AcadGild", x, fixed=TRUE)

#Find pattern in x and replace with replacement text. If fixed=FALSE then pattern 
#is a regular expression.
#If fixed = T then pattern is a text string. 
sub("\\ing","GREAT",x)

#Split the elements of character vector x at split. 
strsplit(x,"")

#to upper
toupper(x)

#to lower
tolower(x)

word="apple|lime|orange"
v=strsplit(word,split="|",fixed=TRUE)
v[[1]][1]
v[[1]]

x=c("apple","banana","grape")
sub("a",'$',x)
gsub("a","$",x)


x=c("apple","banana","grape")
regexpr('a',x)
gregexpr("ss","Assessed")

x=c("apple","banana","grape")
x
r=regexpr("a",x)
regmatches(x,r)

#mtcars example
head(mtcars)
mean(mpg) #wont work
#need to write
mean(mtcars$mpg)

#if we do attach
attach(mtcars)

# now try the same function
mean(mpg)

# also the ref function
mean(mtcars$mpg)

#after completion of work
detach(mtcars)



