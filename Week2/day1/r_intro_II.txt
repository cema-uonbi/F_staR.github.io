##################################################
####  Introduction to R & RStudio             ####
####   	    Henry Athiany                     #### 
####  		Session II		      ####
##################################################

########################
## Data Objects in R
########################

#########
## Data types

sch_educ <- factor(c("primary","basic","secondary"))
sch_educ
levels(sch_educ)


#########
# explore the data object
typeof(sch_educ)

#########
# explore the some examples
typeof(3)
is.numeric(3)
is.na(3)
is.na(3/0)
is.na(0/0)
3/0
0/0

################
### scalars in R
################

scalar1 <- 'this is a scalar'
scalar2 <- 104
scalar3 <- 5 + 6.5    # evaluates to the single value 11.5
scalar4 <- '4'

typeof(scalar4)    # returns: character

## what is this type?
scalar5 <- TRUE
typeof(scalar5)    # returns: logical

#################
## Vectors in R
#################

#########
## Vectors in R

x <- c(1,5,2, 6)
x
is.vector(x)

# A vector can only contain objects of the same class
a <- c(1,3,4.1,7,-1,15) # numeric vector
a
b <- c("one","two","three", "4") # character vector
b
c <- c("one","two","three", 4) # same as above?
c
d <- c(FALSE, TRUE,TRUE,FALSE,TRUE,FALSE) #logical vector
d

#########
## Vector Arithmetic
#Lets retrieve x first and then add to the new vector y
x
y <- c(1,6,4,8)
x+y
2*y

#########
## Elementwise
x*y
x/y
x
y
x%%y #what happens here? remainder? divisor>dividend?

#########
## Recycling
z<- c(1,2 ,6 ,8, 9, 10)
length(x)
length(z)
#x: 1 5 2 6
x+z
c(1 , 5, 2, 6 , 1, 5) + z

#########
## Functions on vectors
any(x>3)
all(x>3)

#########
## Built in Functions
mean(x)
which(x>3)


#########
## Vector Indexing
x[3]
x[-3]

#########
### Replacing values
x
x<-x[-3]
x


#########
## Inserting values
x <- c(x[1:2], 2, x[3])
x

#########
### Indexing with Booleans

x[x > 3]


#########
## Naming vector elements
x
names(x)
names(x) <- c("Patient A", "Patient B", "Patient C", "Patient D")
x

###############
## Lists
###############

#########
### Single Patient
a <-list(name="Angela", owed="75", insurance=TRUE)
a

#########
## List indexing
a[["name"]]
a[[1]]
a$name
#double vs single brackets
a[1] #single bracket
class(a[1])#single bracket
a[[1]] #double bracket
class(a[[1]]) #double bracket

#########
## Adding and Subtracting Elements
a$age <-31
a
a$owed <- NULL
a

#########
### List components and values
names(a)

#########
## Unlisting
a.un <- unlist(a)
a.un
class(a.un)

#########
## Using ``matrix()`` function
mat1.data<-c(1:9)
mat1<-matrix(mat1.data, nrow=3, ncol=3, byrow=TRUE)
mat1
#Not neccessary to always specify nrow and ncol, only one is ok
mat2.data<-c(10:18)
mat2<-matrix(mat2.data,nrow=3)
mat2

#########
## Using ``rbind()`` or ``cbind()`` function
mat3.data1<-c(1,2,3)
mat3.data2<-c(4,5,6)
mat3.data3<-c(7,8,9)
mat3<-cbind(mat3.data1,mat3.data2,mat3.data3)
mat3

#########
# Ex: Create a matrix using the ``dim()`` function. Try this;
mat4<-c(1:12);
dim(mat4)<-c(4,3);
mat4

####################
## DataFrames in R
####################

#########
## Creating dataframes
names <- c("Angela", "Shondra")
ages <- c(27,36)
insurance <- c(TRUE, T)
patients <- data.frame(names, ages, insurance)
patients

# Ex: Add a third patient to this list

#########
## Adding Rows or Columns
p.three <- c(names="Ann Some", age=45, insurance=TRUE)
rbind(patients, p.three)

patients$names <- as.character(patients$names)
patients <- rbind(patients, p.three)
patients

# Next appointments
next.appt <- c("05/23/2022", "06/14/2022", "08/25/2022")
#Let R know these are dates
next.appt <- as.Date(next.appt, "%m/%d/%Y")
next.appt

patients <-cbind(patients, next.appt)
patients

#########
## Accessing Data Frames
library(datasets)
titanic <- data.frame(Titanic) 
colnames(titanic)# Variables in Titanic dataframe

# Preview into data
titanic[1:2,]

# Preview into data
head(titanic)

# Indexing : same as matrices; 
# accessing age information
titanic[,3]

#########
## Other ways of creating dataframes

#method 2
df<-data.frame(test = 1:6, bar = c(T, T, F, F, T, T))

#method 3
x <- c(1,3,5,7,11)
y <- c("a","b","c","d","e")
df1 <- data.frame(x=x, y=y)
#does this work?
df2 <- data.frame(x, y)


#########
## Printing dataframes
print(df)
print(df1)
print(df2)


#########
# to checck class and structure of the dataframe
class(df) #what of df1, df2?
str(df1) #what of df, df2?

#########
## Creating a dataframe with numerical as well as factor columns 
#lets sample 4 teenagers randomly
Sex<-factor(sample(c("Male", "Female"),4, replace=TRUE ))
Age<-sample(13:19,4)
df3<-data.frame(Sex, Age)
df3


