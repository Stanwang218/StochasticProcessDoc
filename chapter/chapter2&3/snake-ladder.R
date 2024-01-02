# 1. expected length of the game
data <- read.csv("./r/assignment1/data.csv", header = FALSE, sep = " ",
                 colClasses = c("numeric", "numeric"))

data <- matrix(unlist(data), nrow = 9, byrow = FALSE)
colnames(data) <- c("1", "2", "3", "4", "5", "6", "7", "8", "9")
rownames(data) <- c("1", "2", "3", "4", "5", "6", "7", "8", "9")

q <- data[1:8, 1:8]
f <- solve(diag(8) - q, diag(8))
rowSums(f)
# 6.53

# 2. land on square 6 before the end of the game
dataCopy <- data
dataCopy[8, ] <- data[6, ]
dataCopy[6, ] <- data[8, ]
colnames(dataCopy) <- c("1", "2", "3", "4", "5", "8", "7", "6", "9")
rownames(dataCopy) <- c("1", "2", "3", "4", "5", "8", "7", "6", "9")
q <- dataCopy[1:7, 1:7]
r <- dataCopy[1:7, 8:9]
f <- solve(diag(7) - q)
# the prob from transient to absorbing state

print(f %*% r)
# answer: 0.437