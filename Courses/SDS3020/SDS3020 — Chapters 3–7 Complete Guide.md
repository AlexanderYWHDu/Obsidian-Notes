---
title: "SDS3020 — Chapters 3–7 Complete Guide"
tags:
  - SDS3020
  - statistics
  - probability
  - study-guide
aliases:
  - SDS3020 Review
  - Stats Complete Notes
date: 2026-03-29
---

# SDS3020 — Chapters 3–7: Systematic Study Guide

> [!abstract] Roadmap
> | Chapter | Topic | Core Question |
> |---------|-------|---------------|
> | **3** | Random Variables & Distributions | How do we describe a single random quantity mathematically? |
> | **4** | Joint Distributions | How do two random variables behave *together*? |
> | **5** | LLN, CLT & Normal Approximation | Why does averaging lots of data work so reliably? |
> | **6** | Estimation | Given data, how do we best guess an unknown parameter? |
> | **7** | Confidence Intervals | How do we quantify the *uncertainty* in our estimate? |

---

# Chapter 3 — Random Variables, Distributions & Named Models

## 3.1 What Is a Random Variable?

A **random variable** $X$ is a function that assigns a number to each outcome of a random experiment.

| Type | Definition | Examples |
|------|-----------|---------|
| **Discrete** | Support is finite or countably infinite | Number of heads in 3 flips; number of customers per hour |
| **Continuous** | Takes any value in an interval of $\mathbb{R}$ | pH of a lake; time until failure |

---

## 3.2 Cumulative Distribution Function (CDF)

The **CDF** of any random variable $X$ is:

$$F_X(x) = P(X \leq x), \quad x \in (-\infty, \infty)$$

### Properties

1. **Non-decreasing**: if $a \leq b$ then $F_X(a) \leq F_X(b)$
2. **Boundary values**: $F_X(-\infty) = 0$ and $F_X(\infty) = 1$
3. **Interval probability**: $P(a < X \leq b) = F_X(b) - F_X(a)$

### Discrete CDF

- Step function — jumps only at support values $x_1 < x_2 < \cdots$
- Jump size at $x_i$ equals the PMF value $p_X(x_i)$
- **CDF → PMF:** $p_X(x_1) = F_X(x_1)$; $p_X(x_i) = F_X(x_i) - F_X(x_{i-1})$

### Continuous CDF

- Continuous function (no jumps)
- **CDF ↔ PDF:** $F_X(x) = \int_{-\infty}^x f_X(y)\,dy$ and $f_X(x) = F_X'(x)$

---

## 3.3 Probability Mass Function (Discrete)

$$p_X(x) = P(X = x)$$

**Validity:** $p_X(x) \geq 0$ for all $x$ and $\displaystyle\sum_{x \in S_X} p_X(x) = 1$

---

## 3.4 Probability Density Function (Continuous)

$$P(a < X < b) = \int_a^b f_X(x)\,dx$$

**Validity:** $f_X(x) \geq 0$ and $\displaystyle\int_{-\infty}^{\infty} f_X(x)\,dx = 1$

> [!warning] Key Difference
> For a continuous RV, $P(X = x) = 0$ for every single point $x$. Probability is only meaningful over intervals.

---

## 3.5 Expected Value

| Case | Formula |
|------|---------|
| Discrete | $E(X) = \mu_X = \displaystyle\sum_{x \in S_X} x\, p_X(x)$ |
| Continuous | $E(X) = \mu_X = \displaystyle\int_{-\infty}^{\infty} x\, f_X(x)\,dx$ |

### Expected Value of a Function $h(X)$

| Case | Formula |
|------|---------|
| Discrete | $E[h(X)] = \displaystyle\sum_{x \in S_X} h(x)\, p_X(x)$ |
| Continuous | $E[h(X)] = \displaystyle\int_{-\infty}^{\infty} h(x)\, f_X(x)\,dx$ |

> [!tip] Linear Transformation Rule
> If $Y = a + bX$, then $E(Y) = a + b\,E(X)$.

---

## 3.6 Variance and Standard Deviation

$$\sigma_X^2 = \text{Var}(X) = E[(X - \mu_X)^2] = E(X^2) - [E(X)]^2$$

$$\sigma_X = \sqrt{\text{Var}(X)}$$

> [!tip] Scaling Rule
> If $Y = a + bX$, then $\text{Var}(Y) = b^2\,\text{Var}(X)$.

---

## 3.7 Percentiles (Continuous RVs)

The **$100(1-\alpha)$-th percentile** $x_\alpha$ satisfies:

$$F_X(x_\alpha) = P(X \leq x_\alpha) = 1 - \alpha$$

Special cases:
- **Median** = 50th percentile ($\alpha = 0.5$)
- **Lower quartile** $Q_1$ = 25th percentile
- **Upper quartile** $Q_3$ = 75th percentile
- **IQR** $= Q_3 - Q_1$

---

## 3.8 Named Discrete Distributions

### Bernoulli — $X \sim \text{Bern}(p)$

A single trial with success probability $p$.

