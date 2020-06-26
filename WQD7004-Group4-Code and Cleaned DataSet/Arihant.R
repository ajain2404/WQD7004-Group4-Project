library(dplyr) 
library(ggplot2)
library(ggpubr)
library(wesanderson)
theme_set(theme_pubclean())

#_________________________________________Data Loading Begins________________________________________________________#
setwd("D:/Github/WQD7004-Group4-Project")
heart = read.csv("CleanedHeartData.csv",header = TRUE, sep=",")


df <- heart %>% 
  mutate(sex = as.character(sex)) %>% 
  mutate(sex = replace(sex, sex == '1', 'Male'))

df <- df %>% 
  mutate(sex = as.character(sex)) %>% 
  mutate(sex = replace(sex, sex == '0', 'Female'))

df <- df %>% 
  mutate(target = as.character(target)) %>% 
  mutate(target = replace(target, target == '1', 'Present'))

df <- df %>% 
  mutate(target = as.character(target)) %>% 
  mutate(target = replace(target, target == '0', 'Not Present'))


df <- df %>%
  filter(target == 'Present')%>%
  group_by(sex,agegroups)
  # order_by(sex,agegroups) %>%
  # summarise(counts = n()) 
head(df, 120)
#_________________________________________Data Loading Ends__________________________________________________________#


# #Count
# p <- ggplot(df, aes(x = sex, y = counts, fill = agegroups)) +
#   geom_bar(stat = "identity",position = position_dodge(0.8),width = 0.7)
# 
# p + labs(fill = "Presence of Heart Diesease")

#_________________________________________Count Ends_________________________________________________________________#

#Plot Graph

ggplot(df, aes(x= agegroups,  group=sex)) + 
  geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") +
  geom_text(aes( label = scales::percent(round(..prop..,digits = 2)),
                 y= ..prop.. ), stat= "count", vjust = -.5) +
  labs(y = "Percent", fill="Age Groups") +
  facet_grid(~sex) +
  scale_y_continuous(labels = scales::percent)
