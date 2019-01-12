#multi linear regression
housing<- read.csv(file.choose())
#price is sale price.
#aread is total size in sqft
#bedrooms gives total number of bedrooms.
#bathroom total number of bathrooms
str(housing)
#mainroad convert factor
str(housing$mainroad)
summary(factor(housing$mainroad))
#simple way is to convert yes and no into 0 and 1s.
#changing levels first
levels(housing$mainroad)<-c(0,1)
#changing actual values
housing$mainroad<-as.numeric(levels(housing$mainroad))[housing$mainroad]
levels(housing$guestroom)<-c(0,1)
housing$guestroom<-as.numeric(levels(housing$guestroom))[housing$guestroom]

levels(housing$basement)<-c(0,1)
housing$basement<-as.numeric(levels(housing$basement))[housing$basement]


levels(housing$hotwaterheating)<-c(0,1)
housing$hotwaterheating<-as.numeric(levels(housing$hotwaterheating))[housing$hotwaterheating]

levels(housing$airconditioning)<-c(0,1)
housing$airconditioning<-as.numeric(levels(housing$airconditioning))[housing$airconditioning]

levels(housing$prefarea)<-c(0,1)
housing$prefarea<-as.numeric(levels(housing$prefarea))[housing$prefarea]

#furnishing has many levels how to do it if there are many levels and u cant count.
#by using dummy variables.
#Semi     Unfur    Fur
#0         1        0
#1         0        0
#need only 2 dummy variables as based on the 2 we can know if its furnished.
#so for n variables we need n-1 dummy variables.
#function to use dummy is model.matrix
dummy_1<-data.frame(model.matrix(~furnishingstatus, data = housing))
View(dummy_1)
#removing first column
dummy_1<-dummy_1[,-1]

#add the 2 dummy columns to the data and delete original furninshing column.
housing_1<-cbind(housing[,-13],dummy_1)
###Derived metrics
housing_1$areaperbedroom <-housing_1$area/housing_1$bedrooms
housing_1$bbratio<-housing_1$bathrooms/housing_1$bedrooms
View(housing_1)

#Building model
set.seed(100)
trainindices<-sample(1:nrow(housing_1),0.7*nrow(housing_1))
train<-housing_1[trainindices,]
test<-housing_1[-trainindices,]

model_1<-lm(price~.,data = train)
summary(model_1)
 library(car)
#variance inflation factor comes with car package.
vif(model_1)
summary(model_1)
#remove bathroom as highest vif? no . check p value star is there that means its statistically significant. hence check other 
#variable which dont have star. like bbratio. so remove bbratio.
#after that check R square and adjusted R square. if theres huge decrese in adjusted r square the should not drop.
#drop bbratio from model
model_2<-lm(formula = price ~area+bedrooms+bathrooms+stories+mainroad+guestroom+basement+hotwaterheating+airconditioning+areaperbedroom+furnishingstatussemi.furnished+furnishingstatusunfurnished+parking+prefarea,data = train)
vif(model_2)
summary(model_2)
# as areaperbedroom vif is high and no star for significance will remove it.
model_3<-lm(formula = price ~area+bedrooms+bathrooms+stories+mainroad+guestroom+basement+hotwaterheating+airconditioning+furnishingstatussemi.furnished+furnishingstatusunfurnished+parking+prefarea,data = train)
vif(model_3)
summary(model_3)
#vif values not to be checked as they are very small all of them
#p values to be checked
#remove semi furnished as highest p value without star
model_4<-lm(formula = price ~area+bedrooms+bathrooms+stories+mainroad+guestroom+basement+hotwaterheating+airconditioning+furnishingstatusunfurnished+parking+prefarea,data = train)
summary(model_4)
#remove bedrooms as no stars.
model_5<-lm(formula = price ~area+bathrooms+stories+mainroad+guestroom+basement+hotwaterheating+airconditioning+furnishingstatusunfurnished+parking+prefarea,data = train)
summary(model_5)
#remove bedroom
model_6<-lm(formula = price ~area+bathrooms+stories+mainroad+guestroom+hotwaterheating+airconditioning+furnishingstatusunfurnished+parking+prefarea,data = train)
summary(model_6)
#repeat it till you have only 3 stars in the model.