| PMF | $p_X(x) = p^x(1-p)^{1-x}$ for $x \in \{0,1\}$ |
|-----|------|
| $E(X)$ | $p$ |
| $\text{Var}(X)$ | $p(1-p)$ |

---

### Binomial — $Y \sim \text{Bin}(n, p)$

$n$ independent Bernoulli($p$) trials; $Y$ = number of successes.

$$p_Y(y) = \binom{n}{y} p^y (1-p)^{n-y}, \quad y = 0, 1, \ldots, n$$

| $E(Y)$ | $np$ |
|--------|------|
| $\text{Var}(Y)$ | $np(1-p)$ |

**R:** `dbinom(y,n,p)` for PMF; `pbinom(y,n,p)` for CDF.

> [!example] Worked Example
> 70% of purchases are by credit card. In the next 10 purchases, $Y \sim \text{Bin}(10, 0.7)$.
> $P(5 \leq Y \leq 8)$ = `pbinom(8,10,0.7) - pbinom(4,10,0.7)` $= 0.8033$

---

### Hypergeometric — $X \sim \text{Hyp}(M_1, M_2, n)$

Population of $N = M_1 + M_2$ objects ($M_1$ successes, $M_2$ failures); draw $n$ **without replacement**.

$$p_X(x) = \frac{\dbinom{M_1}{x}\dbinom{M_2}{n-x}}{\dbinom{N}{n}}, \quad x = \max(0, n-M_2), \ldots, \min(n, M_1)$$

| $E(X)$ | $\dfrac{nM_1}{N}$ |
|--------|------|
| $\text{Var}(X)$ | $\dfrac{nM_1}{N}\!\left(1 - \dfrac{M_1}{N}\right)\!\dfrac{N-n}{N-1}$ |

> [!tip] Approximation
> If $n/N \leq 0.05$, approximate with $\text{Bin}(n,\, p = M_1/N)$ — sampling without replacement behaves like with replacement when the population is large.

**R:** `dhyper(x,M1,M2,n)` for PMF.

---

### Geometric — $X \sim \text{Geo}(p)$

Independent Bernoulli($p$) trials until the **first success**; $X$ = total trials.

$$p_X(x) = (1-p)^{x-1}p, \quad x = 1, 2, 3, \ldots$$

$$F_X(x) = 1 - (1-p)^x$$

| $E(X)$ | $1/p$ |
|--------|------|
| $\text{Var}(X)$ | $(1-p)/p^2$ |

> [!note] Memoryless Property
> $P(X > s+t \mid X > s) = P(X > t)$ — the geometric distribution "forgets" the past.

---

### Negative Binomial — $Y \sim \text{NB}(r, p)$

Independent Bernoulli($p$) trials until the **$r$-th success**; $Y$ = total trials.

$$p_Y(y) = \binom{y-1}{r-1}p^r(1-p)^{y-r}, \quad y = r, r+1, r+2, \ldots$$

| $E(Y)$ | $r/p$ |
|--------|------|
| $\text{Var}(Y)$ | $r(1-p)/p^2$ |

**R:** `dnbinom(y-r, r, p)` for PMF (R parameterizes by number of *failures*).

> [!note] Connection to Geometric
> When $r = 1$, NB$(1,p) = $ Geo$(p)$.

---

### Poisson — $X \sim \text{Poisson}(\lambda)$

Models the number of events in a fixed interval of time or space with average rate $\lambda$.

$$p_X(x) = \frac{e^{-\lambda}\lambda^x}{x!}, \quad x = 0, 1, 2, \ldots, \quad \lambda > 0$$

| $E(X)$ | $\lambda$ |
|--------|------|
| $\text{Var}(X)$ | $\lambda$ |

> [!tip] Mean = Variance
> The Poisson distribution is the only named distribution where $E(X) = \text{Var}(X) = \lambda$.

**R:** `dpois(x, lambda)` for PMF; `ppois(x, lambda)` for CDF.

---

## 3.9 Named Continuous Distributions

### Continuous Uniform — $X \sim U(A, B)$

$$f_X(x) = \frac{1}{B-A}, \quad A \leq x \leq B$$

$$F_X(x) = \frac{x-A}{B-A}, \quad A \leq x \leq B$$

| $E(X)$ | $(B+A)/2$ |
|--------|------|
| $\text{Var}(X)$ | $(B-A)^2/12$ |

**R:** `runif(n, A, B)` to simulate.

---

### Exponential — $X \sim \text{Exp}(\lambda)$

Models lifetimes and waiting times.

$$f_X(x) = \lambda e^{-\lambda x}, \quad x \geq 0$$

$$F_X(x) = 1 - e^{-\lambda x}, \quad x \geq 0$$

| $E(X)$ | $1/\lambda$ |
|--------|------|
| $\text{Var}(X)$ | $1/\lambda^2$ |

> [!note] Memoryless Property
> $P(X > s+t \mid X > s) = P(X > t)$ — the only continuous memoryless distribution.

---

### Normal — $X \sim N(\mu, \sigma^2)$

The most important continuous distribution.

$$f_X(x) = \frac{1}{\sigma\sqrt{2\pi}}\exp\!\left(-\frac{(x-\mu)^2}{2\sigma^2}\right), \quad -\infty < x < \infty$$

