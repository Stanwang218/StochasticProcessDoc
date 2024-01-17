# install.packages("MASS", repos = "http://cran.us.r-project.org")

library(MASS)
setwd("/Users/code/r/StochasticProcess/chapter/chapter5")

simNum <- 3000
rho <- 0.6

mean_vector <- c(0, 0)
cov_matrix <- matrix(c(1, rho, rho, 1), nrow = 2)

samples <- mvrnorm(n = simNum, mu = mean_vector, Sigma = cov_matrix)

png("./pic/gibbs-lib.png")

plot(samples)

simlist <- matrix(rep(0, 2 * simNum), ncol = 2)
dev_std <- sqrt(1 - rho^2)
for(i in 2:simNum){
    simlist[i, 1] <- rnorm(1, simlist[i - 1, 2] * rho, dev_std)
    simlist[i, 2] <- rnorm(1, simlist[i, 1] * rho, dev_std)
}

png("./pic/gibbs.png")

plot(simlist)
