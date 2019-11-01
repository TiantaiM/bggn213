# Class 5 Data visualization
?rnorm
x <- rnorm(1000)

# How many things are in x
length(x)

mean(x)
sd(x)

summary(x)

# boxplot
boxplot(x)
# histogram
hist(x)
hist(x , breaks = 30)

rug(x)

weight <- read.table("bimm143_05_rstats/weight_chart.txt", header = TRUE)
plot(weight$Age, weight$Weight, type = "o", pch = 15, cex = 1.5, lwd = 2, ylim = c(2,10)
     , xlab = "Age (months)", ylab = "Weight(kg)", main = "Baby weight with age",
     col = "blue")

mouse <- read.delim("bimm143_05_rstats/feature_counts.txt", sep = "\t", header = TRUE)
mouse
barplot(mouse$Count, horiz = TRUE, ylab = "", names.arg = mouse$Feature, 
        main = "Number of features in the mouse GRCm38 genome", las = 1, xlim = c(0,80000) )
par(mar=c(4,11,4,2))

x <- c(rnorm(10000),rnorm(10000)+4)
hist(x, breaks = 50)

sex <- read.delim("bimm143_05_rstats/male_female_counts.txt", header = TRUE)
sex
barplot(sex$Count, col = c("blue2", "red2"), las = 2, names.arg = sex$Sample, ylab = "Counts")

expression <- read.delim("bimm143_05_rstats/up_down_expression.txt", header = TRUE)
expression
str(expression)
nrow(expression)
table(expression$State)
plot(expression$Condition1, expression$Condition2, col = expression$State)

levels(expression$State)

palette(c("blue","grey","red"))
plot(expression$Condition1, expression$Condition2, col = expression$State)