| $E(X)$ | $\mu$ |
|--------|------|
| $\text{Var}(X)$ | $\sigma^2$ |

#### Standardization

$$Z = \frac{X - \mu}{\sigma} \sim N(0, 1)$$

- The percentile of $X$: $x_\alpha = \mu + z_\alpha \sigma$

#### Linear Transformation

If $X \sim N(\mu, \sigma^2)$, then $a + bX \sim N(a + b\mu,\; b^2\sigma^2)$.

**R commands** for $X \sim N(\mu, \sigma^2)$:

| Purpose | R Command |
|---------|-----------|
| PDF $f_X(x)$ | `dnorm(x, mu, sigma)` |
| CDF $F_X(x) = P(X \leq x)$ | `pnorm(x, mu, sigma)` |
| $s \cdot 100$-th percentile | `qnorm(s, mu, sigma)` |
| Random sample of size $n$ | `rnorm(n, mu, sigma)` |

#### Q-Q Plots (Normality Check)

```r
qqnorm(x)   # plot sample quantiles vs normal quantiles
qqline(x)   # add reference line
```

If the points fall roughly on a straight line → normal approximation is valid.

---

## 3.10 Chapter 3 Quick Reference

| Distribution | Notation | $E(X)$ | $\text{Var}(X)$ | Support |
|---|---|---|---|---|
| Bernoulli | $\text{Bern}(p)$ | $p$ | $p(1-p)$ | $\{0,1\}$ |
| Binomial | $\text{Bin}(n,p)$ | $np$ | $np(1-p)$ | $\{0,\ldots,n\}$ |
| Hypergeometric | $\text{Hyp}(M_1,M_2,n)$ | $nM_1/N$ | (see above) | $\{\max(0,n-M_2),\ldots,\min(n,M_1)\}$ |
| Geometric | $\text{Geo}(p)$ | $1/p$ | $(1-p)/p^2$ | $\{1,2,3,\ldots\}$ |
| Neg. Binomial | $\text{NB}(r,p)$ | $r/p$ | $r(1-p)/p^2$ | $\{r,r+1,\ldots\}$ |
| Poisson | $\text{Poisson}(\lambda)$ | $\lambda$ | $\lambda$ | $\{0,1,2,\ldots\}$ |
| Uniform | $U(A,B)$ | $(A+B)/2$ | $(B-A)^2/12$ | $[A,B]$ |
| Exponential | $\text{Exp}(\lambda)$ | $1/\lambda$ | $1/\lambda^2$ | $[0,\infty)$ |
| Normal | $N(\mu,\sigma^2)$ | $\mu$ | $\sigma^2$ | $(-\infty,\infty)$ |

---

# Chapter 4 — Joint Probability Distributions

## 4.1 The Big Idea

> [!abstract] Motivation
> Chapter 3 studied *one* random variable at a time. Chapter 4 studies **two (or more) random variables together** — how they co-vary, whether knowing one tells you about the other.

---

## 4.2 Joint PMF (Discrete)

$$p_{X,Y}(x,y) = P(X = x,\; Y = y)$$

**Validity:** all values $\geq 0$ and $\displaystyle\sum_{(x,y)\in S} p_{X,Y}(x,y) = 1$

### Marginal PMF

$$p_X(x) = \sum_{y \in S_Y} p_{X,Y}(x,y) \qquad p_Y(y) = \sum_{x \in S_X} p_{X,Y}(x,y)$$

> [!tip] Table Intuition
> In a joint PMF table: **row totals** = marginal PMF of $X$; **column totals** = marginal PMF of $Y$.

---

## 4.3 Joint PDF (Continuous)

$$P\big((X,Y)\in A\big) = \iint_A f_{X,Y}(x,y)\,dx\,dy$$

**Validity:** $f_{X,Y} \geq 0$ and $\displaystyle\int_{-\infty}^{\infty}\int_{-\infty}^{\infty}f_{X,Y}(x,y)\,dx\,dy = 1$

### Marginal PDF

$$f_X(x) = \int_{-\infty}^{\infty}f_{X,Y}(x,y)\,dy \qquad f_Y(y) = \int_{-\infty}^{\infty}f_{X,Y}(x,y)\,dx$$

---

## 4.4 Conditional Distributions

### Conditional PMF

$$p_{Y|X=x}(y) = \frac{p_{X,Y}(x,y)}{p_X(x)}$$

Take a single row of the joint table, rescale so it sums to 1.

### Conditional PDF

$$f_{Y|X=x}(y) = \frac{f_{X,Y}(x,y)}{f_X(x)}$$

### Recovering the Marginal (Law of Total Probability)

$$p_Y(y) = \sum_x p_{Y|X=x}(y)\,p_X(x) \qquad f_Y(y) = \int_{-\infty}^{\infty} f_{Y|X=x}(y)\,f_X(x)\,dx$$

---

## 4.5 Independence

$X$ and $Y$ are **independent** iff their joint distribution factors:

| Case | Condition |
|------|-----------|
| Discrete | $p_{X,Y}(x,y) = p_X(x)\cdot p_Y(y)$ for **all** $x, y$ |
| Continuous | $f_{X,Y}(x,y) = f_X(x)\cdot f_Y(y)$ for **all** $x, y$ |

