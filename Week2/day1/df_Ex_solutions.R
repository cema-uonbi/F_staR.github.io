###############################################
#######Solutions for dataframes exercises######
###############################################

# Exercise 1 
Name <- c("Alex", "Lilly", "Mark", "Oliver", "Martha", "Lucas", "Caroline")
Age <- c(25, 31, 23, 52, 76, 49, 26)
Height <- c(177, 163, 190, 179, 163, 183, 164)
Weight <- c(57, 69, 83, 75, 70, 83, 53)
Sex <- as.factor(c("F", "F", "M", "M", "F", "M", "F"))
df <- data.frame (row.names = Name, Age, Height, Weight, Sex)
levels(df$Sex) <- c("M", "F")
df


# Exercise 2 

Name <- c("Alex", "Lilly", "Mark", "Oliver", "Martha", "Lucas", "Caroline")
Working <- c("Yes", "No", "No", "Yes", "Yes", "No", "Yes")
dfa <- data.frame(row.names = Name, Working)

# a)
dfa <- cbind (df,dfa)
dim(dfa)

# or:
nrow(dfa)
ncol(dfa)

# b)
sapply(dfa, class)

str(dfa)
# alternative solution



# Exercise 3 
class (state.center)

df3 <- as.data.frame(state.center)
str(df3)
dim(df3)


# Exercise 4 

# Example vectors
v <- c(45:41, 30:33)
b <- LETTERS[rep(1:3, 3)]
n <- round(rnorm(9, 65, 5))
df <- data.frame(Age = v, Class = b, Grade = n)
df[with (df, order(Age)),]

# alternative solution
df[order(df$Age), ] 


# Exercise 5 
matr <- matrix(1:20, ncol = 5) # Example matrix
df <- as.data.frame(matr)
colnames(df) <- paste("variable_", 1:ncol(df))
rownames(df) <- paste("id_", 1:nrow(df))
df



