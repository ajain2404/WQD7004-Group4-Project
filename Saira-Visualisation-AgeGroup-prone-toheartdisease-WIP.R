#Saira Rupesh Nanglia
#Metric-17216654/1
#----------------------------------------------------------------------------------------

#install.packages("plyr")
library(plyr)
#install.packages("dplyr")
library(dplyr)
# install.packages("data.table")
library(data.table) 

#Setting the working directory

#dev.off()
getwd()
PATH <- paste(getwd(), "Raw_Data-heart.csv", sep = '/')
df = read.csv(PATH,header=TRUE)

class(df)
str(df)
dim(df)
summary(df)


hist(df$agegroups)
boxplot(df$age)

#Creating a vector for grouping the age values from 'age' column into age groups
agebreaks <- c(0,6,11,16,21,26,31,36,41,46,51,56,61,66,71,76,81,86,110)
agelabels <- c("0-5","6-10","11-15","16-20","21-25","26-30","31-35",
               "36-40","41-45","46-50","51-55","56-60","61-65","66-70",
               "72-75","76-80","81-85","85+")

setDT(df)[ , agegroups := cut(df$age, breaks = agebreaks, right = FALSE, labels = agelabels)]
hist(table(df$agegroups))

#column "ca" corresponds to number of major vessels (0-3) colored by flourosopy.
#for column "ca" we have 18 records with values 4 which is invalid, calculating median and replacing 4 by median which is 0
length(filter(df,df$ca==4))
median(df$ca)
boxplot(df$ca)
df$ca[which(df$ca == 4)] = median(df$ca)
filter(df,df$ca==4)
hist(df$ca)
boxplot(df$ca)

#-------------------------------------------------------------------------------------------


df

write.csv(df,"CleanedHeartData.csv")


