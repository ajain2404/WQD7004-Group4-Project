#Saira Rupesh Nanglia (Matric No.17216654/1)
#Cleaning columns "age" and "ca" as part of data cleaning

#I am using data.table package for data cleaning to group age in different categories
install.packages("data.table")
library(data.table) 

#Setting the working directory
setwd("C:/Users/Saira/Desktop/Project-Dataset")
getwd()

#Read File
df=read.csv('Unclean_Data-heart.csv')

hist(df$age)
boxplot(df$age)

#Creating a vector for grouping the age values from 'age' column into age groups
agebreaks <- c(0,6,11,16,21,26,31,36,41,46,51,56,61,66,71,76,81,86,110)
agelabels <- c("0-5","6-10","11-15","16-20","21-25","26-30","31-35",
               "36-40","41-45","46-50","51-55","56-60","61-65","66-70",
               "72-75","76-80","81-85","85+")

setDT(df)[ , agegroups := cut(df$age, breaks = agebreaks, right = FALSE, labels = agelabels)]

#column ca corresponds to number of major vessels (0-3) colored by flourosopy
#we have values 4 which is invalid, replacing 4 by median
length(filter(df,df$ca==4))
median(df$ca)

#17 records have invalid value replace it with median which is 0

df$ca[which(df$ca == 4)] = median(df$ca)
filter(df,df$ca==4)

#writing the cleaned columns. You will see old columns as I am keeping for reference. Along with that you will see new column "agegroups" and updated "ca" column with clean values.
write.csv(df,"CleanedHeartData.csv")

 