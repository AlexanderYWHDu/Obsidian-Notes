---
title: "SDS3020 — Ch3–7 Integrated Practice Problems"
tags:
  - SDS3020
  - statistics
  - probability
  - practice
aliases:
  - SDS3020 Practice
date: 2026-03-30
---

# SDS3020 — Chapters 3–7: Integrated Practice Problems

> [!abstract] Purpose
> These problems are designed to **build on each other**, showing how the same scenario flows through Ch3 → Ch4 → Ch5 → Ch6 → Ch7. Special emphasis on Ch5–7.
>
> **Structure:** Three mega-problems, each traversing multiple chapters. Detailed solutions included.

---

# Problem Set A — Battery Factory

> [!info] Scenario
> A factory produces batteries. Each battery's lifetime (in hundreds of hours) follows an **Exponential** distribution with unknown rate parameter $\lambda$. A quality engineer takes a random sample of $n = 50$ batteries and records their lifetimes.

---

## A1. (Ch3) Setting Up the Model

The engineer believes the average battery life is 500 hours, i.e., $E(X_i) = 5$ (in hundreds of hours).

**(a)** What is $\lambda$?

**(b)** What is $\text{Var}(X_i)$?

**(c)** What is $P(X_i > 3)$? (i.e., a battery lasts more than 300 hours)

**(d)** The exponential distribution has the memoryless property. In plain English, what does $P(X > 8 \mid X > 5) = P(X > 3)$ mean for this problem?

> [!success]- Solution
> **(a)** For $\text{Exp}(\lambda)$: $E(X) = 1/\lambda$. So $1/\lambda = 5 \Rightarrow \boxed{\lambda = 0.2}$.
>
> **(b)** $\text{Var}(X) = 1/\lambda^2 = 1/0.04 = \boxed{25}$. So $\sigma = 5$.
>
> **(c)** $P(X > 3) = 1 - F_X(3) = 1 - (1 - e^{-0.2 \times 3}) = e^{-0.6} \approx \boxed{0.5488}$.
>
> **(d)** "A battery that has already survived 500 hours is just as likely to last another 300+ hours as a brand new battery. The past doesn't affect the future." This is the memoryless property.

---

## A2. (Ch4) Two Batteries Together

Two batteries $X_1$ and $X_2$ are independently drawn from the production line, both $\text{Exp}(0.2)$.

**(a)** Write the joint PDF $f_{X_1, X_2}(x_1, x_2)$. Are they independent?

**(b)** Let $T = X_1 + X_2$ (total lifetime of using both batteries sequentially). Find $E(T)$ and $\text{Var}(T)$.

**(c)** If $Y = X_1 - X_2$ (the difference in lifetimes), find $E(Y)$ and $\text{Var}(Y)$.

> [!success]- Solution
> **(a)** Since $X_1$ and $X_2$ are independent:
> $$f_{X_1,X_2}(x_1,x_2) = f_{X_1}(x_1) \cdot f_{X_2}(x_2) = 0.2e^{-0.2x_1} \cdot 0.2e^{-0.2x_2} = 0.04\,e^{-0.2(x_1+x_2)}$$
> for $x_1 \geq 0, x_2 \geq 0$. This factors as $g(x_1)\cdot h(x_2)$ over a rectangular support $\Rightarrow$ **yes, independent** ✓ (as stated).
>
> **(b)** By linearity of expectation:
> $$E(T) = E(X_1) + E(X_2) = 5 + 5 = \boxed{10}$$
> Since $X_1, X_2$ are **independent**, variances add:
> $$\text{Var}(T) = \text{Var}(X_1) + \text{Var}(X_2) = 25 + 25 = \boxed{50}$$
>
> **(c)** $E(Y) = E(X_1) - E(X_2) = 5 - 5 = \boxed{0}$
>
> $\text{Var}(Y) = \text{Var}(X_1) + \text{Var}(X_2) = 25 + 25 = \boxed{50}$
>
> > [!warning] Key Point
> > Variances **ADD** even when subtracting! $\text{Var}(X_1 - X_2) = \sigma_1^2 + \sigma_2^2$ (when independent). The difference of two RVs is just as "spread out" as the sum.

