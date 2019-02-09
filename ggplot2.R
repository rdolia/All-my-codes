library(ggplot2)
data("diamonds")
View(diamonds)
help(diamonds)
#An "aesthetic" is a dimension of a graph that we can perceive visually:
ggplot(diamonds,aes(carat,price))+geom_point()
gg <- ggplot(diamonds, aes(x=carat, y=price)) + geom_point()
gg
ggplot(diamonds,aes(x=carat, y=price)) + geom_line()
gg

#To add an aesthetic, "color=clarity", using clarity, which is a measure of the clarity of each diamond, to color our points. 
ggplot(diamonds, aes(x=carat, y=price, color=clarity)) + geom_point()
ggplot(diamonds, aes(x=carat, y=price, color=color)) + geom_point()
ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point()
ggplot(diamonds, aes(x=carat, y=price, color=clarity, size=cut)) + geom_point()
ggplot(diamonds, aes(x=carat, y=price, color=clarity, shape=cut)) + geom_point()
#add additional layer using the plus sign.
ggplot(diamonds, aes(x=carat, y=price)) + geom_point() + geom_smooth(se=FALSE)
ggplot(diamonds, aes(x=carat, y=price)) + geom_point() + geom_smooth(se=FALSE, method="lm")
ggplot(diamonds, aes(x=carat, y=price, color=clarity)) + geom_point() + geom_smooth(se=FALSE)
ggplot(diamonds, aes(x=carat, y=price, color=clarity)) + geom_smooth(se=FALSE)
ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point() + facet_wrap(~ clarity)
#~ expalined by
ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point() + facet_grid(color ~ clarity)
ggplot(diamonds, aes(x=carat, y=price)) + geom_point() + ggtitle("My scatter plot")
ggplot(diamonds, aes(x=carat, y=price)) + geom_point() + ggtitle("My scatter plot") + xlab("Weight (carats)")
ggplot(diamonds, aes(x=carat, y=price)) + geom_point() + ggtitle("My scatter plot") + xlab("Weight (carats)") + xlim(0, 2)
ggplot(diamonds, aes(x=carat, y=price)) + geom_point() + ggtitle("My scatter plot") + xlab("Weight (carats)") + ylim(0, 10000)
ggplot(diamonds, aes(x=price)) + geom_histogram()
ggplot(diamonds, aes(x=price)) + geom_histogram(binwidth=2000)
ggplot(diamonds, aes(x=price)) + geom_histogram(binwidth=200) + facet_wrap(~ clarity)
ggplot(diamonds, aes(x=price)) + geom_histogram(binwidth=200) + facet_wrap(~ clarity, scale="free_y")
ggplot(diamonds, aes(x=price, fill=clarity)) + geom_histogram()
ggplot(diamonds, aes(x=price)) + geom_density()
ggplot(diamonds, aes(x=price, color=cut)) + geom_density()
#One common method in statistics for comparing multiple densities is to use a boxplot.
#A boxplot has two attributes: an x, which is usually a classification into categories
#and y, the actual variable that you're comparing.
ggplot(diamonds, aes(x=color, y=price)) + geom_boxplot()
