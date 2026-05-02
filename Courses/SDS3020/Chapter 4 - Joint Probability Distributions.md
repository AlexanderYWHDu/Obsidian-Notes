---
title: Chapter 4 - Joint Probability Distributions
tags:
  - SDS3020
  - statistics
  - probability
aliases:
  - Joint Distributions
  - Ch4 Stats
---

# Chapter 4 — Joint Probability Distributions

> [!abstract] What's This Chapter About?
> So far we've studied single random variables (X on its own). This chapter is about **two or more random variables at the same time** — how they behave together, whether they're related, and how to measure that relationship.
>
> Key topics: Joint PMF/PDF → Marginal distributions → Conditional distributions → Independence → Covariance & Correlation

---

## 1. Joint Distributions — The Big Idea

Imagine you measure **both** the height and weight of a randomly selected person. These two measurements come from the **same experiment**, so they're not independent of each other — we need tools to describe them *together*.

A **joint distribution** captures the probabilities of two (or more) random variables simultaneously.

---

## 2. Joint PMF (Discrete Case)

> [!info] When to use
> Use the **joint PMF** when both X and Y take on *countable* (discrete) values — e.g., integers, categories.

### Definition

$$p_{X,Y}(x, y) = P(X = x,\ Y = y)$$

Think of it as: *"What's the probability that X equals this AND Y equals that?"*

### Validity Conditions

For a joint PMF to be valid:
1. All probabilities must be **non-negative**: $p_{X,Y}(x_i, y_i) \geq 0$
2. All probabilities must **sum to 1**: $\displaystyle\sum_{(x_i,\, y_i) \in \mathcal{S}} p_{X,Y}(x_i, y_i) = 1$

### Finding Probabilities over a Region

$$P(a < X \leq b,\ c < Y \leq d) = \sum_{\substack{a < x_i \leq b \\ c < y_i \leq d}} p_{X,Y}(x_i, y_i)$$

Just sum up all the joint probabilities within the rectangle defined by the conditions.

---

## 3. Marginal PMF

> [!tip] Key Intuition
> A **marginal PMF** is just the distribution of *one* variable on its own, ignoring the other. You get it by **summing out** the other variable.

$$p_X(x) = \sum_{y \in \mathcal{S}_Y} p_{X,Y}(x, y) \qquad p_Y(y) = \sum_{x \in \mathcal{S}_X} p_{X,Y}(x, y)$$

**How to think about it:** In a joint probability table, the marginal PMF of X is the **row totals**, and the marginal PMF of Y is the **column totals**.

### 🔢 Worked Example — CD Covers

A factory measures the length (X mm) and width (Y mm) of CD covers:

|       | y = 120 | y = 121 | **Row Total** |
|-------|---------|---------|---------------|
| x = 129 | 0.12  | 0.08    | **0.20**      |
| x = 130 | 0.42  | 0.28    | **0.70**      |
| x = 131 | 0.06  | 0.04    | **0.10**      |
| **Col Total** | **0.60** | **0.40** | **1.00** |

**a) Verify it's valid:** Sum all entries → 0.12 + 0.08 + 0.42 + 0.28 + 0.06 + 0.04 = **1.00** ✓

**b)** $P(129.5 \leq X \leq 131.5,\ Y \geq 121)$
→ X must be 130 or 131 (since values are integers), Y = 121
→ $= 0.28 + 0.04 = \mathbf{0.32}$

**c)** $P(129.5 \leq X \leq 131.5)$
→ X = 130 or 131, any Y
→ $= 0.42 + 0.28 + 0.06 + 0.04 = \mathbf{0.80}$ (or just row totals: 0.70 + 0.10 = 0.80)

**d) Marginal PMF of Y:**
$p_Y(120) = 0.60$, $p_Y(121) = 0.40$ (column totals)

---

## 4. Joint PDF (Continuous Case)

> [!info] When to use
> Use the **joint PDF** when X and Y are both *continuous* random variables.

### Definition