> [!tip] Quick Continuous Shortcut
> $X$ and $Y$ are independent iff the joint PDF factors as $g(x)\cdot h(y)$ **and** the support is a rectangle.

**If independent:**
1. $E(Y\mid X=x) = E(Y)$ (conditional mean = unconditional mean)
2. $E[g(X)\cdot h(Y)] = E[g(X)]\cdot E[h(Y)]$
3. $g(X)$ and $h(Y)$ are independent for any functions $g, h$

**i.i.d.** = independent *and* identically distributed.

---

## 4.6 Expected Value of Functions

$$E[h(X,Y)] = \sum_x\sum_y h(x,y)\,p_{X,Y}(x,y) \quad \text{(discrete)}$$

$$E[h(X,Y)] = \int\!\!\int h(x,y)\,f_{X,Y}(x,y)\,dx\,dy \quad \text{(continuous)}$$

### Linearity of Expectation (always holds — no independence needed!)

$$E(a_1X_1 + \cdots + a_nX_n) = a_1E(X_1) + \cdots + a_nE(X_n)$$

**For iid with common mean $\mu$:**
$$E\!\left(\sum_{i=1}^n X_i\right) = n\mu \qquad E(\bar{X}) = \mu$$

> The sample mean is an **unbiased estimator** of $\mu$.

---

## 4.7 Covariance

$$\text{Cov}(X,Y) = \sigma_{X,Y} = E[(X-\mu_X)(Y-\mu_Y)] = E(XY) - \mu_X\mu_Y$$

| Sign | Meaning |
|------|---------|
| $> 0$ | $X$ and $Y$ tend to move in the **same** direction |
| $< 0$ | $X$ and $Y$ tend to move in **opposite** directions |
| $= 0$ | No **linear** relationship (could still be nonlinearly dependent) |

### Properties

1. $\text{Cov}(X,Y) = \text{Cov}(Y,X)$
2. $\text{Cov}(X,X) = \text{Var}(X)$
3. $\text{Cov}(X,c) = 0$
4. Independent $\Rightarrow$ $\text{Cov}(X,Y) = 0$ (but **NOT** the reverse!)
5. $\text{Cov}(aX+b,\, cY+d) = ac\cdot\text{Cov}(X,Y)$
6. $\text{Cov}(X_1+X_2,\, Y_1+Y_2) = \text{Cov}(X_1,Y_1)+\text{Cov}(X_1,Y_2)+\text{Cov}(X_2,Y_1)+\text{Cov}(X_2,Y_2)$

---

## 4.8 Variance of Sums

| Condition | $\text{Var}(X_1 + X_2)$ | $\text{Var}(X_1 - X_2)$ |
|-----------|-------------------------|-------------------------|
| Independent | $\sigma_1^2 + \sigma_2^2$ | $\sigma_1^2 + \sigma_2^2$ |
| Dependent | $\sigma_1^2 + \sigma_2^2 + 2\text{Cov}(X_1,X_2)$ | $\sigma_1^2 + \sigma_2^2 - 2\text{Cov}(X_1,X_2)$ |

> [!warning] Common Mistake
> When **subtracting** dependent variables, variances still **add** — only the covariance term gets subtracted. Variances are always non-negative.

**For iid with variance $\sigma^2$:**
$$\text{Var}\!\left(\sum_{i=1}^n X_i\right) = n\sigma^2 \qquad \text{Var}(\bar{X}) = \frac{\sigma^2}{n}$$

---

## 4.9 Pearson's Correlation Coefficient

$$\rho_{X,Y} = \text{Corr}(X,Y) = \frac{\text{Cov}(X,Y)}{\sigma_X \cdot \sigma_Y}$$

| Property | Details |
|----------|---------|
| Range | $-1 \leq \rho \leq 1$ |
| Scale-invariant | $\text{Corr}(aX+b,\, cY+d) = \text{sign}(ac)\cdot\text{Corr}(X,Y)$ |
| Perfect linear | $\rho = \pm 1 \iff Y = aX + b$ |
| Independence | Indep. $\Rightarrow$ $\rho = 0$, but **$\rho = 0 \not\Rightarrow$ independent** |

### Sample Covariance and Correlation

$$S_{X,Y} = \frac{1}{n-1}\sum_{i=1}^n(X_i - \bar{X})(Y_i - \bar{Y}) \qquad r_{X,Y} = \frac{S_{X,Y}}{S_X S_Y}$$

**R:** `cov(x,y)` and `cor(x,y)`

---

# Chapter 5 — LLN, Convolutions & the Central Limit Theorem

## 5.1 Law of Large Numbers (LLN)

> [!success] Law of Large Numbers
> Let $X_1, \ldots, X_n$ be **iid** with finite $E[g(X_1)]$. Then for any $\varepsilon > 0$:
> $$P\!\left(\left|\frac{1}{n}\sum_{i=1}^n g(X_i) - E[g(X_1)]\right| > \varepsilon\right) \to 0 \quad \text{as } n \to \infty$$

