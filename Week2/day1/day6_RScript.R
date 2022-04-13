#####################################
####### Data Management in R ########
#####################################

# Load the datasets package to access the data 
library(datasets)
data(iris)
#lets view the head of the iris dataset
head(iris, n=3)


## Load the iris dataset
library(readr)
iris.imported <- read_csv("iris.csv", col_names = FALSE)


## Cleaning data
iris2<-iris.imported 
#keep original dataset intact, but create new datasets for cleaning
head(iris2, n=3)


############################
## Renaming variables
  
# get the current variables' names
names(iris2)
#Name of variable number 4
names(iris2)[4]
#Rename the variables
names(iris2)[names(iris2) == "X1"] <- "Species"
names(iris2)[names(iris2) == "X2"] <- "Sepal.Length"
names(iris2)[names(iris2) == "X3"] <- "Sepal.Width"
names(iris2)[names(iris2) == "X4"] <- "Petal.Length"
names(iris2)[names(iris2) == "X5"] <- "Petal.Width"
names(iris2)

## Renaming (single) variables 
library(reshape)
iris3<-iris.imported
#Rename the variables
rename(iris3, c(X1 = "Species")) #rename one variable


## Renaming (several) variables
rename(iris3, c(X2= "Sepal.Length", X3= "Sepal.Width", X4= "Petal.Length", X5= "Petal.Width")) #several variables


## Renaming variables
names(iris3)
head(iris3)

## Removing and adding variables
iris4<-iris.imported
names(iris4)
names(iris4) <- NULL
names(iris4)
names(iris4) <- c("Species", "Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")
head(iris4)


###################################
# Deleting columns, rows and data values
## Deleting column(s) by name
 # Method I :
iris2<-iris.imported
names(iris2)
iris2_new = subset(iris2, select = -c(X4,X5))
names(iris2_new)


## Delete column(s) by name
# Method II
iris3<-iris.imported
names(iris3)
iris3_new = iris3[,!(names(iris3) %in% c("X2","X3"))]
iris3_new


## Drop columns by column index numbers
#drop variables in position 2-5
names(iris4)
iris4_new <- iris4[ -c(2:5) ]
names(iris4_new)

## Exercises (drop or keep)
#  1. Use the following sytax to keep the names
#     (a) Keep column by name:  ``iris4_new = iris4[c("X1","X2")]``
#     (b) Keep columns by column index number:  ``iris4_new <- iris4[c(2,4)]``
#  2. Practice on how to Keep or Delete columns with ``dplyr`` package ``library(dplyr)``
#     then use the syntax: ``mydata2 = select(mydata, -1, -3:-4)``
  

## Keep or delete columns with ``dplyr`` package
library(dplyr)
iris5<-iris.imported
# delete first, third and fourth column
iris5.1 = select(iris5, -1, -3:-4)
# delete named columns
iris5.2 = select(iris5, -X1, -X2, -X3)
# or
iris5.3 = select(iris5, -c(X1, X2, X3))
#or
iris5.4 = select(iris5, -X1:-X3)
# keep named columns
iris5.5 = select(iris5, X1, X3:X4)


## Keep / drop columns by ``name pattern``
# Keeping columns whose name starts with "S"
iris4.s = iris4[,grepl("^S",names(iris4))]
names(iris4.s)


# Dropping columns whose name begin with the letter "S"
iris4.s1 = iris4[,!grepl("*S",names(iris4))]
names(iris4.s1)


##############################
# Data structure 

## Structure of the dataset
# Getting to know the stucture of the imported dataset
iris.str<-iris.imported
names(iris.str) <- c("Species", "Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")
str(iris.str)


## Structure of the dataset
iris.str<-iris.imported
# getting the class of the vector
class(iris.str$X1)
iris.str$X1<-as.factor(iris.str$X1)
class(iris.str$X1)
str(iris.str)

# Subsetting (vectors, matrix, lists and dataframes)
## Subsetting
x <- c("a", "b", "c", "c", "d", "a")
x[1];x[2] ;x[1:4]
x[x > "a"]
u <- x > "a"; u; x[u]

## Subsetting a matrix
x <- matrix(1:9, 3, 3) #default, column wise
x[1, 2] # try x[1, 2, drop = FALSE]
x[2, 1]

# Indices can also be missing.
x[1, ] #try x[1, , drop = FALSE]
x[, 2]