The joint PDF $f_{X,Y}(x,y)$ satisfies:

$$P\big((X,Y) \in A\big) = \iint_A f_{X,Y}(x,y)\, dx\, dy$$

Probability = **volume under the surface** $f_{X,Y}$ over region A.

### Validity Condition

$$\int_{-\infty}^{\infty}\int_{-\infty}^{\infty} f_{X,Y}(x,y)\, dx\, dy = 1$$

### Marginal PDFs

**Integrate out** the other variable:

$$f_X(x) = \int_{-\infty}^{\infty} f_{X,Y}(x,y)\, dy \qquad f_Y(y) = \int_{-\infty}^{\infty} f_{X,Y}(x,y)\, dx$$

### 🔢 Worked Example — Joint PDF

Given:
$$f_{X,Y}(x,y) = \frac{12}{7}(x^2 + xy), \quad 0 \leq x \leq 1,\ 0 \leq y \leq 1$$

**a) Verify validity:**
$$\int_0^1\int_0^1 \frac{12}{7}(x^2 + xy)\, dy\, dx = \frac{12}{7} \int_0^1 \left[x^2 y + \frac{xy^2}{2}\right]_0^1 dx = \frac{12}{7}\int_0^1\left(x^2 + \frac{x}{2}\right)dx = \frac{12}{7} \cdot \frac{7}{12} = 1\ ✓$$

**b)** $P(X > Y)$ — integrate over the region where $x > y$ (triangle below diagonal):
$$\int_0^1\int_0^x \frac{12}{7}(x^2 + xy)\, dy\, dx = \frac{12}{7}\int_0^1\left(x^3 + \frac{x^3}{2}\right)dx = \frac{12}{7}\cdot\frac{3}{4}\cdot\frac{1}{4} = \frac{9}{14}$$

**c) Marginal PDF of X:**
$$f_X(x) = \int_0^1 \frac{12}{7}(x^2 + xy)\, dy = \frac{12}{7}\left[x^2 y + \frac{xy^2}{2}\right]_0^1 = \frac{12}{7}\left(x^2 + \frac{x}{2}\right)$$

---

## 5. Conditional Distributions

> [!tip] Key Intuition
> A **conditional distribution** answers: *"Given that I already know X = x, what does the distribution of Y look like now?"*
> It's like zooming in on one row (or slice) of the joint distribution.

### Conditional PMF (Discrete)

$$p_{Y|X=x}(y) = P(Y = y \mid X = x) = \frac{p_{X,Y}(x,y)}{p_X(x)}$$

**Think of it as:** take a specific row of the joint table, then rescale so the row sums to 1.

### 🔢 Example — CD Covers (Conditional PMF)

Find the conditional PMF of Y given X = 130:

- $p_X(130) = 0.70$ (marginal, the row total)
- $p_{Y|X=130}(120) = \dfrac{0.42}{0.70} = 0.60$
- $p_{Y|X=130}(121) = \dfrac{0.28}{0.70} = 0.40$

**Verify:** 0.60 + 0.40 = 1 ✓

**Conditional mean** $E(Y \mid X=130)$:
$$= 120 \times 0.60 + 121 \times 0.40 = 72 + 48.4 = 120.4$$

**Conditional variance** $\text{Var}(Y \mid X=130)$:
$$E(Y^2 \mid X=130) = 120^2(0.60) + 121^2(0.40) = 8640 + 5856.4 = 14496.4$$
$$\text{Var}(Y \mid X=130) = 14496.4 - 120.4^2 = 14496.4 - 14496.16 = 0.24$$

> [!note] Recovering the Marginal from Conditional
> You can also compute the marginal PMF using conditional PMFs (law of total probability):
> $$p_Y(y) = \sum_x p_{Y|X=x}(y)\, p_X(x)$$

---

### Conditional PDF (Continuous)

$$f_{Y|X=x}(y) = \frac{f_{X,Y}(x,y)}{f_X(x)}$$

