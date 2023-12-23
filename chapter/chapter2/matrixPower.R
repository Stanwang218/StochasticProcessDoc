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

m <- matrix(1:9, nrow = 3)
matrixpower(m, 0)