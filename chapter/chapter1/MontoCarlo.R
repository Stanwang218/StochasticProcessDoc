setwd("/Users/code/r/StochasticProcess/chapter/chapter1")

# the proportion of event A happens in n events is the prob(A)
Monto_Carlo <- function(p = 1 / 3, n = 10000){
    simulation_sum <- 0
    a <- c()
    for(i in 1:n){
        simulation_sum <- simulation_sum + sample(c(0, 1), 1, prob = c(1 - p, p))
        a <- c(a, simulation_sum / i)
    }
    png("./pic/monto-carlo.png")
    plot(a, type = 'o', ylim = c(0,0.5))
    
}

Monto_Carlo(n = 1000)