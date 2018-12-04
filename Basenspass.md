### Basic probabilities

$p(X(t) = Z | X(0) = Z) = p_{Z,Z} = \frac14 +\frac34 e^{-\frac43 \lambda}$ for $Z \in \{A,C,G,T\}=:L$.

$p(X(t) = \bar{Z} | X(0) = Z) = p_{\bar{Z},Z} = \frac14 -\frac14 e^{-\frac43 \lambda}$.

Notation: $s_0\rightarrow_\lambda s_1$ means $s_0$ mutates into $s_1$ after unit time with mutation rate $\lambda$. 

Let now $s_0,s_1,s_2 \in L^n$, where $s_0\rightarrow_\lambda s_1$ for one instance and $s_0\rightarrow_\lambda s_2$ for another. Then the probability of $|s_1-s_2|=k$ is

$p(||s_1-s_2||=k | s_1,s_2 \in L^n,r)=Bin(n,k) r^k (1-r)^{n-k}$  with $r$ being the probability of letters matching. This is given by the probability of a letter staying the same in both cases plus both mutating to the same other letter.

$r= p_{Z,Z}^2+3p_{\bar{Z},Z}^2$.

Probability of matching base $s_0$ at k positions:

$p(||s_0-s_1||=k | s_0,s_1 \in L^n,q)=Bin(n,k) q^k (1-q)^{n-k}$ with $q=p_{Z,Z}$.

Then (by Mathematica) $p(||s_1-s_2||=k | s_1,s_2 \in L^n,r) = p(||s_0-s_2||=k | s_0,s_1 \in L^n,2q)$.

I.e. the probability that two sequences that originate from the same base have $k$ matches after time $t$ is the same as the probability of one sequence having $k$ matches with the base sequence after twice the time.

### Counting

With $s\in L^n$, how many sequences $s'\in L^n$ exist such that $||s-s'|| = k$.

$n_{s,k} = 3^k Bin(n,k)$.

Then the probability of $s$ mutating into *any* $s'$ where $||s-s'||$ is equal to the number of these possibilities times the probability: 

$p(s \rightarrow S_{s,k}) = |S_{s,k}| \cdot  p_{\bar{Z},Z}^k  \cdot  p_{Z,Z}^{n-k}​$  where $S_{s,k} = \{s' \in L^n | ||s'-s|| = k \}​$ and $|S_{s,k}| =n_{s,k}​$.

### Two sequences having the same origin

Let $s_1,s_2 \in L^n$ with $||s_1-s_2|| = k$ and these $k$ mismatches occur at the first $k$ letters (which is a valid assumption as we can just assign a new ordering).

We want

$p(origin(s_1) = origin(s_2)) = \sum_{s_0 \in L^n} p(s_0\rightarrow s_1)\cdot p(s_0\rightarrow s_2 |  || s_1-s_2||=k) $ 

Note that we need the conditional probability in the second multiplier because while $s_1$ and $s_0$ are independent, $s_1$ and $s_2$ are not. 

More explanation: Assume that $s_0$ and $s_1$ are arbitrary, then we can compute the probability of $s_0\rightarrow s_1$. If we now want to compute $s_0 \rightarrow s_2$ *given that we know* $||s_1-s_2||=k$, then this becomes a conditional probability. 

Consider again $S_{s_1,l}= \{s' \in L^n | ||s_1-s'||=l\}​$. Abusing notation, we write this as

$S_{s_1,l} = \delta_l(L^n,s_1) $. Then $\delta_m(S_{s_1,l},s_2)$ is the set of all $s'$ such that $||s'-s_1|| = l$ and $||s'-s_2||=m$.  We call this set $S_{s_1,l,s_2,m}$. 



### A new approach for the above problem

Let $s_1$=A...A and $s_2$ = C...C be of length k.

Then the number of sequences of length k, that differ from $s_1$ by $n$ and by $s_2$ by $m$ is 

$t(k,n,m) = \frac{k!}{(k-m)!(k-n)!(m+n-k)!}\cdot 2^{m+n-k}$

(it is actually $Bin(n1+n2+n3,n1)*Bin(n2+n3,n2)*Bin(n3,n3)$ with $n1 = k-n$, $n2 = k-m$ and $n3 = n+m-k$. Then multiply that by $2^{m+n-k}$ because there are always two letters (G,T) for the non A/C slot)

   	 	 	