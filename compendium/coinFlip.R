setwd("/Users/code/r/StochasticProcess/compendium")

prior <- function(num_H, n){
    return(0.5 * (0.3 ** num_H  *  0.7 ** (n - num_H)) + 0.5 * (0.7 ** num_H  * 0.3 ** (n - num_H)))
}

posterior <- function(num_H, n){
    return(prior(num_H + 1, n + 1) / prior(num_H, n))
}

flipCoin <- function(n = 10){
    simlist <- sample(c(0, 1), n, replace=TRUE, prob = c(0.3, 0.7))
    num_H <- sum(simlist)
    # print(simlist)
    return(posterior(num_H , n))
}

n <- 100

png("./pic/bayesianInference.png")

theta <- numeric(n)
for(i in 1:n){
    theta[i] <- flipCoin(i)
}

plot(1:n, theta, type="l")