setwd("/Users/code/r/StochasticProcess/chapter/chapter5")

mat <- read.table('./AustenCount.txt', header = FALSE,  sep = '	')

# transform value into log value
log_mat <- log(mat + 1)

message <- "coincidences in general are great stumbling blocks in the way of that class of thinkers who have been educated to know nothing of the theory of probabilities that theory to which the most glorious objects of human research are indebted for the most glorious of illustrations edgar allen poe the murders in the rue morgue morpheus this is your last chance after this there is no turning back you take the blue pill the story ends you wake up in your bed and believe whatever you want to believe you take the red pill you stay in wonderland and i show you how deep the rabbit hole goes"

charToIndex <- function(chr){
    # hex -> integer
    int <- strtoi(charToRaw(chr), 16L)
    # index the char
    if(int == 32){
        index <- 27
    }
    else {
        index <- int - 96
    }
    return(index)
}

decrypt_func <- function(messg, func){
    # func is a permutation of 1:26
    out <- messg
    for(i in 1:nchar(messg)){
        curr_chr <- substr(messg, i, i)
        index <- charToIndex(curr_chr)
        if(index < 27){
            substr(out, i, i) <- rawToChar(as.raw(func[index] + 96))
        }
    }
    return(out)
}

score <- function(code, func){
    p <- 0
    for(i in 1:(nchar(code) - 1)){
        j <- substr(code, i, i)
        k <- substr(code, i + 1, i + 1)
        p <- p + log_mat[charToIndex(j), charToIndex(k)]
    }
    return(p)
}

messcode <- decrypt_func(message, sample(1:26))
curr_func <- 1:27

map <- new.env(hash=T, parent=emptyenv()) # create a hashtable to record visited function

old_score <- score(messcode)

# print(old_score)

map[[paste(curr_func, collapse = '')]] <- old_score

for(itr in 1: 50000){
    swaps <- sample(1:26, 2)
    old_func <- curr_func
    curr_func[swaps[1]] <- old_func[swaps[2]]
    curr_func[swaps[2]] <- old_func[swaps[1]]
    key <- paste(curr_func, collapse = '')
    if(exists(key, map)){
        new_score <- map[[key]]
    }
    else {
        temp_code <- decrypt_func(messcode, curr_func)
        new_score <- score(temp_code)
        map[[key]] <- new_score
    }
    if(runif(1) > exp(new_score - old_score)){
        # not accept
        curr_func <- old_func
    }
    else {
        old_score <- new_score
    }
    if(itr %% 500 == 0){
        print(c(itr, decrypt_func(messcode, curr_func)))
    }
}

# nchar("abc def")