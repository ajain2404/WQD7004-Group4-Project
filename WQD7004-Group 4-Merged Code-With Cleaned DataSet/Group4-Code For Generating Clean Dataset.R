#Project Title : Likelihood to get heart disease among patients
#Group No: 4
#Group Members: Names listed below sorted with Matric No.
#17028703 -   Tan Chee Yu
#17096993 -   Lu Xian Ding
#17201982 -   Nicholas Lee Kan
#17216654/1 - Saira Rupesh Nanglia
#17217542 -   Nik Faiz Afiq
#17218915 -   Muhammad Ikhwan b Nawari
#17219953 -   Arihant Jain
#----------------------------------------------------------------------------------------

install.packages("plyr")
library(plyr)
install.packages("dplyr")
library(dplyr)
install.packages("data.table")
library(data.table) 

#Setting the working directory
setwd('C:/Users/Saira/Desktop/Project-Dataset')
dev.off()
getwd()
PATH = "Unclean_Data-heart.csv"
df = read.csv(PATH,header=TRUE)

class(df)
str(df)
dim(df)
summary(df)

#---- Cleaning the "Age" and "ca" columns by Saira ----------------------------------------

#I am using "data.table" package for grouping age date. This will help us in visualization, instead of showing each age value.
#Grouping is the technique where we apply logic to data fields to recognise that those data have a common characteristic. 


hist(df$age)
boxplot(df$age)

#Creating a vector for grouping the age values from 'age' column into age groups
agebreaks <- c(0,6,11,16,21,26,31,36,41,46,51,56,61,66,71,76,81,86,110)
agelabels <- c("0-5","6-10","11-15","16-20","21-25","26-30","31-35",
               "36-40","41-45","46-50","51-55","56-60","61-65","66-70",
               "72-75","76-80","81-85","85+")

setDT(df)[ , agegroups := cut(df$age, breaks = agebreaks, right = FALSE, labels = agelabels)]

#column "ca" corresponds to number of major vessels (0-3) colored by flourosopy.
#for column "ca" we have 18 records with values 4 which is invalid, calculating median and replacing 4 by median which is 0
length(filter(df,df$ca==4))
median(df$ca)

df$ca[which(df$ca == 4)] = median(df$ca)
filter(df,df$ca==4)

#-------------------------------------------------------------------------------------------


#---- Cleaning the "Sex", "fbs", "exang","thal","target" columns by Niq Faiz and Nicholas -----

# We are using plyr and dplyr packages

# Chaging Data value

hist(df$sex)
df$sex <-recode(df$sex, "0" ="Female","1" ="Male")

hist(df$fbs)
df$fbs <-recode(df$fbs, "1" = TRUE, "0"=FALSE)


hist(df$exang)
df$exang <-recode(df$exang, "1" = "Yes", "0" = "No")

hist(df$thal)
df$thal <-recode(df$thal,"0" = "Normal","1" = "Normal", "2" = "Fixed defect", "3" = "Reversable defect")

hist(df$target)
df$target <- recode(df$target, "0" = "No heart disease", "1" = "Have Heart Disease")

#--------------------------------------------------------------------------------------------

# Detecting Outliers for each col

hist(df$cp)
boxplot(df$cp)

hist(df$trestbps)
boxplot(df$trestbps)

hist(df$chol)
boxplot(df$chol) # Found Outlier
df[df$chol >=500,] # See outlier
# df = df[!df$chol >= 500,]  #Removing row w outliers if want to remove

hist(df$restecg)
boxplot(df$restecg)

hist(df$thalach)
boxplot(df$thalach)

hist(df$oldpeak)
boxplot(df$oldpeak)
df[df$oldpeak >= 5,] # See the outlier
# df = df[!df$oldpeak >= 5,]  #Remove outlier row if decided to remove

hist(df$slope)
boxplot(df$slope)

hist(df$ca)
boxplot(df$ca)


# Checking any null value
any(is.null(df))
sum(is.na(df))


#Checking for NA value
any(is.na(df))
sum(is.na(df))

# if found NA/Null value
# sum(is.na(df$Sex)) #Checking for the total number of missing values in a particular column
# na.omit(df) #Eliminating missing values completely from the entire dataframe
# data[is.na(data)]<- 0 #Replacing the NA's in the entire dataframe with '0's
# data$Dist_Taxi[is.na(data$Dist_Taxi)]<-median(data$Dist_Taxi) #Replacing the NA's in a particular column with a summary statistics like median

#Writing the cleaned data set
df

write.csv(df,"CleanedHeartData.csv")


