# Master Theorem

## Setup

For a recurrence of the form:

## The Three Cases

The key question: **how does $f(n)$ compare to $n^{c_{crit}}$?**

| Case       | Intuition                                  | Condition                                                                 | Result                                             |
| ---------- | ------------------------------------------ | ------------------------------------------------------------------------- | -------------------------------------------------- |
| **Case 1** | Recursive dominates  **bottom-heavy**      | $f(n) = O(n^c)$ where $c < c_{crit}$                                      | $T(n) = \Theta(n^{c_{crit}})$$c_{crit} = \log_b a$ |
| **Case 2** | Recursive and non-recursive **balanced**   | $f(n) = \Theta(n^{c_{crit}} \log^k n)$ where $k \geq 0$                   | $T(n) = \Theta(n^{c_{crit}} \log^{k+1} n)$         |
| **Case 3** | Non-recursive work dominates **top-heavy** | $f(n) = \Omega(n^c)$ where $c > c_{crit}$, and regularity condition holds | $T(n) = \Theta(f(n))$                              |

> **Regularity condition (Case 3):** $a \cdot f(n/b) \leq k \cdot f(n)$ for some $k < 1$ and large $n$.
> In practice, this is almost always satisfied for standard $f(n)$ — no need to verify unless the question asks.

---

## Case 2 in Detail

Case 2 has three sub-cases depending on $k$:

| Sub-case | Condition on kk k                                                                                                        | Result                                                                                      | Example                                                                                                            |
| -------- | ------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| **2a**   | k>−1k > -1 k>−1 (includes k=0,1,2...k=0, 1, 2... k=0,1,2...)                                                             | T(n)=Θ(nccrit(log⁡n)k+1)T(n) = \Theta(n^{c_{crit}} (\log n)^{k+1}) T(n)=Θ(nccrit​(logn)k+1) | k=0k=0 k=0: Merge Sort → Θ(nlog⁡n)\Theta(n \log n) Θ(nlogn)                                                        |
| **2b**   | k=−1k = -1 k=−1, i.e. f(n)=Θ(nccrit/log⁡n)f(n) = \Theta(n^{c_{crit}} / \log n) f(n)=Θ(nccrit​/logn)                      | T(n)=Θ(nccritlog⁡log⁡n)T(n) = \Theta(n^{c_{crit}} \log \log n) T(n)=Θ(nccrit​loglogn)       | T(n)=2T(n/2)+n/log⁡nT(n) = 2T(n/2) + n/\log n T(n)=2T(n/2)+n/logn → Θ(nlog⁡log⁡n)\Theta(n \log \log n) Θ(nloglogn) |
| **2c**   | k<−1k < -1 k<−1, i.e. f(n)=Θ(nccrit/(log⁡n)2)f(n) = \Theta(n^{c_{crit}} / (\log n)^2) f(n)=Θ(nccrit​/(logn)2) or smaller | T(n)=Θ(nccrit)T(n) = \Theta(n^{c_{crit}}) T(n)=Θ(nccrit​)                                   | T(n)=2T(n/2)+n/(log⁡n)2T(n) = 2T(n/2) + n/(\log n)^2 T(n)=2T(n/2)+n/(logn)2 → Θ(n)\Theta(n) Θ(n)                   |

> **For this exam:** 2b and 2c are unlikely to appear. Focus on **2a**, especially the k=0k=0 k=0 case which covers Merge Sort, Binary Search, and most standard recurrences.

---

## Common Examples

| Recurrence | $a$ | $b$ | $c_{crit}$ | $f(n)$ | Case | Result |
|---|---|---|---|---|---|---|
| $T(n) = 2T(n/2) + n$ | 2 | 2 | 1 | $n^1$, $k=0$ | 2a | $\Theta(n \log n)$ |
| $T(n) = 2T(n/2) + n \log n$ | 2 | 2 | 1 | $n^1 \log^1 n$, $k=1$ | 2b | $\Theta(n \log^2 n)$ |
| $T(n) = T(n/2) + 1$ | 1 | 2 | 0 | $n^0$, $k=0$ | 2a | $\Theta(\log n)$ |
| $T(n) = 8T(n/2) + n^2$ | 8 | 2 | 3 | $n^2$, $c=2 < 3$ | 1 | $\Theta(n^3)$ |
| $T(n) = 2T(n/2) + n^2$ | 2 | 2 | 1 | $n^2$, $c=2 > 1$ | 3 | $\Theta(n^2)$ |
| $T(n) = 3T(n/3) + n$ | 3 | 3 | 1 | $n^1$, $k=0$ | 2a | $\Theta(n \log n)$ |
| $T(n) = 9T(n/3) + n^2$ | 9 | 3 | 2 | $n^2$, $k=0$ | 2a | $\Theta(n^2 \log n)$ |
| $T(n) = 3T(n/2) + n$ | 3 | 2 | 1.58 | $n^1$, $c=1 < 1.58$ | 1 | $\Theta(n^{1.58})$ |

---

## Step-by-Step Checklist

```
1. Identify a, b, f(n) from the recurrence
2. Compute c_crit = log_b(a)
3. Compare f(n) to n^c_crit:
   - f(n) grows SLOWER → Case 1 → answer is Θ(n^c_crit)
   - f(n) grows THE SAME → Case 2 → answer is Θ(n^c_crit · log^(k+1) n)
   - f(n) grows FASTER  → Case 3 → answer is Θ(f(n))
```