**Properties:**
- $\displaystyle\int_{-\infty}^{\infty} f_{Y|X=x}(y)\, dy = 1$ (it's a valid PDF)
- $P(a < Y < b \mid X = x) = \displaystyle\int_a^b f_{Y|X=x}(y)\, dy$

### 🔢 Example — Conditional PDF

Using $f_{X,Y}(x,y) = \dfrac{12}{7}(x^2 + xy)$ and the marginal $f_X(x) = \dfrac{12}{7}\!\left(x^2 + \dfrac{x}{2}\right)$:

**a)** At $X = 0.5$:
$$f_{Y|X=0.5}(y) = \frac{\frac{12}{7}(0.25 + 0.5y)}{\frac{12}{7}(0.25 + 0.25)} = \frac{0.25 + 0.5y}{0.5} = 0.5 + y, \quad 0 \leq y \leq 1$$

**b)** $P(0 < Y < 0.5 \mid X = 0.5) = \displaystyle\int_0^{0.5}(0.5 + y)\, dy = \left[0.5y + \frac{y^2}{2}\right]_0^{0.5} = 0.25 + 0.125 = 0.375$

**c)** $E(Y \mid X = 0.5) = \displaystyle\int_0^1 y(0.5 + y)\, dy = \left[\frac{0.5y^2}{2} + \frac{y^3}{3}\right]_0^1 = 0.25 + 0.333 \approx 0.583$

> [!note] Recovering the Marginal PDF
> $$f_Y(y) = \int_{-\infty}^{\infty} f_{Y|X=x}(y)\, f_X(x)\, dx$$

---

## 6. Independent Random Variables

> [!tip] Key Intuition
> X and Y are **independent** if knowing the value of one tells you **nothing** about the other. The joint distribution just factors into the product of the two marginals.

### Definition

$$P(X \in A,\ Y \in B) = P(X \in A)\cdot P(Y \in B)$$

### Practical Test

| Case | Independence condition |
|------|----------------------|
| Discrete | $p_{X,Y}(x,y) = p_X(x)\cdot p_Y(y)$ for **all** x, y |
| Continuous | $f_{X,Y}(x,y) = f_X(x)\cdot f_Y(y)$ for **all** x, y |

> [!tip] Quick Shortcut for Continuous Variables
> X and Y are independent iff you can **factor** the joint PDF into a function of x alone times a function of y alone (and the support is a **rectangle**):
> $$f_{X,Y}(x,y) = g(x)\cdot h(y)$$

### 🔢 Example — Cylinder (Height & Radius)

$$f_{X,Y}(x,y) = \frac{3}{8}\frac{x}{y^2}, \quad 1 \leq x \leq 3,\ \frac{1}{2} \leq y \leq \frac{3}{4}$$

Can we factor this? Yes: $\frac{3}{8}\frac{x}{y^2} = \underbrace{(x)}_{\text{fn of }x} \cdot \underbrace{\left(\frac{3}{8y^2}\right)}_{\text{fn of }y}$
The support is a rectangle ✓ → **X and Y are independent.**

### Properties of Independent Variables

If X and Y are independent:
1. $E(Y \mid X = x) = E(Y)$ — conditional mean equals unconditional mean
2. $g(X)$ and $h(Y)$ are independent for any functions g, h
3. $E[g(X)\cdot h(Y)] = E[g(X)]\cdot E[h(Y)]$ — **expectations multiply**

### iid Random Variables

If $X_1, \ldots, X_n$ are all **independent** and all have the **same distribution**, they are called **i.i.d.** (independent and identically distributed).
This is the foundation of most statistical inference.

---

## 7. Expected Value of Functions of Joint Variables

### Formulas

**Discrete:**
$$E[h(X,Y)] = \sum_{x}\sum_{y} h(x,y)\, p_{X,Y}(x,y)$$

**Continuous:**
$$E[h(X,Y)] = \int_{-\infty}^{\infty}\int_{-\infty}^{\infty} h(x,y)\, f_{X,Y}(x,y)\, dx\, dy$$

