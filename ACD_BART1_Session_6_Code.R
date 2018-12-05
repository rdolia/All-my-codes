dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)
# save the current graphical parameter setting to restore later
opar <- par(no.readonly=TRUE)
# graphs will be 2 inches wide by 3 inches tall
par(pin=c(2, 3))
#lines will be twice the default width and symbols will be 1.5 times the default size
par(lwd=2, cex=1.5)
# Axis text is italic and scaled to 75 percent of the default
par(cex.axis=.75, font.axis=3)
# first plot has filled red circles and dashed lines
plot(dose, drugA, type="b", pch=19, lty=2, col="red")
# Next plot has green filled diamonds and a blue border and blue dashed lines
plot(dose, drugB, type="b", pch=23, lty=6, col="blue", bg="green")
# Restore the original graphical parameter settings

title(main="My Title", col.main="red",
      sub="My Sub-title", col.sub="blue",
      xlab="My X label", ylab="My Y label",
      col.lab="green", cex.lab=0.75)


x <- c(1:5); y <- x # create some data
par(pch=22, col="red") # plotting symbol and color
par(mfrow=c(2,4)) # all plots on one page
opts = c("p","l","o","b","c","s","S","h")
for(i in 1:length(opts)){
  heading = paste("type=",opts[i])
  plot(x, y, type="n", main=heading)
  lines(x, y, type=opts[i])
}
dev.off()
dotchart(mtcars$mpg,labels=row.names(mtcars),
         cex=.5, color = "blue",
         main="Gas Milage by Cars", xlab="Miles/Gallon")
par(mfrow=c(1,1))
#dot plot by group
myCars <- mtcars[order(mtcars$mpg),] # ordering the
myCars$cyl <- factor(myCars$cyl) # making cyl into
myCars$color[myCars$cyl==4] <- "red" # assigning
myCars$color[myCars$cyl==6] <- "blue" # assigning
myCars$color[myCars$cyl==8] <- "purple" # assigning
dotchart(myCars$mpg,labels=row.names(myCars),
         cex=.5, groups= myCars$cyl,
         main="Gas Milage by Cars",
         xlab="MPG", color=myCars$color)

counts <- table(mtcars$gear)
barplot(counts, main="Car Distribution",
        xlab="Number of Gears")

counts <- table(mtcars$gear)
barplot(counts, main="Car Distribution", horiz=TRUE,
        names.arg=c("3 Gears", "4 Gears", "5 Gears"))

counts <- table(mtcars$vs, mtcars$gear)
barplot(counts, main="Car Distribution by
        Gears and V/S",
        xlab="Number of Gears",
        col=c("blue","orange"),
        legend = rownames(counts))

counts <- table(mtcars$vs, mtcars$gear)
barplot(counts, main="Car Distribution by Gears
and V/S",
        xlab="Number of Gears",
        col=c("blue","pink"),
        
        legend = rownames(counts),
        beside = T)

slices <- c(10, 12,4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany",
          "France")
pie(slices, labels = lbls, main="Pie Chart of Countries")

slices <- c(10, 12, 4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany",
          "France")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to
lbls <- paste(lbls,"%",sep="") # add % to
pie(slices,labels = lbls,
    col=rainbow(length(lbls)),
    main="Pie Chart of Countries")

library(plotrix)
slices <- c(10, 12, 4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany",
          "France")

pie3D(slices,labels=lbls,explode=0.3,
      main="Pie Chart of Countries ")


hist(mtcars$mpg)

attach(mtcars)
plot(wt, mpg, main="Scatterplot Example",
     xlab="Car Weight ", ylab="Miles Per
     Gallon ", pch=19)
abline(lm(mpg~wt), col="red") # regression line
lines(lowess(wt,mpg), col="blue") #local polynomial regression fitting

library(car)

pairs(~mpg+disp+drat+wt,data=mtcars,
      main="Simple Scatterplot Matrix")


library(scatterplot3d)
attach(mtcars)
scatterplot3d(wt,disp,mpg, main="3D Scatterplot")

library(scatterplot3d)
attach(mtcars)
scatterplot3d(wt,disp,mpg, pch=16,
              highlight.3d=TRUE,
              type="h", main="3D Scatterplot")


