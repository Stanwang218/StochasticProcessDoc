# lambda: 10, t: 10

setwd("/Users/code/r/StochasticProcess/chapter/chapter6")

lambda <- 10
t <- 10

png("./pic/def2.png")
hist(rpois(1000, lambda * t))

png("./pic/def2_.png")
mat <- numeric(1000)
for(i in 1:1000){
    simPoint <- rexp(10000, lambda)
    cumSum <- cumsum(simPoint)
    mat[i] <- length(cumSum[cumSum <= t])
}
hist(mat)