In plain terms: **the sample average converges in probability to the true mean** as the sample size grows.

- $\bar{X}$ is a **consistent estimator** of $E(X_1)$
- $\hat{p}$ converges in probability to $p$ (why polling works!)

> [!warning] LLN Limitation
> The LLN requires $E(X)$ to be **finite**. For example, if $f(x) = 1/x^2$ on $[1,\infty)$, then $E(X) = \infty$ and the LLN does not apply.

---

## 5.2 Convolutions

The **convolution** of $X$ and $Y$ is the distribution of $X + Y$ (requires independence).

| $X \sim$ | $Y \sim$ | $X + Y \sim$ |
|---|---|---|
| $\text{Bin}(n_1, p)$ | $\text{Bin}(n_2, p)$ | $\text{Bin}(n_1+n_2, p)$ |
| $\text{Poisson}(\lambda_1)$ | $\text{Poisson}(\lambda_2)$ | $\text{Poisson}(\lambda_1+\lambda_2)$ |
| $N(\mu_1, \sigma_1^2)$ | $N(\mu_2, \sigma_2^2)$ | $N(\mu_1+\mu_2,\; \sigma_1^2+\sigma_2^2)$ |

> [!warning] Independence Required
> These convolution results **only hold when $X$ and $Y$ are independent**.

---

## 5.3 Linear Combinations of Normal Variables

> [!success] Key Result
> Let $X_1, \ldots, X_n$ be **independent** with $X_i \sim N(\mu_i, \sigma_i^2)$, and let $Y = \sum a_i X_i$. Then:
> $$Y \sim N\!\left(\sum a_i\mu_i,\;\sum a_i^2\sigma_i^2\right)$$

**Sample mean of a normal population:**
$$\bar{X} \sim N\!\left(\mu,\; \frac{\sigma^2}{n}\right) \quad \text{exactly}$$

> [!example] Worked Example — SAT Scores
> $X \sim N(529, 5732)$ (Math), $Y \sim N(474, 6368)$ (Verbal), independent.
>
> $P(X > Y) = P(X - Y > 0)$.
> Define $D = X - Y \sim N(55, 12100)$, so $\sigma_D = 110$.
>
> $P(D > 0) = P(Z > (0-55)/110) = P(Z > -0.5) = \Phi(0.5) \approx 0.6915$

---

## 5.4 The Central Limit Theorem

> [!success] Central Limit Theorem (CLT)
> Let $X_1, \ldots, X_n$ be **iid** with finite mean $\mu$ and finite variance $\sigma^2$. For large $n$:
>
> **Sample mean:** $\bar{X} \;\dot{\sim}\; N\!\left(\mu,\; \dfrac{\sigma^2}{n}\right)$
>
> **Sum:** $T = X_1 + \cdots + X_n \;\dot{\sim}\; N(n\mu,\; n\sigma^2)$
>
> ($\dot{\sim}$ = approximately distributed as)

**Why it's remarkable:** the original distribution can be anything — uniform, exponential, skewed — and $\bar{X}$ still tends toward normality for large $n$.

**Rule of thumb:** $n \geq 30$ is usually sufficient. More skewed populations may need $n > 50$.

**Standardized form:**
$$Z = \frac{\bar{X} - \mu}{\sigma/\sqrt{n}} \approx N(0,1)$$

---

## 5.5 Normal Approximation to the Binomial

> [!success] DeMoivre–Laplace Theorem
> If $T \sim \text{Bin}(n,p)$, then for large $n$:
> $$T \;\dot{\sim}\; N(np,\; np(1-p))$$

**When to use:** $np \geq 5$ **and** $n(1-p) \geq 5$.

### Continuity Correction

$T$ is discrete but $N$ is continuous. Bridge the gap by shifting ±0.5:

| Desired | Approximation |
|---------|--------------|
| $P(T \leq k)$ | $P(Y \leq k + 0.5)$ |
| $P(T = k)$ | $P(k - 0.5 < Y < k + 0.5)$ |
| $P(T \geq k)$ | $P(Y \geq k - 0.5)$ |
| $P(a \leq T \leq b)$ | $P(a - 0.5 \leq Y \leq b + 0.5)$ |

---

## 5.6 Chapter 5 Decision Tree

```
Collect sample X₁,...,Xₙ (iid, finite μ and σ²)
         ↓
   Is population Normal?
      /          \
   YES            NO
(any n)        Is n large? (≥30)
   ↓              /       \
X̄ ~ N(μ,σ²/n)  YES       NO
  EXACTLY         ↓         ↓
              X̄ ≈ N(μ,σ²/n)  Need exact
               (CLT)         methods
```

---

## 5.7 Chapter 5 Formula Sheet

| Result | Formula | When |
|--------|---------|------|
| LLN | $\bar{X} \xrightarrow{p} \mu$ | Conceptual justification |
| Normal population | $\bar{X} \sim N(\mu, \sigma^2/n)$ | Population is exactly normal |
| CLT — mean | $\bar{X} \;\dot{\sim}\; N(\mu, \sigma^2/n)$ | Any population, large $n$ |
| CLT — sum | $T \;\dot{\sim}\; N(n\mu, n\sigma^2)$ | Any population, large $n$ |
| Normal approx to Bin | $T \;\dot{\sim}\; N(np, np(1-p))$ | Binomial, large $n$ |
| Standardize $\bar{X}$ | $Z = \dfrac{\bar{X}-\mu}{\sigma/\sqrt{n}}$ | Table lookup |

