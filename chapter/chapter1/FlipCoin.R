# Dobrow 1.21
# Flip a fair coin and what is the expectation of getting 2 heads in a row
# ans = 6 
# using conditional expectation
# HT, T, HH, divided the event into three different sample spaces)

flipCoin <- function(){
    simList <- c()
    flag1 <- FALSE
    while(TRUE){
        cur <- sample(c(0, 1), 1, prob = c(0.5, 0.5))
        simList <- c(simList, cur)
        if(cur == 0){
            flag1 <- FALSE
        }
        else {
           if(flag1){
            return(length(simList))
           }
           else {
              flag1 <- TRUE
           }
        }
    }
}

mean(replicate(1000, flipCoin()))