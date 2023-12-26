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

# There is another way to calculate this event
# Use absorbing state
# Initially, if we want to get HH
# we frist are at null
# null : 1/2 -> H, 1/2 -> null
# H: 1/2 -> HH, 1/2 -> null
# HH: 1 -> HH
# HH is the absorbing state

m <- matrix(c(1/2, 1/2, 0, 1/2, 0, 1/2, 0, 0, 1), byrow=TRUE, nrow = 3)
Q <- m[1:2, 1:2]
rownames(m) <- c("NULL", "H", "HH")
colnames(m) <- c("NULL", "H", "HH")
print(m)
f <- solve(diag(2) - Q, diag(2))
rowSums(f)[1]