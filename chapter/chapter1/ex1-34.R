# dexp: desity function(pdf)
# pexp: cdf
# qexp: quantile
# rexp: generator

setwd("/Users/code/r/StochasticProcess/chapter/chapter1")
trial <- 10000
simlist <- rexp(trial, rate = 1 / 30)
png("./pic/exp.png")
hist(simlist)
sum(simlist <= 20) / trial

pexp(20, 1 / 30)