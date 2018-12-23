#Problem Statement
#1. Test whether two vectors are exactly equal (element by
#                                               element)
vec1 = c(rownames(mtcars[1:15,]))
vec2 = c(rownames(mtcars[11:25,]))

vec1 ==vec2
#Element by element is not equal for vec1 and vec2 hence all returned FALSE.

#2. Sort the character vector in ascending order and descending
#order
vec1 = c(rownames(mtcars[1:15,]))
vec2 = c(rownames(mtcars[11:25,]))

sort(vec1,decreasing = FALSE)
sort(vec1,decreasing = TRUE)

sort(vec2,decreasing = FALSE)
sort(vec2,decreasing = TRUE)

#3.What is the major difference between str c() and paste()
#show an example.

#Str_c is equivalent to paste(), which means you do have the option to 
#customize your desired separator. The difference is for str_c() the
#default is no separator
#Example below.
#Default str_c example

vec3<- c("This","to","strc")
vec4<- c("is","test","paste")

library(stringr)
str_c(vec3,vec4)
#We can see in above str_c command in the console that default is with no separator.

str_c(vec3,vec4,sep = ".")
#Above is the str_c command with separator "."

#paste command example.
#The below default paste command unlike str_c adds a space separator. 
paste(vec3,vec4)
#Below is the paste commmand with separator "."
paste(vec3,vec4,sep = ".")

#4#Introduce a separator when concatenating the strings

#Elementwise concatenation of string vectors with separator "$"
paste(vec1,vec2,sep = "$")
