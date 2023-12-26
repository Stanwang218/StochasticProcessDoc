There are not so many codes in this chapter. But in this chapter, it introduces the basic principle of Markov chain.

Some properties in this chapter:
1. Time-homogeneous $P(X_n = j | X_{n-1} = i) = P(X_1 = j | X_0 = i)$
2. stochastic matrix
3. markov property $P(X_n = j | X_1 = s_1 , X_2 = s_2 , ... , X_{n-1} = s_{n-1}) = P(X_n = j | X_{n-1} = s_{n-1})$
4. n-step transition matrix
5. Chapman–Kolmogorov Relationship
6. Distribution of $X_n$
7. Joint Distribution of $X_n$
8. Long term behavior

In chapter 3, it basically introduces definitions and properties.

1. Limiting distribution(limiting matrix) and stationary distribution. Limiting distribution is stationary distribution.
2. Regular transition matrix (all entries of $P^n$ for some n are positive)
3. Limit theorems for regular markov chain : if P is regular, MC has a limiting distribution(Unique and positive)
4. some definitions: accessible, communicate, reflexive, symmetric, transitive, communication class, irreducibility
5. Recurrent and transient state
6. States in a communication class are all transient or all recurrent
7. Closed communication class
8. Irreducible markov chain and <em style="color:red">Limit Theorem for irreducible markov chain</em>, $\mu_j$ is the expected return time for state j, and there exists a unique and positive stationary distribution for this markov chain, where $\pi_j = \frac{1}{\mu_j}$
9. There is a method called first-step analysis to compute the expected return time: condition on the first step of the markov chain and use the law of total expectation.
10. Periodicity, $d(i)$ is the greatest common divisor of the possible return times. If $d(i) = 1$, the state is aperiodic. State in the same communication class has the same period. 
11. A markov chain is aperiodic it is irreducible and if all the states have period 1. A markov chain is periodic if it is irreducible the period for each state is greater than 1.
12. Ergodic markov chain: it is irreducible and aperiodic.
13. Limit Theorem for Ergodic markov chain: if a chain is Ergodic, there exists a unique stationary distribution, which is the limiting distribution i.e. $\pi_i = lim_{n->\infty}P^{n}_{ij}$
14. Time Reversibility: $\pi_{i}P_{ij} = \pi_jP_{ji} , \forall i, j$
15. Absorbing chain and absorbing state, fundamental matrix, expected time to absorption. 