total <- choose(100, 3)
m <- rep(0, 4)
value <- c(0, 3, 15, 1000)
ex <- 0
for(i in 1:4){
    m[i] <- choose(3, i - 1) * choose(97, 4 - i) / total
    ex <- ex + m[i] * value[i]
}
print(round(ex, 3))

branchProb <- c(m[1] + m[4], m[2], m[3])
branchDist <- c(0, 3, 15)
mu <- sum(branchProb * branchDist)

print(branchProb)

pgf <- function(s, p, dist){
    res <- 0
    for(i in 1:length(p)){
        res <- res + p[i] * s^dist[i]
    }
    return(res)
}

n_gf <- function(n = 1, p = branchProb, d = branchDist){
    res <- 0 
    for(i in 1:n){
        res <- pgf(res, p, d)
    }
    return(res)
}

print(n_gf(1))
print(n_gf(2) - n_gf(1))