---

## A3. (Ch5) The Sample Mean — CLT in Action ⭐

The engineer measures $n = 50$ batteries. Let $\bar{X}$ be the sample mean lifetime.

**(a)** Is the population (Exponential) normally distributed? Does that matter for describing $\bar{X}$?

**(b)** Use the CLT to find the approximate distribution of $\bar{X}$.

**(c)** Find $P(\bar{X} > 6)$ — the probability the sample mean exceeds 600 hours.

**(d)** Find the 95th percentile of $\bar{X}$.

> [!success]- Solution
> **(a)** Exponential is **not** normal — it's right-skewed. But $n = 50 \geq 30$, so by the CLT, $\bar{X}$ is **approximately normal** regardless. **This is exactly why the CLT is powerful — it doesn't care about the original shape.**
>
> **(b)** By the CLT:
> $$\bar{X} \;\dot{\sim}\; N\!\left(\mu,\; \frac{\sigma^2}{n}\right) = N\!\left(5,\; \frac{25}{50}\right) = N(5,\; 0.5)$$
> So $\sigma_{\bar{X}} = \sqrt{0.5} \approx 0.7071$.
>
> > [!tip] What just happened?
> > The individual $X_i$ has $\mu = 5, \sigma = 5$ (huge spread!). But the sample mean $\bar{X}$ has $\mu = 5, \sigma_{\bar{X}} = 0.707$ (much tighter). Averaging 50 observations **shrinks the variability** by a factor of $\sqrt{50} \approx 7$.
>
> **(c)** Standardize:
> $$P(\bar{X} > 6) = P\!\left(Z > \frac{6 - 5}{0.7071}\right) = P(Z > 1.414) = 1 - \Phi(1.414) \approx 1 - 0.9213 = \boxed{0.0787}$$
>
> **(d)** The 95th percentile of $Z$ is $z_{0.05} = 1.645$. Back-transform:
> $$\bar{X}_{0.95} = \mu + z_{0.05}\cdot\sigma_{\bar{X}} = 5 + 1.645 \times 0.7071 \approx \boxed{6.163}$$

---

## A4. (Ch6) Estimating $\lambda$ from Data ⭐

The 50 batteries are measured and yield $\bar{x} = 4.8$ (480 hours average) and $s^2 = 22.1$.

**(a)** Find the Method of Moments estimator $\hat{\lambda}_{MoM}$ and compute the estimate.

**(b)** Find the MLE $\hat{\lambda}_{MLE}$ and compute the estimate.

**(c)** Is $\bar{X}$ an unbiased estimator of $\mu = 1/\lambda$?

