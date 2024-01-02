# This is to validate the probability of extinction
# Dobrow Example 4.7

branchingProb <- c(1/6, 1/2 ,1/3)
branchingNum <- c(0, 1, 2)

branchingSim <- function(l = 10){
    z <- c(1, rep(l - 1))
    for(i in 2:l){
        offspring <- sample(branchingNum, z[i-1], replace = TRUE ,prob = branchingProb)
        z[i] <- sum(offspring)
        # cat(z[i-1], offspring, "\n")
    }
    # print(z)
    # print(z[l])
    if(z[l] == 0){
        return(0)
    }
    else {
       return(1)
    }
}


# p = 0.5024
mean(replicate(5000, branchingSim(50)))
