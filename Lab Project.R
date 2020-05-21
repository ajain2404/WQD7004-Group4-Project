install.packages("plyr")
library(plyr)
install.packages("dplyr")
library(dplyr)


getwd()
PATH = "heart.csv"
df = read.csv(PATH,header=TRUE)

class(df)
str(df)
dim(df)
summary(df)

# Need to chg column name?

# remove duplicate row




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

df


# Detecting Outliers for each col
hist(df$age)
boxplot(df$age)

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




# Need to do?
# chg col name
# remove duplicated value


#troubleshooting
# thal value have 0,1,2,3,4 value... while its 1,2,3 in kaggle's description

df