> [!success]- Solution
> **(a)** For $\text{Exp}(\lambda)$: $E(X) = 1/\lambda$. MoM sets $E(X) = \bar{X}$:
> $$\frac{1}{\lambda} = \bar{X} \implies \hat{\lambda}_{MoM} = \frac{1}{\bar{X}}$$
> Estimate: $\hat{\lambda} = 1/4.8 \approx \boxed{0.2083}$
>
> **(b)** The likelihood for iid $\text{Exp}(\lambda)$:
> $$L(\lambda) = \prod_{i=1}^n \lambda e^{-\lambda x_i} = \lambda^n e^{-\lambda \sum x_i}$$
>
> Log-likelihood:
> $$\ell(\lambda) = n\ln\lambda - \lambda\sum x_i$$
>
> Differentiate and set to zero:
> $$\ell'(\lambda) = \frac{n}{\lambda} - \sum x_i = 0 \implies \hat{\lambda}_{MLE} = \frac{n}{\sum x_i} = \frac{1}{\bar{X}}$$
>
> **MoM and MLE give the same answer here!** $\hat{\lambda}_{MLE} = 1/4.8 \approx \boxed{0.2083}$
>
> > [!tip] Why did MoM = MLE?
> > This happens for exponential family distributions when the sufficient statistic is the sample mean. It's a nice coincidence — it doesn't always happen (e.g., Uniform distribution).
>
> **(c)** Yes! $E(\bar{X}) = \mu = 1/\lambda$ by linearity of expectation. So $\bar{X}$ is **unbiased** for $\mu$.
>
> **But note:** $\hat{\lambda} = 1/\bar{X}$ is a **biased** estimator of $\lambda$ (because $E(1/\bar{X}) \neq 1/E(\bar{X})$ by Jensen's inequality). However, the bias vanishes as $n \to \infty$.

---

## A5. (Ch7) Confidence Interval for Mean Battery Life ⭐

Using the same data ($n = 50$, $\bar{x} = 4.8$, $s = \sqrt{22.1} \approx 4.7$):

**(a)** Construct a **95% T confidence interval** for $\mu = E(X_i)$ (the true mean lifetime).

**(b)** Interpret this interval in context.

**(c)** The manufacturer claims battery life averages 500 hours ($\mu = 5$). Does your CI support or contradict this claim?

**(d)** How large a sample would be needed for a 95% CI of **length 1** (i.e., ±0.5)?

> [!success]- Solution
> **(a)** Since $\sigma^2$ is unknown, use a T interval:
> $$\bar{X} \pm t_{n-1,\,\alpha/2}\cdot\frac{S}{\sqrt{n}}$$
>
> Find the critical value: $t_{49,\,0.025} \approx 2.010$ (from R: `qt(0.975, 49)`)
>
> $$4.8 \pm 2.010 \times \frac{4.7}{\sqrt{50}} = 4.8 \pm 2.010 \times 0.6648 = 4.8 \pm 1.336$$
>
> $$\boxed{(3.464,\; 6.136)}$$
>
> In hundreds of hours: **(346.4 hours, 613.6 hours)**
>
> **(b)** "We are 95% confident that the true average battery lifetime is between 346 and 614 hours."
>
> > [!warning] Common Misinterpretation
> > **Wrong:** "There is a 95% probability $\mu$ is in (3.464, 6.136)."
> > **Right:** "If we repeated this experiment many times, about 95% of the resulting intervals would contain the true $\mu$." The true $\mu$ is **fixed** — it's the interval that's random (before data is observed).
>
> **(c)** $\mu = 5$ lies **inside** the interval $(3.464, 6.136)$. So the data is **consistent** with the manufacturer's claim. We cannot reject it at the 5% significance level.
>
> **(d)** Length $L = 1$, so MOE $= 0.5$. Using the $z$ approximation for sample size planning:
> $$n \geq \left(\frac{2 z_{\alpha/2} \cdot S_{pr}}{L}\right)^2 = \left(\frac{2 \times 1.96 \times 4.7}{1}\right)^2 = (18.424)^2 \approx 339.4$$
>
> Round up: $\boxed{n = 340}$ batteries needed.
>
> > [!tip] Why so large?
> > The exponential distribution has a huge variance ($\sigma^2 = 25$), so you need a lot of data to pin down the mean precisely. This illustrates: **high variability → need more data**.

---

# Problem Set B — Election Polling

> [!info] Scenario
> A polling firm wants to estimate $p$, the proportion of voters who support Candidate A. They survey $n$ randomly selected voters.

---

## B1. (Ch3) Individual Voter as a Bernoulli Trial

Let $X_i = 1$ if voter $i$ supports Candidate A, $X_i = 0$ otherwise. Suppose the true $p = 0.55$.

**(a)** What is the distribution of $X_i$? Find $E(X_i)$ and $\text{Var}(X_i)$.

**(b)** Let $T = \sum_{i=1}^{400} X_i$ be the total number of supporters in a sample of 400. What is the distribution of $T$?

> [!success]- Solution
> **(a)** $X_i \sim \text{Bern}(0.55)$. $E(X_i) = 0.55$. $\text{Var}(X_i) = 0.55 \times 0.45 = \boxed{0.2475}$.
>
> **(b)** $T = \sum_{i=1}^{400} X_i \sim \text{Bin}(400,\; 0.55)$. $E(T) = 220$. $\text{Var}(T) = 400 \times 0.2475 = 99$.

---

## B2. (Ch5) Normal Approximation to the Binomial ⭐

Using $T \sim \text{Bin}(400, 0.55)$:

**(a)** Check: is the normal approximation valid?

**(b)** Use the normal approximation (with continuity correction) to find $P(T \geq 230)$.

**(c)** Express the same calculation in terms of the **sample proportion** $\hat{p} = T/n$. What is the approximate distribution of $\hat{p}$?

> [!success]- Solution
> **(a)** $np = 220 \geq 5$ ✓ and $n(1-p) = 180 \geq 5$ ✓. Approximation is valid.
>
> **(b)** $T \;\dot{\sim}\; N(220, 99)$, so $\sigma_T = \sqrt{99} \approx 9.95$.
>
> With continuity correction ($T \geq 230 \Rightarrow Y \geq 229.5$):
> $$P(T \geq 230) \approx P\!\left(Z \geq \frac{229.5 - 220}{9.95}\right) = P(Z \geq 0.955) = 1 - \Phi(0.955) \approx 1 - 0.8302 = \boxed{0.170}$$
>
> **(c)** $\hat{p} = T/n$. Since $T \;\dot{\sim}\; N(np,\; np(1-p))$, dividing by $n$:
> $$\hat{p} \;\dot{\sim}\; N\!\left(p,\; \frac{p(1-p)}{n}\right) = N\!\left(0.55,\; \frac{0.2475}{400}\right) = N(0.55,\; 0.000619)$$
>
> So $\sigma_{\hat{p}} = \sqrt{0.000619} \approx 0.0249$.
>
> > [!tip] **The deep connection: CLT IS the normal approximation to the Binomial**
> > The "normal approximation to the Binomial" (Ch5) is not a separate technique — it's literally the CLT applied to the sum of Bernoulli RVs!
> > - Each $X_i \sim \text{Bern}(p)$ with $\mu = p$, $\sigma^2 = p(1-p)$
> > - $T = \sum X_i$ → CLT says $T \;\dot{\sim}\; N(np, np(1-p))$ ← this is the DeMoivre–Laplace theorem
> > - $\hat{p} = T/n$ → CLT says $\hat{p} \;\dot{\sim}\; N(p, p(1-p)/n)$ ← this is what we use for CIs in Ch7

---

## B3. (Ch6) Estimation ⭐

The poll of $n = 400$ voters finds 236 supporters, so $\hat{p} = 236/400 = 0.59$.

**(a)** Show that $\hat{p}$ is a Method of Moments estimator of $p$.

**(b)** Show that $\hat{p}$ is also the MLE of $p$.

**(c)** Is $\hat{p}$ unbiased? What is its standard error?

**(d)** What is the MSE of $\hat{p}$?

> [!success]- Solution
> **(a)** MoM: set $E(X_i) = \bar{X}$. Since $E(X_i) = p$ and $\bar{X} = \hat{p}$:
> $$p = \hat{p} \implies \hat{p}_{MoM} = \hat{p} \quad ✓$$
>
> **(b)** Likelihood: $L(p) = \prod p^{x_i}(1-p)^{1-x_i} = p^{\sum x_i}(1-p)^{n - \sum x_i}$
>
> Log-likelihood: $\ell(p) = \left(\sum x_i\right)\ln p + \left(n - \sum x_i\right)\ln(1-p)$
>
> $$\ell'(p) = \frac{\sum x_i}{p} - \frac{n - \sum x_i}{1-p} = 0$$
>
> Solving: $\hat{p}_{MLE} = \frac{\sum x_i}{n} = \hat{p} \quad ✓$
>
> **(c)** $E(\hat{p}) = p$ ✓ (unbiased, from Ch4 Result 3).
>
> Standard error: $\sigma_{\hat{p}} = \sqrt{\frac{p(1-p)}{n}}$
>
> Since $p$ is unknown, the **estimated** standard error is:
> $$S_{\hat{p}} = \sqrt{\frac{\hat{p}(1-\hat{p})}{n}} = \sqrt{\frac{0.59 \times 0.41}{400}} = \sqrt{0.000605} \approx \boxed{0.0246}$$
>
> **(d)** Since $\hat{p}$ is unbiased: $\text{MSE}(\hat{p}) = \text{Var}(\hat{p}) + \text{bias}^2 = \text{Var}(\hat{p}) = \dfrac{p(1-p)}{n}$.
>
> > [!tip] The whole Ch6 story in one sentence
> > We started with $X_i \sim \text{Bern}(p)$ in Ch3, computed $\text{Var}(\hat{p}) = p(1-p)/n$ in Ch4, and now Ch6 tells us that $\hat{p}$ is the "best" estimator: it's both MoM and MLE, unbiased, and has MSE equal to its variance.

---

## B4. (Ch7) Confidence Interval for $p$ ⭐

**(a)** Construct a **95% confidence interval** for $p$ using the poll result $\hat{p} = 0.59$.

**(b)** Can we confidently say Candidate A has more than 50% support?

**(c)** The polling firm wants to report results with a **margin of error of ±2%** (MOE = 0.02) at 95% confidence. How many voters must they survey?

**(d)** If they can only afford to survey 600 voters, what confidence level would give a MOE of 0.03?

> [!success]- Solution
> **(a)** 95% Z CI for $p$:
> $$\hat{p} \pm z_{\alpha/2}\sqrt{\frac{\hat{p}(1-\hat{p})}{n}} = 0.59 \pm 1.96 \times 0.0246 = 0.59 \pm 0.048$$
>
> $$\boxed{(0.542,\; 0.638)}$$
>
> **(b)** The **entire interval** is above 0.50. So yes — we are 95% confident that Candidate A has majority support.
>
> > [!tip] This is how election predictions work
> > Pollsters construct a CI for $p$. If the CI is entirely above 0.5, they can "call" the election for Candidate A at that confidence level. If 0.5 is inside the CI, it's "too close to call."
>
> **(c)** Use the sample size formula with $\hat{p}_{pr} = 0.59$, $L = 2 \times 0.02 = 0.04$:
> $$n \geq \frac{4 z_{\alpha/2}^2\, \hat{p}_{pr}(1-\hat{p}_{pr})}{L^2} = \frac{4 \times 1.96^2 \times 0.59 \times 0.41}{0.04^2} = \frac{4 \times 3.8416 \times 0.2419}{0.0016} = \frac{3.718}{0.0016} \approx 2324$$
>
> $\boxed{n = 2324}$ voters. (This is why national polls survey ~2000+ people!)
>
> **(d)** We need: $z_{\alpha/2}\sqrt{\hat{p}(1-\hat{p})/600} = 0.03$.
> $$z_{\alpha/2} = \frac{0.03}{\sqrt{0.59 \times 0.41 / 600}} = \frac{0.03}{0.02008} \approx 1.494$$
>
> From the $Z$ table: $\Phi(1.494) \approx 0.9325$, so $\alpha/2 \approx 0.0675$, $\alpha \approx 0.135$.
>
> Confidence level $\approx \boxed{86.5\%}$.

---

# Problem Set C — The Complete Pipeline (Final Boss)

> [!info] Scenario
> A coffee chain measures the caffeine content (mg) of their espresso shots. Caffeine content varies from shot to shot. The chain claims the average is $\mu = 63$ mg with $\sigma = 8$ mg.

---

## C1. (Ch3 → Ch5) From Single Shots to Sample Means

**(a)** (Ch3) If caffeine is approximately normally distributed with $\mu = 63, \sigma = 8$, find $P(X > 75)$ for a single shot.

**(b)** (Ch5) A quality inspector tests $n = 36$ shots. What is the **exact** distribution of $\bar{X}$?

**(c)** (Ch5) Find $P(\bar{X} > 65)$. Compare this to $P(X > 65)$ for a single shot.

> [!success]- Solution
> **(a)** $Z = (75 - 63)/8 = 1.5$. $P(X > 75) = 1 - \Phi(1.5) = 1 - 0.9332 = \boxed{0.0668}$
>
> **(b)** Population is Normal, so $\bar{X} \sim N(\mu, \sigma^2/n)$ **exactly** (no CLT approximation needed):
> $$\bar{X} \sim N\!\left(63,\; \frac{64}{36}\right) = N(63,\; 1.778)$$
> $\sigma_{\bar{X}} = 8/\sqrt{36} = 8/6 \approx 1.333$
>
> **(c)** For $\bar{X}$: $Z = (65 - 63)/1.333 = 1.50$. $P(\bar{X} > 65) = 1 - \Phi(1.50) = \boxed{0.0668}$
>
> For a single shot: $Z = (65 - 63)/8 = 0.25$. $P(X > 65) = 1 - \Phi(0.25) = 1 - 0.5987 = \boxed{0.4013}$
>
> > [!tip] Key Insight: Averaging Concentrates Probability
> > A single shot has a 40% chance of exceeding 65 mg — no big deal.
> > But the **average of 36 shots** only has a 6.7% chance of exceeding 65 mg — that would be surprising.
> >
> > **Same $Z$-score, different scales.** The sample mean has $\sigma/\sqrt{n} = 1.33$ instead of $\sigma = 8$. This is why hypothesis testing works: if $\bar{X}$ is far from 63, that's strong evidence.

---

## C2. (Ch4) Two Locations

The chain has two locations. Let $X$ = caffeine from Location 1 ($\mu_1 = 63, \sigma_1 = 8$) and $Y$ = caffeine from Location 2 ($\mu_2 = 60, \sigma_2 = 6$). Assume $X$ and $Y$ are independent and normal.

**(a)** Find the distribution of $D = X - Y$ (difference in a single shot from each).

**(b)** Find $P(X > Y)$, i.e., $P(D > 0)$.

**(c)** If $\text{Cov}(X, Y) = 10$ (say they share a supplier so they're correlated), what is $\text{Var}(D)$ now?

> [!success]- Solution
> **(a)** $D = X - Y$ is a linear combination of independent normals:
> $$D \sim N(\mu_1 - \mu_2,\; \sigma_1^2 + \sigma_2^2) = N(3,\; 64 + 36) = N(3,\; 100)$$
> $\sigma_D = 10$.
>
> **(b)** $P(D > 0) = P\!\left(Z > \frac{0 - 3}{10}\right) = P(Z > -0.3) = \Phi(0.3) = \boxed{0.6179}$
>
> Location 1 tends to give more caffeine, but it's only slightly better than a coin flip.
>
> **(c)** When dependent:
> $$\text{Var}(X - Y) = \sigma_X^2 + \sigma_Y^2 - 2\text{Cov}(X,Y) = 64 + 36 - 2(10) = \boxed{80}$$
>
> The positive covariance **reduces** the variance of the difference — when both move together, the gap between them is more stable.

---

## C3. (Ch6 → Ch7) The Full Estimation Pipeline ⭐⭐

Now suppose the true $\mu$ and $\sigma$ are **unknown**. The inspector measures $n = 36$ shots and gets:

$$\bar{x} = 65.2, \quad s = 9.1$$

**(a)** (Ch6) Find the MoM estimate and MLE of $\mu$ for a normal population. Are they the same?

**(b)** (Ch6) Find the estimated standard error of $\bar{X}$.

**(c)** (Ch7) Construct a **90% T confidence interval** for $\mu$.

**(d)** (Ch7) The chain claims $\mu = 63$ mg. Does your 90% CI contain 63? What does this mean?

**(e)** (Ch7) Construct a **95% CI for $\sigma^2$**.

> [!success]- Solution
> **(a)** For $N(\mu, \sigma^2)$: $E(X) = \mu$. MoM sets $\mu = \bar{X}$, giving $\hat{\mu}_{MoM} = \bar{X} = 65.2$.
>
> For MLE: the log-likelihood of $N(\mu, \sigma^2)$ is maximized at $\hat{\mu} = \bar{X}$.
>
> **Yes, they're the same:** $\hat{\mu} = \bar{X} = \boxed{65.2}$ mg.
>
> **(b)** Estimated standard error:
> $$S_{\bar{X}} = \frac{S}{\sqrt{n}} = \frac{9.1}{\sqrt{36}} = \frac{9.1}{6} = \boxed{1.517}$$
>
> **(c)** 90% T CI ($\alpha = 0.10$, $df = 35$):
>
> Critical value: $t_{35,\,0.05} = 1.690$ (R: `qt(0.95, 35)`)
>
> $$65.2 \pm 1.690 \times 1.517 = 65.2 \pm 2.564$$
>
> $$\boxed{(62.636,\; 67.764)}$$
>
> **(d)** $\mu = 63$ **is inside** the interval $(62.636, 67.764)$, but just barely. The CI does contain the claimed value, so at the 10% significance level we cannot reject the claim. However, the sample mean (65.2) is notably above 63 — this is suggestive but not conclusive with $n = 36$.
>
> **(e)** $\chi^2$ CI for $\sigma^2$ (requires normality):
>
> $$\left(\frac{(n-1)S^2}{\chi^2_{n-1,\,\alpha/2}},\; \frac{(n-1)S^2}{\chi^2_{n-1,\,1-\alpha/2}}\right)$$
>
> $(n-1)S^2 = 35 \times 82.81 = 2898.35$
>
> $\chi^2_{35,\,0.025} = 53.203$ and $\chi^2_{35,\,0.975} = 20.569$ (from R: `qchisq(0.975,35)` and `qchisq(0.025,35)`)
>
> $$\left(\frac{2898.35}{53.203},\; \frac{2898.35}{20.569}\right) = \boxed{(54.48,\; 140.91)}$$
>
> For $\sigma$: $(\sqrt{54.48},\; \sqrt{140.91}) = (7.38,\; 11.87)$
>
> The claimed $\sigma = 8$ (so $\sigma^2 = 64$) is inside this interval ✓.

---

# Key Takeaways: How Ch3–7 Connect

> [!success] The Statistical Pipeline
>
> **Step 1 — Model** (Ch3): Identify the distribution. Get $E(X)$, $\text{Var}(X)$.
> *"Each battery life follows $\text{Exp}(\lambda)$ with mean $1/\lambda$ and variance $1/\lambda^2$."*
>
> **Step 2 — Analyze Jointly** (Ch4): If multiple RVs, find joint behavior, covariance.
> *"Two independent batteries: $\text{Var}(X_1 - X_2) = \sigma_1^2 + \sigma_2^2$."*
>
> **Step 3 — Apply CLT** (Ch5): For large $n$, $\bar{X} \;\dot{\sim}\; N(\mu, \sigma^2/n)$.
> *"50 batteries: $\bar{X} \approx N(5, 0.5)$ even though individual lifetimes are skewed."*
>
> **Step 4 — Estimate** (Ch6): Use MoM or MLE to get $\hat{\theta}$. Check unbiasedness, compute SE.
> *"$\hat{\lambda} = 1/\bar{X} = 0.208$. Standard error = ..."*
>
> **Step 5 — Quantify Uncertainty** (Ch7): Build a CI around $\hat{\theta}$ using the CLT-based sampling distribution.
> *"95% CI for $\mu$: $(3.46, 6.14)$. The claim $\mu = 5$ is inside — consistent."*

---

## Ch5–7 "Which Formula?" Quick Decision Tree

```
What are you estimating?
├── A proportion p?
│   ├── Point estimate: p̂ = X/n (Ch6)
│   ├── SE: √(p̂(1-p̂)/n) (Ch4 → Ch6)
│   └── CI: p̂ ± z·SE (Ch7, Z-interval)
│       └── Valid when np̂ ≥ 8 and n(1-p̂) ≥ 8
│
├── A mean μ?
│   ├── Point estimate: X̄ (Ch6)
│   ├── σ known? → Z-interval: X̄ ± z·σ/√n (Ch7)
│   └── σ unknown? → T-interval: X̄ ± t·S/√n (Ch7)
│       └── df = n - 1
│
└── A variance σ²?
    ├── Point estimate: S² (Ch6)
    └── CI: ((n-1)S²/χ²_upper, (n-1)S²/χ²_lower) (Ch7)
        └── Requires normality!
```

---

*Companion to: [[SDS3020 — Chapters 3–7 Complete Guide]]*
