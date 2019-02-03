#market basket analysis
#dataset is market basket optimisation
install.packages('arules')
library(arules)
Transactiondata <- read.csv(file.choose(),header = F)
#convert the data into 0 and 1 into a sparse matrix
Transactiondata <- read.transactions(file.choose(),sep = ',',rm.duplicates = T)
#We dont want quantity of products. we just want one instance of the product bought hence
#duplicates is True.only the frequency is needed
#can't see the sparse dataset.
summary(Transactiondata)
itemFrequencyPlot(Transactiondata,topN=10)
#TOP n gives the top N products.
rules = apriori(data = Transactiondata,parameter = list(support=0.003,confidence=.4))
#console shows writing 0 rules means nothign found with such high confidence then reduce confidence
#with 0.4 found 281 rules or baskets.
inspect(rules[1:10])
# we want with the highest lift so will sort rules
inspect(sort(rules,by='lift')[1:10])
