str1 <- 'This is a string'
print(str1)
str2 <- "And so is this"
str3 <- paste(str1,str2)
print (str3)
nchar(str3)
str4 <- toupper(str3)
str5 <- tolower(str2)

str6 <- substr(str4,5,12)
print(str6)