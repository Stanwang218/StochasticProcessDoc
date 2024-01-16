setwd("/Users/code/r/StochasticProcess/chapter/chapter2&3")

mat <- read.table("./matrix.txt")

mat <- matrix(unlist(mat), nrow = 7, ncol = 7)

matrixpower <- function(m, n){
    if(n == 1){
        return(m)
    }
    if(n == 0){
        return(diag(nrow(m)))
    }
    factor <- m
    for(i in 2:n){
        m <- m %*% factor
    }
    return(m)
}

matrixpower(mat, 5)[4, 6] * matrixpower(mat, 9)[1,4]

newMat <- mat[1:6, 1:6]
matrixpower(newMat, 5)[4, 6] * matrixpower(newMat, 9)[1,4]