### Linearity of Expectation

> [!success] This works for **any** random variables — no independence needed!

$$E(a_1X_1 + a_2X_2 + \cdots + a_nX_n) = a_1E(X_1) + a_2E(X_2) + \cdots + a_nE(X_n)$$

### Special Results

**Result 2:** If $X_1, \ldots, X_n$ all have the same mean $\mu$:
$$E\!\left(\sum_{i=1}^n X_i\right) = n\mu \qquad E(\bar{X}) = \mu$$

> The sample mean $\bar{X}$ is an **unbiased estimator** of the population mean $\mu$.

**Result 3:** If $X_1, \ldots, X_n \overset{iid}{\sim} \text{Bern}(p)$, then $E(\hat{p}) = p$

> The sample proportion is an unbiased estimator of the true probability p.

### 🔢 Example — Admissions Index

Index = 10 × ACT + 100 × GPA, with $E(\text{ACT}) = 29$, $E(\text{GPA}) = 3.72$:

$$E(\text{Index}) = 10 \times 29 + 100 \times 3.72 = 290 + 372 = \mathbf{662}$$

---

## 8. Covariance

> [!question] Motivation
> Is $\text{Var}(X + Y) = \text{Var}(X) + \text{Var}(Y)$? **Only if X and Y are independent!** When they're dependent, we need the **covariance**.

### Definition

$$\text{Cov}(X, Y) = \sigma_{X,Y} = E[(X - \mu_X)(Y - \mu_Y)] = E(XY) - \mu_X\mu_Y$$

**Computational shortcut:** $\text{Cov}(X,Y) = E(XY) - E(X)\cdot E(Y)$

### Interpretation

| Sign | Meaning |
|------|---------|
| $\text{Cov}(X,Y) > 0$ | X and Y tend to move in the **same direction** (positive relationship) |
| $\text{Cov}(X,Y) < 0$ | X and Y tend to move in **opposite directions** (negative relationship) |
| $\text{Cov}(X,Y) = 0$ | No **linear** relationship (but could still be nonlinearly dependent) |

### Properties of Covariance

1. $\text{Cov}(X, Y) = \text{Cov}(Y, X)$ — symmetric
2. $\text{Cov}(X, X) = \text{Var}(X)$ — covariance with itself is variance
3. $\text{Cov}(X, c) = 0$ — covariance with a constant is zero
4. If X and Y are independent → $\text{Cov}(X, Y) = 0$ *(but NOT the reverse!)*
5. $\text{Cov}(aX + b,\ cY + d) = ac\cdot\text{Cov}(X, Y)$
6. $\text{Cov}(X_1 + X_2,\ Y_1 + Y_2) = \text{Cov}(X_1,Y_1) + \text{Cov}(X_1,Y_2) + \text{Cov}(X_2,Y_1) + \text{Cov}(X_2,Y_2)$

---

## 9. Variance of Sums

### Two Variables

| Condition | Formula |
|-----------|---------|
| **Independent** | $\text{Var}(X_1 \pm X_2) = \sigma_1^2 + \sigma_2^2$ |
| **Dependent** | $\text{Var}(X_1 + X_2) = \sigma_1^2 + \sigma_2^2 + 2\text{Cov}(X_1, X_2)$ |
| **Dependent** | $\text{Var}(X_1 - X_2) = \sigma_1^2 + \sigma_2^2 - 2\text{Cov}(X_1, X_2)$ |

> [!warning] Common Mistake
> When subtracting **dependent** variables, the variances still ADD — but you subtract the covariance term. Variances are always positive!

### General Formula (n variables)

$$\text{Var}(a_1X_1 + \cdots + a_nX_n) = \sum_i a_i^2\sigma_i^2 + \sum_i\sum_{j \neq i} a_ia_j\text{Cov}(X_i, X_j)$$

### For iid Variables

