### Continuous Time Markov Chain


#### Introduction

There is a duration time for each state. When a state is visited, the chain stays at the state for a while and then move to next. 

$$P(X_{t+s} = j | X_s = i, X_u = x_u, u < s>) = P(X_{t+s} = j | X_s = i) = P(X_t = j | X_0 = i)$$

Hence we can arrange this term into a matrix $P(t), P_{ij}(t) = P(X_t = j|X_0 = i)$

An important property: $P(s+t) = P(s)P(t)$

Proof is easy, condtion on the intermediate state:

$P_{ij}(s+t) = \sum_{k}P(X_s = k | X_0 = i)P(X_{s+t} = j | X_s = k) = \sum_k P_{ik}(s)P_{kj}(t) = P(s)P(t)$

#### Holding time distribution
Let $T_i$ denote the holding time in state $i$, $T_i$ has an exponential distribution.

$
\begin{aligned}
 P(T_i > s+t | X_0 = i) &= P(T_i > s+t,  T_i > s ｜ X_0 = i) \\ 
 &= P(T_i > s+t ｜ T_i >s , X_0 = i) P(T_i > s | X_0 = i)\\ 
 &= P(T_i > s+t |  X_s = i)P(T_i>s|X_0=i)\\
 &= P(T_i > t | X_0 = i)P(T_i > s| X_0 = i)
\end{aligned}
$

We can find that if we have stayed for s time in state i, then it is independent that we stay for another t time in state i. 

Hence, if we stay in a state for an average $\frac{1}{q}$ time, the holding time is exponential distribution with parameter $q$. 

#### Transition rates
For state $i$, for the following state is decided by the first alarming ring. For each alarm ring, the transition rate is $q_{ik}$, so the holding time is $min(T_1, T_2, ... T_k) \sim EXP(\sum_kq_{ik})$. We denote this sum as $q_i$. 

Then, if we ignore the time and only care about transitions from state to state, we can get embedded chain $\widetilde{P}$. 

Hence, the transition probability in the embedded chain is $P_{ij} = \frac{q_{ij}}{q_i}$. The proof will be shown later. 

#### Infinitesimal Generator
Next, we want to find the derivative of $P(t)$. Suppose an interval $[t, t+h]$,

$
\begin{aligned}
 lim_{h \rightarrow 0}\frac{P(X_{t+h} = j | X_t = i)}{h} & = lim_{h \rightarrow 0}\frac{P(X_{h} = j | X_0 = i)}{h}  \\ 
 &= lim_{h \rightarrow 0}\frac{P_{ij}(h)}{h} \\
  &= lim_{h \rightarrow 0}\frac{P_{ij}(h) - P_{ij}(0)}{h} \\
  & = P^{'}_{ij}(0) = q_{ij} \\ 
\end{aligned}
$

We set $Q = P^{'}(0)$ and let $Q_{ij} = P^{'}_{ij}(0), i \neq j$. For $i = j, Q_{ii} = q_i$.

Then, we can prove the probability of embedded chain:
$
\begin{aligned}
 lim_{h \rightarrow 0}P(X_{t+h} = j | X_t = i, X_{t+h} \neq i) & = lim_{h \rightarrow 0}P(X_{h} = j | X_0 = i, X_{h} \neq j)  \\ 
 & = lim_{h \rightarrow 0}\frac{P(X_{h} = j, X_0 = i)}{P(X_{h} \neq j,X_0 = i)}  \\ 
  & = \frac{q_{ij}}{q_i}\\ 
\end{aligned}
$

Then we introduce forward and backward equation to compute the derivative. 

Forward equation : $P^{'}(t) = P(t)Q$

Backward equation : $P^{'}(t) = QP(t)$

This a differential equation and the solution to it is $P(t) = e^{tQ}$, where $e^{tQ}$ is the matrix exponential. 

Then, if $Q$ is diagonalizable, $Q = S^{-1}DS$, where $s$ is a matrix with columns vectors being eigenvectors. Then, $e^{tQ} = Se^{tD}S^{-1}$, where $e^{tD}$ is $diag(e^{t\lambda_1}, e^{t\lambda_2}, ....., e^{t\lambda_n})$.

#### Long-term Behavior

A probability distribution $\pi$ is a stationary distribution if $\pi = \pi P(t)$.

<em>Fundamental Limit Theorem</em>: for a continuous markov chain, if it is finite and irreducible, there exists a unique stationary distribution $\pi$, which is also the limiting distribution. 

Then we have $$\pi Q = 0$$

#### Absorbing states

$$
\begin{aligned}
 p & = \hbar k \\ 
 E & = \hbar \omega \\ 
\end{aligned}
$$