
library(rjson)
getwd()

#created 3 json files text1,text2 and text3 in working directory.
#importing in R below.
resulttext1 <- fromJSON(file = "text1.json")
resulttext2 <- fromJSON(file = "text2.json")
resulttext3 <- fromJSON(file = "text3.json")
#displaying results
resulttext1
resulttext2
resulttext3

#converting imported files into respective dataframes.

resultasdataframe1 <- as.data.frame(resulttext1)
resultasdataframe2 <- as.data.frame(resulttext2)
resultasdataframe3 <- as.data.frame(resulttext3)
