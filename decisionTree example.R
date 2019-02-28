install.packages('party')
library(party)
readingSkills
head(readingSkills)
input.dat <- readingSkills[c(1:105),]
output.tree <- ctree(nativeSpeaker~ age + shoeSize + score, data = input.dat)
plot(output.tree)
#Conclusion
#From the decision tree shown above
#we can conclude that anyone whose readingSkills score is less than
#38.3 and age is more than 6 is not a native Speaker.