## Subsetting cases from a dataframe
iris.str<-iris.imported
names(iris.str) <- c("Species", "Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")
iris.str$Species<-as.factor(iris.str$Species)
summary(iris.str$Species)


## Subsetting cases from a dataframe
names(iris.str) <- c("Species", "Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")
# Get first few rows of each subset
iris.str$Species<-as.factor(iris.str$Species)
subset(iris.str, Species == "Setosa")[1:2,]
subset(iris.str, Species == "Versicolor")[1:2,]
#subset(iris.str, Species == "Virginica")[1:2,]

## Subsetting cases from a dataframe
subset(iris, Species == "setosa")[1:2,]
subset(iris, Species == "versicolor")[1:2,]
subset(iris, Species == "virginica")[1:2,]
# run this then try again: iris <- as_tibble(iris)

##############################
#Variable and value labels
## Variable labels
library(labelled)
var_label(iris.str$Sepal.Length) <- "Length of sepal"
#var_label(iris) <- list(Petal.Length = "Length of petal", Petal.Width = "Width of Petal")
var_label(iris.str) <- list(Petal.Length = "Length of petal", Petal.Width = "Width of Petal")
var_label(iris$Petal.Width)

## Variable labels
var_label(iris.str)


## Variable labels
var_label(iris.str$Sepal.Length) <- NULL
look_for(iris.str)


## Variable labels
look_for(iris.str, "Set")
look_for(iris.str, details = FALSE)


#################################
# Deduplicates
## Find and drop duplicate elements

#Given the following vector:
x <- c(1, 1, 4, 5, 4, 6, 6, 2,3,4)
#To find the position of duplicate elements in x, use this:
duplicated(x)
#Extract duplicate elements:
x[duplicated(x)]
# To remove duplicated elements
x[!duplicated(x)]


## Deduplicates: dataframe
suppressPackageStartupMessages(library(tidyverse))
iris.dup<-iris %>% slice(1:3)
iris.dup = subset(iris.dup, select = -c(Sepal.Length,Sepal.Width) )
iris.dup
iris.dup %>% distinct()


## Duplicates: dataframe (removing duplicates)
suppressPackageStartupMessages(library(tidyverse))
iris.dup<-iris %>% slice(1:3)
iris.dup = subset(iris.dup, select = -c(Sepal.Length,Sepal.Width) )
iris.dup
#with duplicated() function
iris.dup <- iris.dup[!duplicated(iris.dup$Petal.Length), ]
iris.dup
#with distinct() function
iris.dup <- iris.dup %>% distinct(Petal.Length, .keep_all = TRUE)

## Extract unique elements
#Given the following vector:
x <- c(1, 1, 4, 5, 4, 6)
# You can extract unique elements as follow:
unique(x)
# It’s also possible to apply unique() on a data frame, +
#for removing duplicated rows as follow:
suppressPackageStartupMessages(library(tidyverse))
iris.dup<-iris %>% slice(1:3)
iris.dup = subset(iris.dup, select = -c(Sepal.Length,Sepal.Width) )
unique(iris.dup)


###############################
# Recoding
## Recoding a categorical variable to another categorical variable
suppressPackageStartupMessages(library(dplyr))
iris.recod = subset(iris, select = -c(Sepal.Length,Sepal.Width) )
#Getting to know the levels before recoding
levels(iris.str$Species)
iris.recod<-recode(iris.recod$Species, setosa = "set", virginica = "virg", versicolor = "versi")
#levels after recoding
levels(iris.recod)


## Categorize numeric data with ``cut()`` function
library(data.table)
iris.str$iris.group <- cut(iris.str$Petal.Length, breaks = c(1, 4, 6, Inf),
labels = c("small", "medium", "large"), include.lowest=TRUE)


## Categorize numeric data with ``cut()`` function
iris.str$iris.group <- cut(iris.str$Petal.Length, breaks = c(1, 4, 6, Inf),
labels = c("small", "medium", "large"), include.lowest=TRUE)
#Drop few variables to view full list
iris.str= iris.str[,!grepl("*Se",names(iris.str))]
head(iris.str, n=1)

############################
## Sorting data
iris.str[1:5, ] #please note the arguments in the square brackets
sort(iris.str$Petal.Width) 
iris.str[1:5, ] 
sorted.iris.str <- iris.str[order(iris.str$Petal.Width) , ]
sorted.iris.str[1:5, ]

