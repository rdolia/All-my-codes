#Eclat
#simpler algorithm for market basket analysis
library(arules)
Eclatdata <- read.transactions(file.choose(),sep = ',',rm.duplicates = T)
summary(Eclatdata)
itemFrequencyPlot(Eclatdata,topN=10)
#eclat training
rules = eclat(Eclatdata,parameter = list(support = 0.003,minlen = 2))
inspect(sort(rules,by = 'support')[1:10])
