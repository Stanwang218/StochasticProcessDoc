setwd("/Users/code/r/StochasticProcess/chapter/chapter8")

SimulateBrownian <- function(n, t){
    # simulate from [0, t]
    simList <- cumsum(rnorm(n, 0, sqrt(t / n)))
    png("./pic/sim.png")
    plot(1:n, simList, type = "l")
}

SimulateBrownianBridge <- function(n, t){
    # simulate from [0, t]
    t <- seq(0,t,length=n)
    simList <- c(0, cumsum(rnorm(n - 1, 0, sqrt(1)) / sqrt(n)))
    bridge <- simList - t * simList[n]
    png("./pic/simBridge.png")
    plot(1:n, bridge, type = "l")
}

SimulateBrownianBridge(1000, 1) 