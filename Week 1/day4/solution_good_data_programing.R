## ----setup, include=FALSE--------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## ----step2, warning=FALSE, message=FALSE-----------------------------------------
#----------------------------------------------
## f_StaR Good programming skills
## Author: Ken Mwai - April 2022
#----------------------------------------------
#----------------------------------------------
# 0 - Load libraries 
#----------------------------------------------
library(stats)
library(dplyr)
library(janitor)
#----------------------------------------------
# 1 - Source Data
#----------------------------------------------
df1 <- mtcars

#----------------------------------------------
#' 2 - Dimension of the the data
#' Shows the number of rows and columns
#----------------------------------------------
dim(df1)

#----------------------------------------------
#' 3 - The first few observations of the data
#----------------------------------------------
head(df1)

#----------------------------------------------
#' 3 - The data structure
#----------------------------------------------
glimpse(df1)
str(df1)

#----------------------------------------------
#' 3 - The summary statistics of the data
#----------------------------------------------
summary(df1)

#----------------------------------------------
#' 4 - The duplicates of the gear variable
#----------------------------------------------
janitor::get_dupes(df1, gear)

## Another way of doing it
df1 %>% get_dupes(gear)

