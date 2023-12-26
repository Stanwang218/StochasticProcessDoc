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

# a test for Dobrow 3.5
# we can find the limit distribution for that chain
# the state 3 will never revisit itself

m <- matrix(c(1 / 3, 2 / 3, 0, 1, 0, 0, 1 / 4, 1 / 2, 1 / 4), nrow = 3, byrow = TRUE)

# matrixpower(m, 20000)

#      [,1] [,2] [,3]
# [1,]  0.6  0.4    0
# [2,]  0.6  0.4    0
# [3,]  0.6  0.4    0
# What we can conclude from above is that
# when n goes to infinity, if a j is a transient state
# P^(n)_ij = 0, we will never visit that state again

# For a communication class, all states are recurrent or transient

m <- matrix(c(1 / 3, 2 / 3, 0, 0, 1, 0, 0, 0, 
1 / 4, 1 / 2, 0, 1 / 4, 0, 0, 1, 0), nrow = 4, byrow = TRUE)

print(m)
matrixpower(m, 20000)
# there are two communication classes in total
# (1, 2), (3, 4)
# state 1 and 2 are recurrent, state 3 and 4 are transient 

# Dobrow 3.14
m <- matrix(c(0.77, 0.23, 0.24, 0.76), byrow = TRUE, nrow = 2)
matrixpower(m, 20000)

print((5 / 6) ** 5)