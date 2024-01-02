# there are three types of branching
# subcritical, critical, supercritical
# we simulate according to poisson distribution
# with mu 0.75, 1, 1.5
setwd("/Users/code/r/StochasticProcess/chapter/chapter4")


z0 <- 1
mu1 <- 0.75
mu2 <- 1
mu3 <- 1.5

simulateBranching <- function(mu, n = 10){
    z <- c(1, rep(n))
    for(i in 2:n){
        z[i] <- sum(rpois(z[i-1], mu))
    }
    return(z)
}

drawFigure <- function(n = 10, l = 10){
    png("./pic/branching.png")
    # hist(rpois(1000, 10))
    plot(replicate(n, mean(simulateBranching(mu3, l))), type = "l", col = "blue", ylab="mean offspring")
    lines(replicate(n, mean(simulateBranching(mu2, l))), type = "l", col = "green")
    lines(replicate(n, mean(simulateBranching(mu1, l))), type = "l", col = "red")
    legend("topright", legend = c("supercritical", "critical", "subcritical"), col = c("blue", "green", "red"), lty = 1, lwd = c(0.5, 1, 0.5))

}

drawFigure(100, 10)