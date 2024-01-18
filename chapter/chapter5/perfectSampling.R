r <- 4 # row of matrix

P <- matrix(c(1/4,1/4,1/4,1/4,1/3,1/3,1/3,0,0,1/3,1/3,1/3,0,1,0,0),nrow=r,byrow=T)
# stationary distribution (2/11, 9/22, 3/11, 3/22)

Q <- matrix(rep(0, r * r), nrow = r)
for(i in 1 : r) Q[i, ] <- cumsum(P[i, ])

# return the next state
update_function <- function(state, u) which(u < Q[state, ])[1] # first index

markov_simulation <- function(t, u){
    # t: the time of the chain
    # u: the results from uniform distribution
    out <- rep(0, r)
    for(i in 1:r){
        cur_state <- update_function(i, u[1])
        # print(cur_state)
            for(j in 2:t) cur_state <- update_function(cur_state, u[j])
        out[i] <- cur_state
    }
    return(out)
}



trials <- 3000
simlist <- numeric(trials)

for(i in 1:trials){
    out <- numeric(r)
    t <- 1 # time
    u <- runif(1) # generate from uniform distribution
    while(TRUE){
        t <- t * 2
        u <- c(runif(t / 2), u)
        # cat(t, length(u), "\n")
        out <- markov_simulation(t, u)
        # print(unique(out))
        if(length(unique(out)) == 1) break()
    }
    simlist[i] <- out[1]
}

table(simlist)/length(simlist)