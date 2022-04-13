##################################################
####  Introduction to R & RStudio             ####
####   	    Henry Athiany                     #### 
####  		Session I		      ####
##################################################


#########
## Launching R and checking version
version


#########
## Datasets in R
data()
?trees

#########
## The R command line and script editor

#Multiplying 3 by 4
3*4

#########
## R Workspace
getwd() 

#set working directory
setwd("C:/Users/HP/OneDrive/alborada_RCourse")

#similar to above but see the backslash
setwd("C:\\Users\\HP\\OneDrive\\alborada_RCourse") 
getwd()


#########
#creating our first few objects

x<-10 # Assigning the value 10 to the variable x

x # Calling the value assigned to x

y=2 # Assigning the value 2 to the variable x

z<-x/y # assigning the value z to x/y

z # calling z


# lets assign an object first
tmp <- 1:4
ls() #list objects in R
rm(x)  # Remove a specific object :rm(object)
rm(list = ls())


# Logical operations
a <- c(1:12)
a>9 OR a<4
# Gives us 1 2 3 10 11 12

#Having R do this
a
a>9
a<4
a>9 | a<4
a[a>9 | a<4]

## R as a Calculator
# Addition and Subtraction
5+4
124 - 26.82
# Multiplication and Division
5*4
35/8
# Exponentials and Exponential Function:
# 3^(1/2)  & exp(1.5)

#########  
## Saving and Loading Script

## Comments in R
- Type the following line and run the code ``#This is my first comment``

#########
## Installating  R packages
install.packages("pubh")
install.packages("pubh",quiet=TRUE)
install.packages("dplyr", dependencies=TRUE)
# knowing the version of the package installed
packageVersion("pubh")
# packages installed on your computer/laptop
nrow(installed.packages())

# Ex: Try installing the package **gdata** using RStudio environment

#########
## Loading R Packages
library(MASS,quiet=TRUE)
library(dplyr,quiet=TRUE)
library(desc,quiet=TRUE)

#########
## Vignettes
# list all available vignettes
vignette()
vignette("pubh")

