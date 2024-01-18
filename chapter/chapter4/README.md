#### extinctionProb.R : 
To validate the probability of extinction - Find the extinction probability for a branching process with offspring distribution a = (1∕6, 1∕2, 1∕3).

#### 4-26.R
In a lottery game,three winning numbers are chosen uniformly at randomfrom {1, ... , 100}, sampling without replacement. Lottery tickets cost $1 and allow a player to pick three numbers. If a player matches the three winning numbers they win the jackpot prize of $1,000. For matching exactly two numbers, they win $15. For matching exactly one number they win $3.

#### Branching.R : simulate branching process

Branching process

1. all nonzero states are transients
2. subcritical, critical, supercritical
3. mean of generation size
4. variance of generation size
5. Generator function(four properties in total, the sum of random variable )
6. Generator function of branching process
6. probability of extinction


#### Extinction is forever and extinction probability

Suppose $E$ is the event of extinction,$P(E) = e$. $E_1, E_2, ...., E_n$ is the event of extinction by generation $1, 2, ...., n$, with correponding probability $e_1, e_2, ..., e_n$.

We can find that if $E_1$ happens, $E_2$ certainly happens. So, we can conclude that $E_1 \subseteq E_2 .... \subseteq E_n$ and $E = \bigcup_{i=1}^{N}E_i$, when $n\rightarrow \infty$, $E = E_n$, thus $e = e_n$.

Generator function: $G_X(s) = E(s^X) = \sum_{k}P(X=k)s^k$

Why generator function is related with extinction probability?

We denote that $G_n(s) = G_{Z_n}(s) = E(s^{Z_n})$, $X_i$ is $i^{th}$ offspring in $Z$. 

Consider $Z_n, Z_{n-1}$, 

$E(S^{Z_n}|Z_{n-1} = k-1) = E(S^{\sum_{i}^{k-1}X_i}) = \prod_{i}^{k-1}E(s^{X_i}) = E(s^{X_i})^{k-1} = G(s)^{k-1}$.

Thus, $E(S^{Z_n}|Z_{n-1}) = G(s)^{Z_{n-1}},E(S^{z_n}) = E(E(s^{z_n}|Z_{n-1})) = E(G(s)^{Z_{n-1}})$.

Because, $E(s^{Z_{n-1}}) = G_{n-1}(s)$, thus $E(G(s)^{Z_{n-1}}) = G_{n-1}(G(s))$. 

Then, we want to know $P(E_n) = \sum_{k}P(E_n|X = k)P(X = k) = \sum_{k}e^{k}_{n-1}P(X = k) = E(e_{n-1}^{X}) = G_{X}(e_{n-1})$, when $n$ goes to infinity, $P(E) = e = G_{X}(e)=G(e)$

Then, we need to introduce some properties of generator function. 

$G(s) = E(s^X) = \sum_{X = k}s^kP(X = k)$

$G^{'}(s) = E(Xs^{x-1})$

1. $G(0) = P(X = 0), G(1) = 1, G_{n}(0) = P(Z_n = 0)$
2. $G^{'}(1) = \mu$, where $\mu$ is the expectation of $X$
3. $G^{'}(x) > 0$, generator function is an increasing function, $G^{''}(x) > 0$, generator function is a convex function. 
4. $G_0(s) = s$, because $P(Z_0 = 1)$
5. $G_1(s) = G_0(G(s)) = G(s)$
6. $G_n(s) = G_{n-1}(G(s)) = G_{n-2}(G(G(s)))=G(...G(G(s))...) = G(G_{n-1}(s))$

Suppose $x$ is the positive solution of $s = G(s), x > 0$

$e_1 = P(X_1 = 0) = G_1(0) = G(0) \leq G(x) = x$

$e_2 = P(X_2 = 0) = G_2(0) = G(G_{1}(0)) = G(P(Z_{1} = 0)) = G(e_{1}) \leq G(x) = x$

By induction, 

$e_n = P(X_n = 0) = G_n(0) = G(G_{n-1}(0)) = G(P(Z_{n-1} = 0)) = G(e_{n-1}) \leq G(x) = x$

When $n \rightarrow \infty, e \leq x$, which means that $e$ need to be less than or equal to every solution of $x = e(x)$. What we prove is that $e$ is the solution of $s = G(s)$, that is $e$ is the smallest root of $e = G(e)$. 

Then, we need to find there exists such a solution. 

We construct a function $F(s) = G(s) - s$. $F^{'}(s) = G^{'}(s) - 1$, which is an increasing function. When $s \in [0, 1]$, $F^{'}(s) \leq F^{'}(1) = \mu - 1$.

When $\mu \leq 1, F^{'}(s) \leq 0$, which means $F(s)$ is a decreasing function. Therefore, $F(s) \geq F(1) = 0, G(s) \geq s$ and $s = 1$ is the only intersection. 

When $\mu > 1, F^{'}(1) = \mu - 1 > 0$, which means that when $s = 1, F$ is increasing. Thus, there exists a point $t \in (0, 1), F(t) < 0$. Hence, there exists a point $e$ such that $F(e) = 0\text{ i.e. }e = G(e)$, because $F(0) > 0$.