## Sorting data
#sorted.iris.str <- iris.str[order(iris.str$Species,iris.str$Petal.Length), ]
sorted.iris.str <- iris.str[order(iris.str$Species,iris.str$Petal.Length), ]
sorted.iris.str[1:5, ]


## Sorting data: descending
sorted.iris.str <- iris.str[order(iris.str$Species,-(iris.str$Petal.Length)), ]
sorted.iris.str[1:5, ]

## Sorting data: descending
sorted.iris.str <- iris.str[order(iris.str$Petal.Length,-(iris.str$Petal.Width)), ]
sorted.iris.str[5:10, ]


################################
# Missing values
x <- c(1, 2, NA, 10, 3)
is.na(x)
is.nan(x)
x <- c(1, 2, NaN, NA, 4)
is.na(x)
is.nan(x)

## Handling missing data: ``NA``
iris.str$Petal.Width[2:5] <- NA
iris.str[1:5, ]

## Sorting data with missing values
iris.str$Petal.Width[2:5] <- NA
iris.str <- iris.str[order(iris.str$Petal.Width, na.last=FALSE) , ]
head(iris.str)


## Sorting data with missing values: descending
iris.str$Petal.Width[2:5] <- NA
iris.str <- iris.str[order(iris.str$Petal.Width, na.last=TRUE) , ]
tail(iris.str)

## Handling missing values
iris.str$id <- 1:nrow(iris.str)
iris.str$id[2:145] <- NA
iris.str <- iris.str[order(iris.str$id, na.last=NA) , ]
iris.str


#################################
# Dealing with dates in R

## Knowing the current date/time
#lubridate is a package in R meant to deal with dates
suppressPackageStartupMessages(library(lubridate))
Sys.Date() #get current date
today()  #get current date
Sys.time() #get current time
now() #get current time
leap_year(2018) # check whether 2018 is a leap year


## Create and format dates
as.Date("1992-01-11")
as.Date("Jan-11-92", format = "%b-%d-%y")
as.Date("1 January, 1992", format = "%d %B, %Y")


## Dates formats
library(readr)
dates <- read_csv("dates.csv")
dates
#format(dates, format="%B %d %Y")
f_col <- as.Date(dates$mdyy, format="%m/%d/%y")
f_col
typeof(f_col)
as.numeric(f_col) # days since 1970
weekdays(f_col) #inbuilt functions
month(f_col)


## Date arithmetic
course_start    <- as.Date('2017-04-12')
course_end      <- as.Date('2017-04-21')
course_duration <- course_end - course_start
course_duration

# Suppose we adjust the dates
course_start    <- as.Date('2017-04-12')
course_end      <- as.Date('2017-04-21')
course_duration <- (course_end+3) - (course_start-2)
course_duration

## lubtridate package
ymd(20201215)
mdy("4/1/17")

bday <- dmy("14/10/2019")
month(bday)
wday(bday, label = TRUE)
year(bday) <- 2016
wday(bday, label = TRUE)

## Example: Time intervals
arrive <- ymd_hms("2022-06-04 12:00:00", tz = "Pacific/Auckland")
#arrive
leave <- ymd_hms("2022-08-10 14:00:00", tz = "Pacific/Auckland")
#leave

# demonstrate use of lubridate functions
auckland <- interval(arrive, leave)
auckland
auckland <- arrive %--% leave
auckland

ibc <- interval(ymd(20220720, tz = "Pacific/Auckland"), ymd(20220831, tz = "Pacific/Auckland"))
ibc
int_overlaps(ibc, auckland)

## Example: Time intervals
# What part of my visit will he be available?
setdiff(auckland, ibc)


#####################################
# joining(merging, appending)
## Merging dataframes
## Using cbind() to merge two R data frames
head(iris2_new,2)
head(iris3_new,2)



## Using cbind() to merge two R data frames
merged.cbind<-cbind(iris2_new, iris3_new)
head(merged.cbind,2)

## Using rbind() to merge two R data frames
#setosa rows
seto <- iris2_new[iris2_new$X1 == "Setosa",]
#random subsample of non-setosa rows of size n("Setosa") 
nonseto <- iris2_new[sample(which(iris2_new$X1 != "Setosa"), size = length(which(iris2_new$X1 == "Setosa"))),]
merged.rbind <- rbind(seto, nonseto)
head(merged.rbind, 1)
#tail(merged.rbind, 1)


## creating dataframes in R to demonstrate the merge function
set.seed(01)
employee_id <- 1:10
employee_name <- c("Andrew", "Susan", "John", "Joe", "Jack",
                   "Jacob", "Mary", "Kate", "Jacqueline", "Ivy")