---

# Chapter 6 — Estimation

## 6.1 Setup and Vocabulary

| Symbol | Meaning |
|--------|---------|
| $\theta$ | Unknown population **parameter** |
| $X_1, \ldots, X_n$ | Sample (before values observed) |
| $x_1, \ldots, x_n$ | Observed data |
| $\hat{\theta}(X_1,\ldots,X_n)$ | **Estimator** (random variable — a formula) |
| $\hat{\theta}(x_1,\ldots,x_n)$ | **Estimate** (a single number computed from data) |

**Goal of point estimation:** pick a single "best guess" for $\theta$ based on data.

---

## 6.2 Unbiasedness

> [!info] Definition
> An estimator $\hat{\theta}$ is **unbiased** for $\theta$ if $E(\hat{\theta}) = \theta$.
>
> The **bias** is $\text{bias}(\hat{\theta}) = E(\hat{\theta}) - \theta$.

**Standard examples of unbiased estimators:**

| Estimator | Parameter |
|-----------|-----------|
| $\bar{X}$ | $\mu = E(X_i)$ |
| $\hat{p} = X/n$ | $p$ (Bernoulli probability) |
| $S^2 = \dfrac{1}{n-1}\displaystyle\sum_{i=1}^n(X_i - \bar{X})^2$ | $\sigma^2$ |

