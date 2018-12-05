View(diamonds)
library(ggplot2)
diamonds1<- head(diamonds, n = 50)
#creating line graph  for diamonds subset.
scat<-ggplot(diamonds1,aes(x=depth,y=price)) + geom_line(color= "red")
scat<- scat+ggtitle("THE FIRST 50 ROWS FROM DIAMONDS DATASET")
scat<-scat+labs(x="Price in dollar",y= "Depth of Diamond")
scat<-scat + theme(axis.text.x=element_text(color = "seagreen1", vjust=0.45),
                   axis.text.y=element_text(color = "violet", vjust=0.45))
scat<-scat +ylim(200,450)+xlim(40,70)
#geom_smooth used for a trend line  - check in help
#facet_wrap check it, creates multiple visualisations...for one variable
#facet_grid creates multiple v for more than one variable.