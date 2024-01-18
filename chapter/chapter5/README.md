This chapter mainly talks about Monto Carlo Markov Chain(MCMC).

When the distribution $\pi$ is intractable, we can construct an ergodic markov chain whose limiting distribution is $\pi$. 

decode.R is a simple application to decode a message

#### MH algorithm

We need a proposal matrix $T$ and a distibution $\pi$. We want to construct a markov chain whose limiting distribution is $\pi$. 

Acceptance rate: $\alpha_{ij} = \frac{\pi_j T_{ji}}{\pi_i T_{ij}}$

Procedure:

1. Suppose the initial state $X_0 = i$
2. We generate a new state $j$ according to $T_{ij}$
3. We accept $j$ with probability $min(\alpha_{ij}, 1)$
4. Go back to step 2

Hence, $P_{ij} = T_{ij}min(1, \alpha_{ij})$ for the constructed markov chain. 

It is easy to prove that the markov chain is reversible. 

If $\pi_{j}T_{ji} > \pi_{i}T_{ij}$:

$\pi_iP_{ij} = \pi_i T_{ij} = \pi_j T_{ji} \frac{\pi_i T_{ij}}{\pi_j T_{ji}} = \pi_j T_{ji} \alpha_{ji} = \pi_j P_{ji}$

else:

$\pi_iP_{ij} = \pi_i T_{ij} \alpha_{ij} = \pi_i T_{ij} \frac{\pi_j T_{ji}}{\pi_i T_{ij}} = \pi_j T_{ji}  = \pi_j P_{ji}$

decode.R is an application to decode a message using MH algorithm

####  Gibbs sampling
Gibbs sampling is a special case of Metropolis Hastings algorithm. In Gibbs sampling, the distribution is an m-dimensional joint density $\pi(x) = \pi(x_1, x_2, ...., x_m)$. Hence, the data form a vector $X_1 = (x_1^1, x_1^2, ..., x_1^m), X_2 = (x_2^1, x_2^2, ..., x_2^m)...$

The algorithm generate each component by conditioning on the rest of $m-1$ components iteratively. 

The acceptance ratio is always 1.

Prove:

Suppose $i = (x_1, x_2, ..., x_m), j = (x_1^{'}, x_2, ..., x_m)$

$$
\begin{aligned}
\pi_j T_{ji} &= \pi(x_1^{'}, x_2, ..., x_m) \frac{\pi(x_1, x_2, ..., x_m)}{\int_x \pi(x, x_2, ..., x_m)dx} \\
&= \pi(x_1, x_2, ..., x_m) \frac{\pi(x_1^{'}, x_2, ..., x_m)}{\int_x \pi(x, x_2, ..., x_m)dx} \\
&= \pi_i T_{ij} \\
\end{aligned}
$$

gibbs.R shows an easy example about bivariate standard  normal distribution. The covariance of $x, y$ is $\rho$. We use gibbs sampling to get a series of data and use the library MASS to directly sample from the bivariate distribution. The results are the same. 

pdf: 
$$f(x, y) = \frac{1}{2\pi \sqrt{1- \rho^2}}exp(-\frac{x^2 - 2xy\rho + y^2}{2(1-\rho^2)})$$
$$f(x) = \frac{1}{\sqrt{2\pi}}exp(-\frac{x^2}{2})$$
$$f(y) = \frac{1}{\sqrt{2\pi}}exp(-\frac{y^2}{2})$$
$$f_{X|Y}(x) = \frac{1}{\sqrt{2\pi (1 - \rho^2)}}exp(-\frac{(x - \rho y)^2}{2(1 - \rho^2)}) \sim Normal(\rho y, 1-\rho^2)$$
$$f_{Y|X}(y) = \frac{1}{\sqrt{2\pi (1 - \rho^2)}}exp(-\frac{(y - \rho x)^2}{2(1 - \rho^2)}) \sim Normal(\rho x, 1-\rho^2)$$



#### Perfect Sampling(Coupling from the past)
Motivation: If a chain is in stationary, then the distribution of current state is independent of its intial state. So we want to guarantee the chain $X_0$ is in stationary. 

A function called update function is proposed:

Probability distribution: $p = \{p_1, p_2, ..., p_n\}$

state: $S = \{s_1, s_2, ...., s_n\}$

$U \sim Uniform(0, 1)$

If $U = u$,  $j$ is the smallest value of index, which satisfies $p_1 + p_2 + .... + p_j < u$

Hence, $P(X = s_j) = P(p_1 + p_2 + ... + p_{j - 1}< U < p_1 + p_2 + ... p_j) = p_j$

Then the update function for a markov chain $X_1, X_2, .... $ is $g(x, u)$, which is obtained from a conditional distribution given $X_0 = x$. 

Procedure:
1. Sample $U$ from uniform distribution
2. Run the chain from time t starting at every state 
3. Whether all the states coalesced 
4. if not, go to step 1

perfectSampling.R is an easy implementation of perfect sampling on a transition matrix. 