> [!warning] Note on Standard Deviation
> $S^2$ is unbiased for $\sigma^2$, but $S$ is **biased** for $\sigma$ (Jensen's inequality).

### Standard Error

$$\sigma_{\hat{\theta}} = \sqrt{\text{Var}(\hat{\theta})}$$

The **estimated standard error** replaces unknown population parameters with sample estimates: $S_{\hat{\theta}}$.

---

## 6.3 Mean Square Error (MSE)

$$\text{MSE}(\hat{\theta}) = E[(\hat{\theta} - \theta)^2] = \text{Var}(\hat{\theta}) + [\text{bias}(\hat{\theta})]^2$$

- For **unbiased** estimators: $\text{MSE}(\hat{\theta}) = \text{Var}(\hat{\theta})$
- When comparing estimators, prefer the one with **smaller MSE**

> [!tip] Bias-Variance Tradeoff
> A slightly biased estimator with much lower variance can have a smaller MSE than an unbiased one — this is the essence of the bias-variance tradeoff in statistics and machine learning.

---

## 6.4 Method of Moments (MoM)

**Strategy:** set theoretical moments equal to sample moments, then solve for the parameter(s).

$$\underbrace{\mu_k = E(X^k)}_{\text{theoretical moment}} \quad \longleftrightarrow \quad \underbrace{\hat{\mu}_k = \frac{1}{n}\sum_{i=1}^n X_i^k}_{\text{sample moment}}$$

**Procedure:**
1. Write out $E(X)$ (and $E(X^2)$ if there are two parameters) in terms of $\theta$
2. Set equal to $\bar{X}$ (and $\frac{1}{n}\sum X_i^2$)
3. Solve for $\hat{\theta}$

> [!example] Worked Example — Poisson MoM
> $X_i \sim \text{Poisson}(\lambda)$. Since $E(X_i) = \lambda$, set $\lambda = \bar{X}$.
>
> MoM estimator: $\hat{\lambda} = \bar{X}$. Unbiased: $E(\bar{X}) = \lambda$ ✓

---

## 6.5 Maximum Likelihood Estimation (MLE)

**Core idea:** find the parameter value that makes the observed data *most probable*.

### Likelihood Function

For iid observations $x_1, \ldots, x_n$:

$$L(\theta) = \prod_{i=1}^n f(x_i \mid \theta) \quad \text{(continuous)} \qquad \text{or} \qquad L(\theta) = \prod_{i=1}^n p(x_i \mid \theta) \quad \text{(discrete)}$$

The **MLE** $\hat{\theta}$ maximizes $L(\theta)$.

### Log-Likelihood Trick

It's usually easier to maximize the **log-likelihood**:

$$\ell(\theta) = \log L(\theta) = \sum_{i=1}^n \log f(x_i \mid \theta)$$

Since $\log$ is monotone, $\hat{\theta}$ that maximizes $\ell$ also maximizes $L$.

**Steps:**
1. Write $\ell(\theta) = \sum \log f(x_i \mid \theta)$
2. Differentiate $\ell'(\theta) = 0$
3. Solve for $\hat{\theta}$; verify it's a maximum (not minimum)

> [!example] Worked Example — MLE for Normal (known variance)
> $X_i \sim N(\mu, 1)$.
>
> $\ell(\mu) = -\frac{n}{2}\log(2\pi) - \frac{1}{2}\sum(x_i - \mu)^2$
>
> $\ell'(\mu) = \sum(x_i - \mu) = 0 \implies \hat{\mu} = \bar{X}$

> [!example] Worked Example — MLE for Uniform$(0, \theta)$
> $f(x\mid\theta) = 1/\theta$ for $0 \leq x \leq \theta$.
>
> $L(\theta) = \theta^{-n}$ for $\theta \geq \max(x_i)$; decreasing in $\theta$.
>
> MLE: $\hat{\theta} = X_{(n)} = \max(X_1, \ldots, X_n)$ (the sample maximum).
>
> Note: MoM gives $\hat{\theta} = 2\bar{X}$, which is unbiased, but MLE has smaller MSE for large $n$.

> [!note] MLE Optimality
> MLEs are asymptotically (large-$n$) optimal under regularity conditions — they achieve the smallest possible variance among consistent estimators.

---

## 6.6 Chapter 6 Summary

| Method | Strategy | Strength |
|--------|----------|----------|
| MoM | Match sample moments to theoretical moments | Simple, always gives unbiased estimators for location parameters |
| MLE | Maximize the probability of observed data | Asymptotically optimal, widely applicable |

---

# Chapter 7 — Confidence Intervals

## 7.1 From Point Estimates to Intervals

A **point estimate** is a single number. A **confidence interval** gives a *range* of plausible values with a stated degree of confidence.

> [!info] Correct Interpretation
> A 95% CI does **not** mean "there is a 95% probability that $\theta$ is in this interval." $\theta$ is a fixed (unknown) constant — it either is or isn't in the interval.
>
> Correct interpretation: **If we repeated the sampling procedure many times, about 95% of the resulting intervals would contain the true $\theta$**.

---

## 7.2 The General Framework

By CLT, many estimators $\hat{\theta}$ satisfy:

$$\frac{\hat{\theta} - \theta}{S_{\hat{\theta}}} \approx N(0,1) \quad \text{or} \quad \approx t_\nu$$

This gives the general $(1-\alpha)100\%$ confidence interval:

$$\hat{\theta} \pm z_{\alpha/2}\, S_{\hat{\theta}} \qquad \text{(Z-based)}$$

$$\hat{\theta} \pm t_{\nu,\,\alpha/2}\, S_{\hat{\theta}} \qquad \text{(T-based)}$$

### Z vs T: When to Use Which

| Situation | Use |
|-----------|-----|
| **Proportion** $p$ | Z interval |
| **Mean** $\mu$, population variance $\sigma^2$ known | Z interval |
| **Mean** $\mu$, $\sigma^2$ unknown, assume normal population | T interval |
| **Variance** $\sigma^2$ | $\chi^2$ interval |

---

## 7.3 Confidence Interval for a Proportion

Let $X \sim \text{Bin}(n,p)$, $\hat{p} = X/n$.

By CLT: $\dfrac{\hat{p} - p}{\sqrt{\hat{p}(1-\hat{p})/n}} \approx N(0,1)$

### $(1-\alpha)100\%$ CI for $p$

$$\hat{p} \pm z_{\alpha/2}\sqrt{\frac{\hat{p}(1-\hat{p})}{n}}$$

**Valid when:** $n\hat{p} \geq 8$ and $n(1-\hat{p}) \geq 8$.

> [!example] Worked Example
> Survey of $n = 100$; 89 favor solar energy. $\hat{p} = 0.89$.
>
> 95% CI: $0.89 \pm 1.96\sqrt{(0.89)(0.11)/100} = 0.89 \pm 0.0615 = (0.829,\; 0.952)$
>
> "We are 95% confident the true proportion is between 82.9% and 95.2%."

### Margin of Error and Sample Size

$$\text{MOE} = z_{\alpha/2}\sqrt{\frac{\hat{p}(1-\hat{p})}{n}}$$

To achieve a CI of **length** $L$, choose:

$$n \geq \frac{4z_{\alpha/2}^2\,\hat{p}_{pr}(1-\hat{p}_{pr})}{L^2}$$

If no preliminary estimate $\hat{p}_{pr}$ is available, use $\hat{p}_{pr} = 0.5$ (most conservative).

---

## 7.4 Z Confidence Interval for a Mean ($\sigma^2$ known)

$$\bar{X} \pm z_{\alpha/2}\,\frac{\sigma}{\sqrt{n}}$$

**Valid when:** $n \geq 30$ or population is normal, and $\sigma^2$ is known.

---

## 7.5 T Confidence Interval for a Mean ($\sigma^2$ unknown)

If $X_1, \ldots, X_n$ are iid $N(\mu, \sigma^2)$ with unknown $\sigma^2$:

$$\frac{\bar{X} - \mu}{S/\sqrt{n}} \sim t_{n-1}$$

### $(1-\alpha)100\%$ T Confidence Interval for $\mu$

$$\bar{X} \pm t_{n-1,\,\alpha/2}\cdot\frac{S}{\sqrt{n}}$$

**Notes:**
- If the population is normal, this holds for **all** $n$
- If not normal, works well for $n \geq 30$
- As $n \to \infty$: $t_{n-1,\alpha/2} \to z_{\alpha/2}$ — T and Z intervals converge

**R:** `confint(lm(x ~ 1), level = 1-alpha)`

> [!tip] T Distribution Properties
> The $t$ distribution has heavier tails than $N(0,1)$. As degrees of freedom $\nu$ increase, $t_\nu \to N(0,1)$.

**Common critical values** (95% CI, $\alpha/2 = 0.025$):

| $n-1$ | $t_{n-1,\,0.025}$ |
|-------|------|
| 1 | 12.706 |
| 8 | 2.306 |
| 25 | 2.060 |
| 100 | 1.984 |
| $\infty$ | 1.960 |

**R:** `qt(1 - alpha/2, df = n-1)` for the critical value.

### Precision and Sample Size for Means

$$\text{MOE} = t_{n-1,\alpha/2}\cdot\frac{S}{\sqrt{n}}$$

To achieve length $L$:

$$n \geq \left(\frac{2z_{\alpha/2}\cdot S_{pr}}{L}\right)^2$$

If no preliminary $S_{pr}$: estimate range, then $S_{pr} \approx \text{range}/3.5$ or $\text{range}/4$.

---

## 7.6 Confidence Interval for a Variance

If population is **normal**, then:

$$\frac{(n-1)S^2}{\sigma^2} \sim \chi^2_{n-1}$$

### $(1-\alpha)100\%$ CI for $\sigma^2$

$$\left(\frac{(n-1)S^2}{\chi^2_{n-1,\,\alpha/2}},\quad \frac{(n-1)S^2}{\chi^2_{n-1,\,1-\alpha/2}}\right)$$

### $(1-\alpha)100\%$ CI for $\sigma$

$$\left(\sqrt{\frac{(n-1)S^2}{\chi^2_{n-1,\,\alpha/2}}},\quad \sqrt{\frac{(n-1)S^2}{\chi^2_{n-1,\,1-\alpha/2}}}\right)$$

> [!warning] Normality Required
> Unlike the $t$ CI for the mean, the $\chi^2$ CI for variance/SD is **not robust** to non-normality. Always check the normal assumption (Q-Q plot) before applying it.

**R:** `qchisq(p, df)` gives the $p \cdot 100$-th percentile of $\chi^2_\nu$.

> [!example] Temperature Variance CI
> $n = 10$ NY September temperatures; $S^2 = $ (computed from data).
>
> 95% CI: find $\chi^2_{9,\,0.025}$ and $\chi^2_{9,\,0.975}$ in R:
> ```r
> qchisq(0.975, 9)   # upper: 19.02
> qchisq(0.025, 9)   # lower: 2.70
> ```
>
> CI for $\sigma^2$: $\left(\dfrac{9S^2}{19.02},\; \dfrac{9S^2}{2.70}\right)$

---

## 7.7 Chapter 7 Master Summary

| Parameter | Statistic | Distribution | CI Formula |
|-----------|-----------|-------------|------------|
| $p$ (proportion) | $\hat{p}$ | $N(0,1)$ approx. | $\hat{p} \pm z_{\alpha/2}\sqrt{\hat{p}(1-\hat{p})/n}$ |
| $\mu$ ($\sigma^2$ known) | $\bar{X}$ | $N(0,1)$ approx. | $\bar{X} \pm z_{\alpha/2}\,\sigma/\sqrt{n}$ |
| $\mu$ ($\sigma^2$ unknown) | $\bar{X}$ | $t_{n-1}$ | $\bar{X} \pm t_{n-1,\alpha/2}\,S/\sqrt{n}$ |
| $\sigma^2$ | $S^2$ | $\chi^2_{n-1}$ | $\left(\frac{(n-1)S^2}{\chi^2_{upper}},\; \frac{(n-1)S^2}{\chi^2_{lower}}\right)$ |

### Common $z_{\alpha/2}$ Values

| Confidence Level | $\alpha$ | $z_{\alpha/2}$ |
|-----------------|---------|----------------|
| 90% | 0.10 | 1.645 |
| 95% | 0.05 | 1.960 |
| 99% | 0.01 | 2.576 |

---

# Cross-Chapter Connections

```
Ch3: Single RV (PMF/PDF, E, Var, named distributions)
         ↓
Ch4: Joint RVs (joint dist., covariance, correlation)
         ↓
Ch5: Sums/averages of many RVs (LLN → CLT)
         ↓
Ch6: Estimation (use data to guess θ — MoM, MLE)
         ↓
Ch7: Confidence intervals (quantify uncertainty in guess)
```

> [!success] The Big Statistical Story
> 1. **Ch3 & 4**: Model individual and joint randomness precisely
> 2. **Ch5 — LLN**: $\bar{X}$ converges to $\mu$ as $n \to \infty$ (estimation is *possible*)
> 3. **Ch5 — CLT**: $\bar{X}$ is approximately $N(\mu, \sigma^2/n)$ (we know *how* it behaves)
> 4. **Ch6**: Use CLT-justified estimators (unbiased, minimum MSE) to guess $\theta$
> 5. **Ch7**: Use CLT-justified pivot statistics to build intervals that capture $\theta$ with controlled probability

---

*Source: SDS3020 Lecture Notes (Chapters 3–7)*
