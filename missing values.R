
Miss <- read.csv(file.choose(),na.strings=c(""))
head(Miss,n=13)
View(Miss)
tail(Miss)
Miss[,]
#complete cases returns logical vector True or False. False for missing data. 
complete.cases(Miss)

# to view list of rows where NA is present below command.
View(Miss[!complete.cases(Miss),])
#to view the list of rows where Column Expense is NA below command.
Miss[is.na(Miss$Expenses),]
#Removing records with missing data
Miss_backup <- Miss
Miss[!complete.cases(Miss),]
#below command identitifies list of missing cases for Industry column.
Miss[is.na(Miss$Industry),]
#Miss is reset to exclude the above rows. 
Miss<- Miss[!is.na(Miss$Industry),]

#resetting dataframe
rownames(Miss)<-1:nrow(Miss)
Miss[is.na(Miss$State),]
Miss[is.na(Miss$State)& Miss$City =="New York",]
Miss[is.na(Miss$State)& Miss$City =="New York","State"] <- "NY"
Miss[is.na(Miss$State)& Miss$City =="San Francisco",]
Miss[is.na(Miss$State)& Miss$City =="San Francisco","State"] <- "CA"
View(Miss)
median(Miss[,"Employees"],na.rm = T)
Emp_med_retail <- median(Miss[Miss$Industry=="Retail","Employees"],na.rm = T)
Miss[is.na(Miss$Employees) & Miss$Industry =="Retail",]
Miss[is.na(Miss$Employees) & Miss$Industry =="Retail","Employees"] <-Emp_med_retail 
Miss[is.na(Miss$Employees),]
Med_fin <- median(Miss[Miss$Industry=="Financial Services","Employees"],na.rm = T)
Miss[is.na(Miss$Employees) & Miss$Industry =="Financial Services","Employees"]<-Med_fin
Miss[!complete.cases(Miss),]
Miss$Growth <- as.numeric(Miss$Growth)
Med_Grwth_Constr <-median(Miss[Miss$Industry=="Construction","Growth"],na.rm = T)
Miss[is.na(Miss$Growth) & Miss$Industry =="Construction",]
Miss[is.na(Miss$Growth) & Miss$Industry =="Construction","Growth"] <- Med_Grwth_Constr
