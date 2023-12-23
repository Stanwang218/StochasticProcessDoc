setwd("/Users/code/r/StochasticProcess/chapter/chapter1")
RandomWalk <- function(p, n_step){
    Sn <- numeric(n_step + 1)
    for(i in 1:n_step){
        if(Sn[i] == 0){
            Sn[i+1] <- 1
        }
        else {
            Sn[i+1] <- Sn[i] + sample(c(-1, 1), 1, prob = c(p, 1 - p))
        }
    }
    png(file = "./pic/RandomWalk.png")
    plot(Sn, type = "o")
    return(Sn)
}

# RandomWalk(0.5, 100)

GamblerRuiner <- function(p, start, k, simulateOnce = TRUE){
    Sn <- c(start)
    while(Sn[length(Sn)] != 0 && Sn[length(Sn)] != k){
        nextround <-Sn[length(Sn)] + sample(c(-1, 1), 1, prob = c(p, 1 - p))
        Sn <- c(Sn, nextround)
    }
    if(simulateOnce){
    png(file = "./pic/GamblerRuiner.png")
    plot(Sn, type = "o")
    return(Sn)
    }
    else {
       if(Sn[length(Sn)] == k){
        return(1)
       }
       else {
          return(0)
       }
    }
}

mean(replicate(1000, GamblerRuiner(0.49, 60, 100, FALSE))) 
# obtain the probability to reach n

# GamblerRuiner(0.5, 20, 60)

# what is the probability of eventual ruiner ?

# Consider P_k is the prob to reach n when having fortune k
# P_k = 1/2 * P_(k+1) + 1/2 * P_(k-1) => P_k - P_(k-1) = P_(k+1) - P_k
# P_n = 1, P_0 = 0
# P_1 - P_0 = P_1
# P_2 - P_1 = P_1 - P_0 => P_2 = 2 * P_1
# P_k = k * p_1
# Sum from k = 1 to k = n-1: P_k - P_(k-1) = P_(k+1) - P_k
# P_n - P_1 = P_(n-1) - P_0 => 1 = n * P_1 => P_1 = 1 / n
# So, P_k = k / n (reach n if you have k)