**Result 1:** If $X_1, \ldots, X_n$ are iid with variance $\sigma^2$:
$$\text{Var}\!\left(\sum_{i=1}^n X_i\right) = n\sigma^2 \qquad \text{Var}(\bar{X}) = \frac{\sigma^2}{n}$$

> As $n$ increases, the variance of the sample mean **shrinks** — the more data you have, the more precise your estimate.

**Result 2:** If $X_1, \ldots, X_n \overset{iid}{\sim} \text{Bern}(p)$:
$$\text{Var}(\hat{p}) = \frac{p(1-p)}{n}$$

---

## 10. Pearson's Correlation Coefficient

> [!tip] Why Not Just Use Covariance?
> Covariance depends on the **units** of measurement. Double the scale of X, and Cov doubles. Correlation fixes this by **standardizing** — it's always between −1 and 1.

### Definition

$$\rho_{X,Y} = \text{Corr}(X,Y) = \frac{\text{Cov}(X,Y)}{\sigma_X \cdot \sigma_Y}$$

### Properties

| Property | Details |
|----------|---------|
| Range | $-1 \leq \text{Corr}(X,Y) \leq 1$ |
| Independent → | $\text{Corr}(X,Y) = 0$ *(but 0 ≠ independent!)* |
| Perfect linear | $\text{Corr} = \pm 1$ iff $Y = aX + b$ exactly |
| Scale-invariant | $\text{Corr}(aX+b,\ cY+d) = \text{sign}(ac)\cdot\text{Corr}(X,Y)$ |

> [!warning] Important Caution
> **Correlation = 0 does NOT mean independence.** It only means no *linear* relationship. There could still be a curved (nonlinear) relationship.

### Visual Guide to Correlation

| ρ ≈ +1 | ρ ≈ −1 | ρ ≈ 0 | ρ = 0, but dependent |
|--------|--------|-------|----------------------|
| Tight upward line | Tight downward line | Scattered cloud | U-shape or other curve |

---

## 11. Sample Covariance and Correlation

When you have **actual data** $(x_1,y_1), \ldots, (x_n,y_n)$, use:

### Sample Covariance

$$S_{X,Y} = \frac{1}{n-1}\sum_{i=1}^n (X_i - \bar{X})(Y_i - \bar{Y})$$

### Sample Correlation

$$r_{X,Y} = \frac{S_{X,Y}}{S_X \cdot S_Y}$$

### In R

```r
cov(x, y)    # sample covariance
cor(x, y)    # sample correlation coefficient
```

### 🔢 Example

```
x: 10  11  18  16  21
y:  9   7   4  11   8
```

```r
> cov(x, y)
[1] -2.45
> cor(x, y)
[1] -0.2031884
```

The negative covariance/correlation indicates a weak negative linear relationship between x and y.

---

## Quick Reference Summary

| Concept | Discrete | Continuous |
|---------|----------|-----------|
| Joint distribution | $p_{X,Y}(x,y)$ | $f_{X,Y}(x,y)$ |
| Marginal of X | $\sum_y p_{X,Y}(x,y)$ | $\int f_{X,Y}(x,y)\,dy$ |
| Conditional Y\|X=x | $p_{X,Y}(x,y)\,/\,p_X(x)$ | $f_{X,Y}(x,y)\,/\,f_X(x)$ |
| Independence test | $p_{X,Y} = p_X \cdot p_Y$ | $f_{X,Y} = f_X \cdot f_Y$ |

| Formula | Expression |
|---------|-----------|
| Covariance | $E(XY) - E(X)E(Y)$ |
| Var of sum (independent) | $\sigma_X^2 + \sigma_Y^2$ |
| Var of sum (dependent) | $\sigma_X^2 + \sigma_Y^2 + 2\text{Cov}(X,Y)$ |
| Correlation | $\text{Cov}(X,Y)\,/\,(\sigma_X\sigma_Y)$ |
| $\text{Var}(\bar{X})$ for iid | $\sigma^2/n$ |

---

*Source: SDS3020 Chapter 4 lecture notes*