employee_salary <- round(rnorm(10, mean = 1500, sd = 200))
employee_age <- round(rnorm(10, mean = 50, sd = 8))
employee_position <- c("CTO", "CFO", "Administrative", rep("Technician", 7))
df_1 <- data.frame(id = employee_id[1:8], name = employee_name[1:8],
                   month_salary = employee_salary[1:8])
df_2 <- data.frame(id = employee_id[-5], name = employee_name[-5],
                   age = employee_age[-5], position = employee_position[-5])
head(df_1,2); head(df_2,2)


## merge dataframes
## merge (inner join)
# merges by the common column names
merge(x = df_1, y = df_2)
merge(x = df_1, y = df_2, by = c("id", "name")) # Equivalent


## merge (full (outer) join)
# merges all the columns of both data sets into one
merge(x = df_1, y = df_2, all = TRUE)
# to create a full outer join of the two data frames 
# in R you have to set the argument all to TRUE


## merge (left (outer) join)
# to create the join, set all.x = TRUE 
merge(x = df_1, y = df_2, all.x = TRUE)
# What would you say about employee of id=5?


## merge (right (outer), cross join and multiple dataframes)
# Right join
head(merge(x = df_1, y = df_2, all.y = TRUE),3)
#cross join
head(Merged <- merge(x = df_1, y = df_2, by = NULL),3)
# merge several dataframes

#merge(x, merge(y, z, all = TRUE), all = TRUE)


##########################################
## Case study: Reshape, join, label, missing values

## Data import and date formating
#importing an excel file 
library(readxl)
reshape_example <- read_excel("reshape_example.xlsx")
typeof(reshape_example$date)
#changing the date format to dd/mm/yyy
reshape_example$date <- format(as.Date(reshape_example$date), "%d-%b-%Y")
head(reshape_example, n=3)
save(reshape_example, file = "reshape_example.RData")


## import the third dataset
#importing an excel file 
library(readxl)
reshape_example3 <- read_excel("reshape_example3.xlsx")
typeof(reshape_example3$date)
reshape_example3$date <- format(as.Date(reshape_example3$date), "%d-%b-%Y")
save(reshape_example3, file = "reshape_example3.RData")


##  Append reshape_example3 to reshape_example1
appended_reshape <- rbind(reshape_example, reshape_example3)
head(appended_reshape)

## recoding character variable to numeric
suppressPackageStartupMessages(library(dplyr))
appended_reshape<- appended_reshape%>% mutate(tested2 = tested)
appended_reshape$tested <- recode(appended_reshape$tested, no = 0, yes = 1)
appended_reshape$tested2 <- recode(appended_reshape$tested2, no = 0, yes = 1)
#table(appended_reshape$tested, appended_reshape$tested2)# tabulate the two variables
#drop the original column
appended_reshape$tested <- NULL
#rename the new variable back to tested
rename(appended_reshape, tested = tested2)

## recoding character variable to numeric
appended_reshape$result <- recode(appended_reshape$result, negative = 0, positive = 1)
#Testing for Missing Values
is.na(appended_reshape$result)
#appended_reshape$tested2 <- NULL
#appended_reshape$result <- NULL


## Reshape the data set from Long to Wide format
suppressPackageStartupMessages(library(reshape2))
data_reshape1 <- reshape(data=appended_reshape,     
                         idvar = "id",
                         v.names = c("date", "result", "tested2"),
                         timevar = "Visit",
                         direction = "wide")

## Reshape the data set from Long to Wide format
suppressPackageStartupMessages(library(dplyr))
#data_wide <- spread(appended_reshape, id, c("Visit", "date", "result", "tested2")

#data_wide <- spread(appended_reshape,  key=Visit, value=date, result)

appended_reshape %>%  pivot_wider(names_from = c(Visit,date,result), values_from =tested2)
#data_wide
reshape_example2 <- read_excel("reshape_example2.xlsx")
#typeof(reshape_example2$id)
merged<-merge(appended_reshape, reshape_example2)
head(merged)


## Reshape the data set from Long to Wide format
reshape_example2 <- read_excel("reshape_example2.xlsx")
typeof(reshape_example2$id)
merged<-merge(appended_reshape, reshape_example2)
head(merged)
#finally sort the data by id then visit
merged[order(merged$id,merged$Visit), ]

