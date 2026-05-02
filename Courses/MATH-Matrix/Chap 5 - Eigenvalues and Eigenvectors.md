# Chapter 5: Eigenvalues and Eigenvectors

> **Source**: *Linear Algebra and Its Applications*, 6th Global Edition --- Lay, Lay & McDonald

The goal of this chapter is to dissect the action of a linear transformation $\mathbf{x} \mapsto A\mathbf{x}$ into elements that are easily visualized. All matrices in the chapter are **square**. The main applications are to **discrete dynamical systems**, **differential equations**, and **Markov chains**.

---

## 5.1 Eigenvectors and Eigenvalues

### Core Definitions

> **Definition.** An **eigenvector** of an $n \times n$ matrix $A$ is a **nonzero** vector $\mathbf{x}$ such that $A\mathbf{x} = \lambda\mathbf{x}$ for some scalar $\lambda$. A scalar $\lambda$ is called an **eigenvalue** of $A$ if there is a nontrivial solution $\mathbf{x}$ of $A\mathbf{x} = \lambda\mathbf{x}$; such an $\mathbf{x}$ is called an *eigenvector corresponding to* $\lambda$.

**Key points:**
- An eigenvector **must** be nonzero, but an eigenvalue **may** be zero.
- $\lambda$ is an eigenvalue of $A$ $\iff$ the equation $(A - \lambda I)\mathbf{x} = \mathbf{0}$ has a nontrivial solution.
- The set of all solutions of $(A - \lambda I)\mathbf{x} = \mathbf{0}$ is the **null space** of $A - \lambda I$. This is a subspace of $\mathbb{R}^n$ called the **eigenspace** of $A$ corresponding to $\lambda$.

### Finding Eigenvectors (Given an Eigenvalue)

To find eigenvectors for a known eigenvalue $\lambda$:
1. Form the matrix $A - \lambda I$.
2. Row reduce the augmented matrix $[A - \lambda I \mid \mathbf{0}]$.
3. The nontrivial solutions are the eigenvectors.

> **Warning:** Row reduction can find eigenvectors, but it **cannot** be used directly to find eigenvalues. An echelon form of $A$ does **not** generally display the eigenvalues of $A$.

---

### Theorem 1 (Eigenvalues of Triangular Matrices)

> **Theorem 1.** The eigenvalues of a triangular matrix are the entries on its **main diagonal**.

**Proof.** Consider a $3 \times 3$ upper triangular matrix (the argument generalizes). Then:

$$A - \lambda I = \begin{bmatrix} a_{11} - \lambda & a_{12} & a_{13} \\ 0 & a_{22} - \lambda & a_{23} \\ 0 & 0 & a_{33} - \lambda \end{bmatrix}$$

The equation $(A - \lambda I)\mathbf{x} = \mathbf{0}$ has a free variable $\iff$ at least one diagonal entry of $A - \lambda I$ is zero $\iff$ $\lambda$ equals one of $a_{11}, a_{22}, a_{33}$.

For lower triangular matrices, use the fact that $\lambda$ is an eigenvalue of $A$ iff $\lambda$ is an eigenvalue of $A^T$ (Exercise 35), and $A^T$ is upper triangular. $\blacksquare$

**Example.** Let $A = \begin{bmatrix} 3 & 6 & 8 \\ 0 & 0 & 6 \\ 0 & 0 & 2 \end{bmatrix}$. The eigenvalues are $3, 0$, and $2$.

**Important consequence:** $0$ is an eigenvalue of $A$ $\iff$ $A\mathbf{x} = \mathbf{0}$ has a nontrivial solution $\iff$ $A$ is **not invertible**.

---

### Theorem 2 (Linear Independence of Eigenvectors)

> **Theorem 2.** If $\mathbf{v}_1, \dots, \mathbf{v}_r$ are eigenvectors that correspond to **distinct** eigenvalues $\lambda_1, \dots, \lambda_r$ of an $n \times n$ matrix $A$, then the set $\{\mathbf{v}_1, \dots, \mathbf{v}_r\}$ is **linearly independent**.

**Proof.** Suppose for contradiction that $\{\mathbf{v}_1, \dots, \mathbf{v}_r\}$ is linearly dependent. By Theorem 7 of Section 1.7, there exists a least index $p$ such that $\mathbf{v}_{p+1}$ is a linear combination of the preceding vectors:

$$c_1\mathbf{v}_1 + \cdots + c_p\mathbf{v}_p = \mathbf{v}_{p+1} \tag{5}$$

Multiply both sides by $A$ and use $A\mathbf{v}_k = \lambda_k\mathbf{v}_k$:

$$c_1\lambda_1\mathbf{v}_1 + \cdots + c_p\lambda_p\mathbf{v}_p = \lambda_{p+1}\mathbf{v}_{p+1} \tag{6}$$

Multiply (5) by $\lambda_{p+1}$ and subtract from (6):

$$c_1(\lambda_1 - \lambda_{p+1})\mathbf{v}_1 + \cdots + c_p(\lambda_p - \lambda_{p+1})\mathbf{v}_p = \mathbf{0} \tag{7}$$

Since $\{\mathbf{v}_1, \dots, \mathbf{v}_p\}$ is linearly independent, all weights in (7) are zero. But none of the factors $\lambda_i - \lambda_{p+1}$ are zero (eigenvalues are distinct), so $c_i = 0$ for all $i$. Then (5) gives $\mathbf{v}_{p+1} = \mathbf{0}$, contradicting that eigenvectors are nonzero. $\blacksquare$

---

### Eigenvectors and Difference Equations

The difference equation $\mathbf{x}_{k+1} = A\mathbf{x}_k$ describes a **discrete dynamical system**. If $\mathbf{x}_0$ is an eigenvector with eigenvalue $\lambda$, then:

$$\mathbf{x}_k = \lambda^k \mathbf{x}_0 \qquad (k = 1, 2, \dots)$$

More generally, if $\mathbf{u}, \mathbf{v}$ are eigenvectors with eigenvalues $\lambda, \mu$, then:

$$\mathbf{x}_k = c_1\lambda^k\mathbf{u} + c_2\mu^k\mathbf{v}$$

is also a solution of $\mathbf{x}_{k+1} = A\mathbf{x}_k$.

---

### Example Questions

**Q1.** Let $A = \begin{bmatrix} 1 & 5 \\ 6 & 2 \end{bmatrix}$, $\mathbf{u} = \begin{bmatrix} 6 \\ -5 \end{bmatrix}$. Is $\mathbf{u}$ an eigenvector of $A$?

**Solution.** Compute $A\mathbf{u} = \begin{bmatrix} 1 & 5 \\ 6 & 2 \end{bmatrix}\begin{bmatrix} 6 \\ -5 \end{bmatrix} = \begin{bmatrix} -24 \\ 20 \end{bmatrix} = -4\begin{bmatrix} 6 \\ -5 \end{bmatrix} = -4\mathbf{u}$.

Yes, $\mathbf{u}$ is an eigenvector with eigenvalue $\lambda = -4$.

**Q2.** Show that $\lambda = 7$ is an eigenvalue of $A = \begin{bmatrix} 1 & 5 \\ 6 & 2 \end{bmatrix}$ and find the corresponding eigenvectors.

**Solution.** Form $A - 7I = \begin{bmatrix} -6 & 5 \\ 6 & -5 \end{bmatrix}$. Row reduce:

$$\begin{bmatrix} -6 & 5 & 0 \\ 6 & -5 & 0 \end{bmatrix} \sim \begin{bmatrix} 1 & -5/6 & 0 \\ 0 & 0 & 0 \end{bmatrix}$$

There is a free variable ($x_2$ is free), so $\lambda = 7$ is an eigenvalue. The general solution is $x_2\begin{bmatrix} 5/6 \\ 1 \end{bmatrix}$, or equivalently $t\begin{bmatrix} 5 \\ 6 \end{bmatrix}$ for $t \neq 0$. The eigenspace is $\text{Span}\left\{\begin{bmatrix} 5 \\ 6 \end{bmatrix}\right\}$.

**Q3.** Is $\lambda = 5$ an eigenvalue of $A = \begin{bmatrix} 6 & 3 & 1 \\ 3 & 0 & 5 \\ 2 & 2 & 6 \end{bmatrix}$?

**Solution.** Form $A - 5I = \begin{bmatrix} 1 & 3 & 1 \\ 3 & -5 & 5 \\ 2 & 2 & 1 \end{bmatrix}$ and row reduce:

$$\begin{bmatrix} 1 & 3 & 1 & 0 \\ 3 & -5 & 5 & 0 \\ 2 & 2 & 1 & 0 \end{bmatrix} \sim \begin{bmatrix} 1 & 3 & 1 & 0 \\ 0 & 4 & -2 & 0 \\ 0 & 0 & 5 & 0 \end{bmatrix}$$

Every column has a pivot $\Rightarrow$ no free variables $\Rightarrow$ only the trivial solution. So $\lambda = 5$ is **not** an eigenvalue.

---

## 5.2 The Characteristic Equation

### The Key Idea

$\lambda$ is an eigenvalue of $A$ $\iff$ $(A - \lambda I)\mathbf{x} = \mathbf{0}$ has a nontrivial solution $\iff$ $A - \lambda I$ is **not** invertible $\iff$

$$\boxed{\det(A - \lambda I) = 0}$$

This is called the **characteristic equation** of $A$.

### The Characteristic Polynomial

If $A$ is $n \times n$, then $\det(A - \lambda I)$ is a **polynomial of degree $n$** in $\lambda$, called the **characteristic polynomial** of $A$.

The **(algebraic) multiplicity** of an eigenvalue $\lambda$ is its multiplicity as a root of the characteristic polynomial.

---

### Properties of Determinants (Theorem 3, for reference)

> **Theorem 3.** Let $A$ and $B$ be $n \times n$ matrices.
> - (a) $A$ is invertible $\iff$ $\det A \neq 0$.
> - (b) $\det(AB) = (\det A)(\det B)$.
> - (c) $\det(A^T) = \det A$.
> - (d) If $A$ is triangular, $\det A$ is the product of diagonal entries.
> - (e) Row replacement doesn't change det; row interchange flips sign; row scaling scales det.

### Invertible Matrix Theorem (continued)

> $A$ is invertible $\iff$ $0$ is **not** an eigenvalue of $A$.

---

### Example: Finding Eigenvalues of a $2 \times 2$ Matrix

**Q.** Find the eigenvalues of $A = \begin{bmatrix} 2 & 3 \\ 3 & -6 \end{bmatrix}$.

**Solution.**

$$\det(A - \lambda I) = \det\begin{bmatrix} 2 - \lambda & 3 \\ 3 & -6 - \lambda \end{bmatrix} = (2 - \lambda)(-6 - \lambda) - 9$$

$$= \lambda^2 + 4\lambda - 21 = (\lambda - 3)(\lambda + 7)$$

Setting this to zero: $\lambda = 3$ or $\lambda = -7$.

### Example: $4 \times 4$ Triangular Matrix

**Q.** Find the characteristic equation of $A = \begin{bmatrix} 5 & 2 & 6 & 1 \\ 0 & 3 & 8 & 0 \\ 0 & 0 & 5 & 4 \\ 0 & 0 & 0 & 1 \end{bmatrix}$.

**Solution.** Since $A$ is upper triangular, $A - \lambda I$ is also upper triangular with diagonal entries $5 - \lambda, 3 - \lambda, 5 - \lambda, 1 - \lambda$. Thus:

$$\det(A - \lambda I) = (5 - \lambda)(3 - \lambda)(5 - \lambda)(1 - \lambda) = (5 - \lambda)^2(3 - \lambda)(1 - \lambda) = 0$$

Eigenvalues: $\lambda = 5$ (multiplicity 2), $\lambda = 3$ (multiplicity 1), $\lambda = 1$ (multiplicity 1).

---

### Theorem 4 (Similar Matrices Have Same Eigenvalues)

> **Theorem 4.** If $n \times n$ matrices $A$ and $B$ are **similar** (i.e., $B = P^{-1}AP$ for some invertible $P$), then they have the **same characteristic polynomial** and hence the same eigenvalues (with the same multiplicities).

**Proof.** If $B = P^{-1}AP$, then:

$$B - \lambda I = P^{-1}AP - P^{-1}(\lambda P) = P^{-1}(A - \lambda I)P$$

Therefore:

$$\det(B - \lambda I) = \det(P^{-1}) \cdot \det(A - \lambda I) \cdot \det(P)$$

Since $\det(P^{-1})\det(P) = \det(P^{-1}P) = \det(I) = 1$, we get:

$$\det(B - \lambda I) = \det(A - \lambda I) \qquad \blacksquare$$

> **Warning:** Similar matrices have the same eigenvalues, but matrices with the same eigenvalues are **not** necessarily similar. Also, similarity $\neq$ row equivalence.

---

### Application: Dynamical Systems (Example)

**Q.** Let $A = \begin{bmatrix} 0.95 & 0.03 \\ 0.05 & 0.97 \end{bmatrix}$ and $\mathbf{x}_0 = \begin{bmatrix} 0.6 \\ 0.4 \end{bmatrix}$. Analyze the long-term behavior of $\mathbf{x}_{k+1} = A\mathbf{x}_k$.

**Solution.** Characteristic equation:

$$\lambda^2 - 1.92\lambda + 0.92 = 0 \implies \lambda = 1 \text{ or } \lambda = 0.92$$

Eigenvectors: $\mathbf{v}_1 = \begin{bmatrix} 3 \\ 5 \end{bmatrix}$ for $\lambda_1 = 1$, $\mathbf{v}_2 = \begin{bmatrix} 1 \\ -1 \end{bmatrix}$ for $\lambda_2 = 0.92$.

Decompose $\mathbf{x}_0 = c_1\mathbf{v}_1 + c_2\mathbf{v}_2$. Solving gives $c_1 = 0.125$, $c_2 = 0.225$.

$$\mathbf{x}_k = 0.125\begin{bmatrix} 3 \\ 5 \end{bmatrix} + 0.225(0.92)^k\begin{bmatrix} 1 \\ -1 \end{bmatrix}$$

As $k \to \infty$, $(0.92)^k \to 0$, so $\mathbf{x}_k \to \begin{bmatrix} 0.375 \\ 0.625 \end{bmatrix}$.

---

## 5.3 Diagonalization

### Key Concept

A square matrix $A$ is **diagonalizable** if $A = PDP^{-1}$, where $D$ is a diagonal matrix. This factorization makes computing powers trivial:

$$A^k = PD^kP^{-1}$$

where $D^k$ is obtained by raising each diagonal entry to the $k$-th power.

---

### Theorem 5 (The Diagonalization Theorem)

> **Theorem 5.** An $n \times n$ matrix $A$ is diagonalizable $\iff$ $A$ has $n$ linearly independent eigenvectors.
>
> In fact, $A = PDP^{-1}$, with $D$ diagonal, if and only if the columns of $P$ are $n$ linearly independent eigenvectors of $A$. The diagonal entries of $D$ are the eigenvalues corresponding (respectively) to the eigenvectors in $P$.

**Proof.** If $P = [\mathbf{v}_1 \cdots \mathbf{v}_n]$ and $D = \text{diag}(\lambda_1, \dots, \lambda_n)$, then:

$$AP = [A\mathbf{v}_1 \cdots A\mathbf{v}_n] \quad \text{and} \quad PD = [\lambda_1\mathbf{v}_1 \cdots \lambda_n\mathbf{v}_n]$$

$(\Leftarrow)$ If $\mathbf{v}_1, \dots, \mathbf{v}_n$ are linearly independent eigenvectors with $A\mathbf{v}_i = \lambda_i\mathbf{v}_i$, then $AP = PD$. Since $P$ is invertible (columns are linearly independent), $A = PDP^{-1}$.

$(\Rightarrow)$ If $A = PDP^{-1}$, then $AP = PD$, which forces $A\mathbf{v}_i = \lambda_i\mathbf{v}_i$ for each $i$. Since $P$ is invertible, its columns are linearly independent eigenvectors. $\blacksquare$

### How to Diagonalize (4 Steps)

1. **Find the eigenvalues** of $A$ (solve $\det(A - \lambda I) = 0$).
2. **Find $n$ linearly independent eigenvectors** of $A$ (find a basis for each eigenspace).
3. **Construct $P$** from the eigenvectors as columns.
4. **Construct $D$** with the corresponding eigenvalues on the diagonal (in the same order as the columns of $P$).

**Verification:** Check that $AP = PD$ (this avoids computing $P^{-1}$).

---

### Theorem 6 (Sufficient Condition)

> **Theorem 6.** An $n \times n$ matrix with $n$ **distinct** eigenvalues is diagonalizable.

**Proof.** The $n$ eigenvectors from distinct eigenvalues are linearly independent by Theorem 2. Apply Theorem 5. $\blacksquare$

> **Note:** Having $n$ distinct eigenvalues is *sufficient* but **not necessary**. A matrix can be diagonalizable even with repeated eigenvalues, as long as each eigenspace has the right dimension.

---

### Theorem 7 (Diagonalization with Repeated Eigenvalues)

> **Theorem 7.** Let $A$ be $n \times n$ with distinct eigenvalues $\lambda_1, \dots, \lambda_p$.
> - (a) The dimension of the eigenspace for $\lambda_k$ is $\leq$ the algebraic multiplicity of $\lambda_k$.
> - (b) $A$ is diagonalizable $\iff$ the sum of the eigenspace dimensions equals $n$, which happens $\iff$ (i) the characteristic polynomial factors completely into linear factors, and (ii) each eigenspace dimension equals its algebraic multiplicity.
> - (c) If $A$ is diagonalizable and $\mathcal{B}_k$ is a basis for the eigenspace of $\lambda_k$, then the union $\mathcal{B}_1 \cup \cdots \cup \mathcal{B}_p$ forms an eigenvector basis for $\mathbb{R}^n$.

---

### Example: Diagonalizable

**Q.** Diagonalize $A = \begin{bmatrix} 1 & 3 & 3 \\ -3 & -5 & -3 \\ 3 & 3 & 1 \end{bmatrix}$.

**Solution.** The characteristic polynomial is $\lambda^3 - 3\lambda^2 + 4 = -(\lambda - 1)(\lambda + 2)^2$.

Eigenvalues: $\lambda = 1$ (multiplicity 1), $\lambda = -2$ (multiplicity 2).

Eigenspace for $\lambda = 1$: basis $\left\{\begin{bmatrix} 1 \\ -1 \\ 1 \end{bmatrix}\right\}$ (dimension 1).

Eigenspace for $\lambda = -2$: basis $\left\{\begin{bmatrix} -1 \\ 1 \\ 0 \end{bmatrix}, \begin{bmatrix} -1 \\ 0 \\ 1 \end{bmatrix}\right\}$ (dimension 2).

Total eigenvectors: $1 + 2 = 3 = n$. So $A$ is diagonalizable with:

$$P = \begin{bmatrix} 1 & -1 & -1 \\ -1 & 1 & 0 \\ 1 & 0 & 1 \end{bmatrix}, \quad D = \begin{bmatrix} 1 & 0 & 0 \\ 0 & -2 & 0 \\ 0 & 0 & -2 \end{bmatrix}$$

### Example: Not Diagonalizable

**Q.** Diagonalize $A = \begin{bmatrix} 2 & 4 & 3 \\ -4 & -6 & -3 \\ 3 & 3 & 1 \end{bmatrix}$.

**Solution.** Same characteristic polynomial: $(\lambda - 1)(\lambda + 2)^2 = 0$.

But now each eigenspace is only **one-dimensional**:
- Eigenspace for $\lambda = 1$: $\text{Span}\left\{\begin{bmatrix} 1 \\ -1 \\ 1 \end{bmatrix}\right\}$
- Eigenspace for $\lambda = -2$: $\text{Span}\left\{\begin{bmatrix} -1 \\ 1 \\ 0 \end{bmatrix}\right\}$

Total independent eigenvectors: $1 + 1 = 2 < 3 = n$. **Not diagonalizable.**

---

### Computing $A^k$ Using Diagonalization

If $A = PDP^{-1}$, then:

$$A^k = PD^kP^{-1} = P\begin{bmatrix} \lambda_1^k & & \\ & \ddots & \\ & & \lambda_n^k \end{bmatrix}P^{-1}$$

**Q.** Compute $A^k$ for $A = \begin{bmatrix} 7 & 4 \\ -2 & 1 \end{bmatrix}$ given $A = PDP^{-1}$ with $P = \begin{bmatrix} 1 & 1 \\ -1 & -2 \end{bmatrix}$, $D = \begin{bmatrix} 5 & 0 \\ 0 & 3 \end{bmatrix}$.

**Solution.**

$$A^k = P\begin{bmatrix} 5^k & 0 \\ 0 & 3^k \end{bmatrix}P^{-1} = \begin{bmatrix} 1 & 1 \\ -1 & -2 \end{bmatrix}\begin{bmatrix} 5^k & 0 \\ 0 & 3^k \end{bmatrix}\begin{bmatrix} 2 & 1 \\ -1 & -1 \end{bmatrix} = \begin{bmatrix} 2\cdot5^k - 3^k & 5^k - 3^k \\ -2\cdot5^k + 2\cdot3^k & -5^k + 2\cdot3^k \end{bmatrix}$$

---

## 5.4 Eigenvectors and Linear Transformations

### Matrix of a Linear Transformation Relative to a Basis

Let $V$ be an $n$-dimensional vector space with basis $\mathcal{B} = \{\mathbf{b}_1, \dots, \mathbf{b}_n\}$, and let $T: V \to V$ be a linear transformation. The **$\mathcal{B}$-matrix for $T$** (or matrix of $T$ relative to $\mathcal{B}$) is the $n \times n$ matrix $[T]_\mathcal{B}$ whose columns are the $\mathcal{B}$-coordinate vectors of $T(\mathbf{b}_1), \dots, T(\mathbf{b}_n)$:

$$[T]_\mathcal{B} = \Big[ [T(\mathbf{b}_1)]_\mathcal{B} \quad [T(\mathbf{b}_2)]_\mathcal{B} \quad \cdots \quad [T(\mathbf{b}_n)]_\mathcal{B} \Big]$$

This satisfies: $[T(\mathbf{x})]_\mathcal{B} = [T]_\mathcal{B} \cdot [\mathbf{x}]_\mathcal{B}$.

### The $\mathcal{B}$-Matrix (Similarity)

If $A$ is the standard matrix for $T: \mathbb{R}^n \to \mathbb{R}^n$ and $\mathcal{B} = \{\mathbf{b}_1, \dots, \mathbf{b}_n\}$ is any basis for $\mathbb{R}^n$, then:

$$[T]_\mathcal{B} = P^{-1}AP$$

where $P = [\mathbf{b}_1 \cdots \mathbf{b}_n]$ is the change-of-coordinates matrix. The matrices $A$ and $[T]_\mathcal{B}$ are **similar**.

> **Key insight:** Choosing $\mathcal{B}$ to be a basis of **eigenvectors** makes $[T]_\mathcal{B}$ a **diagonal** matrix.

---

### Diagonal Matrix Representation

> **Theorem 8.** If $A = PDP^{-1}$ (so $A$ is diagonalizable), then $D$ is the $\mathcal{B}$-matrix of $T(\mathbf{x}) = A\mathbf{x}$ relative to the eigenvector basis $\mathcal{B}$ formed by the columns of $P$.

This means: when expressed in eigenvector coordinates, the transformation simply **scales** each coordinate independently.

---

### Example

**Q.** Let $\mathcal{B} = \{\mathbf{b}_1, \mathbf{b}_2, \mathbf{b}_3\}$ be a basis for $V$, and let $T: V \to V$ with $T(\mathbf{b}_1) = 3\mathbf{b}_1 - 5\mathbf{b}_2$, $T(\mathbf{b}_2) = \mathbf{b}_1 + 6\mathbf{b}_2$, $T(\mathbf{b}_3) = 4\mathbf{b}_2$. Find $[T]_\mathcal{B}$.

**Solution.** Write the $\mathcal{B}$-coordinates of each image:

$$[T(\mathbf{b}_1)]_\mathcal{B} = \begin{bmatrix} 3 \\ -5 \\ 0 \end{bmatrix}, \quad [T(\mathbf{b}_2)]_\mathcal{B} = \begin{bmatrix} 1 \\ 6 \\ 0 \end{bmatrix}, \quad [T(\mathbf{b}_3)]_\mathcal{B} = \begin{bmatrix} 0 \\ 4 \\ 0 \end{bmatrix}$$

$$[T]_\mathcal{B} = \begin{bmatrix} 3 & 1 & 0 \\ -5 & 6 & 4 \\ 0 & 0 & 0 \end{bmatrix}$$

---

### Properties of Similarity

Similarity is an **equivalence relation**:
1. **Reflexive:** $A = I^{-1}AI$, so $A$ is similar to itself.
2. **Symmetric:** If $B = P^{-1}AP$, then $A = PBP^{-1} = (P^{-1})^{-1}B(P^{-1})$.
3. **Transitive:** If $B = P^{-1}AP$ and $C = Q^{-1}BQ$, then $C = (PQ)^{-1}A(PQ)$.

---

## 5.5 Complex Eigenvalues

### Why Complex Eigenvalues Matter

The characteristic polynomial of an $n \times n$ real matrix always has $n$ roots (counting multiplicities) in $\mathbb{C}$. When the matrix has real entries, complex eigenvalues come in **conjugate pairs**: if $\lambda = a + bi$ is an eigenvalue, so is $\bar{\lambda} = a - bi$, and their eigenvectors are also conjugates.

### Example

**Q.** Find the eigenvalues of $A = \begin{bmatrix} 0 & -1 \\ 1 & 0 \end{bmatrix}$.

**Solution.** $\det(A - \lambda I) = \lambda^2 + 1 = 0 \implies \lambda = \pm i$.

For $\lambda = i$: $(A - iI)\mathbf{x} = \mathbf{0}$ gives $\begin{bmatrix} -i & -1 \\ 1 & -i \end{bmatrix}\mathbf{x} = \mathbf{0}$, yielding eigenvector $\begin{bmatrix} 1 \\ -i \end{bmatrix}$.

For $\lambda = -i$: eigenvector $\begin{bmatrix} 1 \\ i \end{bmatrix}$ (the conjugate).

Geometrically, $A$ is a **rotation** by $90°$ counterclockwise --- no real vector maps to a multiple of itself.

---

### Real and Imaginary Parts

For a complex vector $\mathbf{x} \in \mathbb{C}^n$:

$$\mathbf{x} = \text{Re}\,\mathbf{x} + i\,\text{Im}\,\mathbf{x}$$

If $A$ is real and $\lambda = a + bi$ (with $b \neq 0$) has eigenvector $\mathbf{v}$, then $\bar{\lambda} = a - bi$ has eigenvector $\bar{\mathbf{v}}$.

---

### Theorem 9 (Rotation--Scaling Factorization)

> **Theorem 9.** Let $A$ be a real $2 \times 2$ matrix with complex eigenvalue $\lambda = a - bi$ ($b \neq 0$) and associated eigenvector $\mathbf{v}$ in $\mathbb{C}^2$. Then:
>
> $$A = PCP^{-1}, \quad \text{where } P = [\text{Re}\,\mathbf{v} \quad \text{Im}\,\mathbf{v}] \quad \text{and} \quad C = \begin{bmatrix} a & -b \\ b & a \end{bmatrix}$$

The matrix $C$ represents a **rotation** by angle $\varphi$ (where $\tan\varphi = b/a$) combined with **scaling** by $r = |\lambda| = \sqrt{a^2 + b^2}$:

$$C = r\begin{bmatrix} \cos\varphi & -\sin\varphi \\ \sin\varphi & \cos\varphi \end{bmatrix}$$

### Example

**Q.** Let $A = \begin{bmatrix} 0.5 & -0.75 \\ 0.6 & 1.1 \end{bmatrix}$. Find the factorization $A = PCP^{-1}$.

**Solution.** Eigenvalues: $\lambda = 0.8 \pm 0.6i$. For $\lambda = 0.8 - 0.6i$, eigenvector: $\mathbf{v} = \begin{bmatrix} -2 - 4i \\ 5 \end{bmatrix}$.

$$P = \begin{bmatrix} -2 & -4 \\ 5 & 0 \end{bmatrix}, \quad C = \begin{bmatrix} 0.8 & -0.6 \\ 0.6 & 0.8 \end{bmatrix}$$

Since $|\lambda| = \sqrt{0.64 + 0.36} = 1$, $C$ is a **pure rotation** (no scaling). This produces an **elliptical** orbit when iterating $\mathbf{x}_{k+1} = A\mathbf{x}_k$.

---

## 5.6 Discrete Dynamical Systems

### Setup

A **discrete dynamical system** is described by the recurrence:

$$\mathbf{x}_{k+1} = A\mathbf{x}_k, \qquad k = 0, 1, 2, \dots$$

If $A$ is diagonalizable with eigenvalues $\lambda_1, \dots, \lambda_n$ and eigenvectors $\mathbf{v}_1, \dots, \mathbf{v}_n$, decompose:

$$\mathbf{x}_0 = c_1\mathbf{v}_1 + \cdots + c_n\mathbf{v}_n$$

Then the **general solution** is:

$$\boxed{\mathbf{x}_k = c_1\lambda_1^k\mathbf{v}_1 + c_2\lambda_2^k\mathbf{v}_2 + \cdots + c_n\lambda_n^k\mathbf{v}_n}$$

### Long-Term Behavior

The long-term behavior depends on the **magnitudes** of the eigenvalues:

| Condition | Behavior of Origin | Description |
|---|---|---|
| All $|\lambda_i| < 1$ | **Attractor** (sink) | All trajectories $\to \mathbf{0}$ |
| All $|\lambda_i| > 1$ | **Repeller** (source) | All trajectories $\to \infty$ |
| Some $|\lambda_i| > 1$, some $< 1$ | **Saddle point** | Depends on direction |
| $|\lambda| = 1$ (complex) | **Rotation** | Trajectories orbit the origin |

If $\lambda_1$ is a **strictly dominant eigenvalue** ($|\lambda_1| > |\lambda_j|$ for $j \geq 2$), then for large $k$:

$$\mathbf{x}_k \approx c_1\lambda_1^k\mathbf{v}_1$$

The trajectory aligns with the eigenvector $\mathbf{v}_1$.

---

### Decoupling

The change of variable $\mathbf{x}_k = P\mathbf{y}_k$ (where $P = [\mathbf{v}_1 \cdots \mathbf{v}_n]$) transforms $\mathbf{x}_{k+1} = A\mathbf{x}_k$ into:

$$\mathbf{y}_{k+1} = D\mathbf{y}_k$$

where $D = P^{-1}AP$ is diagonal. Each component evolves independently: $y_i(k+1) = \lambda_i \cdot y_i(k)$.

---

### Example: Saddle Point

**Q.** Classify the origin for $\mathbf{x}_{k+1} = A\mathbf{x}_k$ where $A = \begin{bmatrix} 1.25 & 0.75 \\ -0.75 & 1.25 \end{bmatrix}$.

**Solution.** Eigenvalues: $\lambda_1 = 2$, $\lambda_2 = 0.5$. Since $|2| > 1$ and $|0.5| < 1$, the origin is a **saddle point**.

Eigenvectors: $\mathbf{v}_1 = \begin{bmatrix} 1 \\ -1 \end{bmatrix}$ ($\lambda_1 = 2$), $\mathbf{v}_2 = \begin{bmatrix} 1 \\ 1 \end{bmatrix}$ ($\lambda_2 = 0.5$).

- **Direction of greatest repulsion**: line through $\mathbf{0}$ and $\mathbf{v}_1$ (eigenvalue $> 1$ in magnitude).
- **Direction of greatest attraction**: line through $\mathbf{0}$ and $\mathbf{v}_2$ (eigenvalue $< 1$ in magnitude).

---

### Application: Spotted Owl Population

The spotted owl stage-matrix model uses $\mathbf{x}_{k+1} = A\mathbf{x}_k$ with:

$$A = \begin{bmatrix} 0 & 0 & 0.33 \\ 0.18 & 0 & 0 \\ 0 & 0.71 & 0.94 \end{bmatrix}$$

The eigenvalues are approximately $\lambda_1 \approx 0.98$, $\lambda_2 \approx -0.02 + 0.21i$, $\lambda_3 \approx -0.02 - 0.21i$. Since all $|\lambda_i| < 1$, the origin is an attractor --- the owl population **declines to extinction**.

If the juvenile survival rate increases (entry $(2,1)$ changes from $0.18$ to $0.30$), then $\lambda_1 \approx 1.01 > 1$, and the population **grows** at about 1% per year.

---

## 5.7 Applications to Differential Equations

### The System

The linear system of differential equations:

$$\mathbf{x}'(t) = A\mathbf{x}(t)$$

has solutions built from **eigenfunctions**: if $A\mathbf{v} = \lambda\mathbf{v}$, then $\mathbf{x}(t) = \mathbf{v}e^{\lambda t}$ is a solution, since:

$$\mathbf{x}'(t) = \lambda\mathbf{v}e^{\lambda t} = A(\mathbf{v}e^{\lambda t}) = A\mathbf{x}(t)$$

### General Solution (Diagonalizable Case)

If $A$ has $n$ linearly independent eigenvectors $\mathbf{v}_1, \dots, \mathbf{v}_n$ with eigenvalues $\lambda_1, \dots, \lambda_n$, the general solution is:

$$\boxed{\mathbf{x}(t) = c_1\mathbf{v}_1 e^{\lambda_1 t} + c_2\mathbf{v}_2 e^{\lambda_2 t} + \cdots + c_n\mathbf{v}_n e^{\lambda_n t}}$$

The constants $c_1, \dots, c_n$ are determined by the initial condition $\mathbf{x}(0) = \mathbf{x}_0$.

### Decoupling

The substitution $\mathbf{x}(t) = P\mathbf{y}(t)$ transforms $\mathbf{x}' = A\mathbf{x}$ into:

$$\mathbf{y}' = D\mathbf{y} \implies y_i'(t) = \lambda_i y_i(t) \implies y_i(t) = c_i e^{\lambda_i t}$$

---

### Phase Portrait Classification (Real $2 \times 2$)

| Eigenvalues | Origin | Behavior |
|---|---|---|
| Both $\lambda < 0$ | **Attractor** (sink) | Trajectories spiral in |
| Both $\lambda > 0$ | **Repeller** (source) | Trajectories spiral out |
| $\lambda_1 > 0 > \lambda_2$ | **Saddle point** | Approach along one direction, repel along another |

- **Direction of greatest attraction**: eigenvector of the more negative eigenvalue.
- **Direction of greatest repulsion**: eigenvector of the more positive eigenvalue.

---

### Example: RC Circuit

**Q.** Solve $\mathbf{x}' = A\mathbf{x}$, $\mathbf{x}(0) = \begin{bmatrix} 5 \\ 4 \end{bmatrix}$, where $A = \begin{bmatrix} -1.5 & 1 \\ 0.5 & -1 \end{bmatrix}$.

**Solution.** Eigenvalues: $\lambda_1 = -0.5$, $\lambda_2 = -2$. Eigenvectors: $\mathbf{v}_1 = \begin{bmatrix} 1 \\ 2 \end{bmatrix}$, $\mathbf{v}_2 = \begin{bmatrix} 1 \\ -1 \end{bmatrix}$.

General solution:

$$\mathbf{x}(t) = c_1\begin{bmatrix} 1 \\ 2 \end{bmatrix}e^{-0.5t} + c_2\begin{bmatrix} 1 \\ -1 \end{bmatrix}e^{-2t}$$

From $\mathbf{x}(0) = c_1\mathbf{v}_1 + c_2\mathbf{v}_2 = \begin{bmatrix} 5 \\ 4 \end{bmatrix}$, we get $c_1 = 3$, $c_2 = 2$.

$$\mathbf{x}(t) = 3\begin{bmatrix} 1 \\ 2 \end{bmatrix}e^{-0.5t} + 2\begin{bmatrix} 1 \\ -1 \end{bmatrix}e^{-2t} = \begin{bmatrix} 3e^{-0.5t} + 2e^{-2t} \\ 6e^{-0.5t} - 2e^{-2t} \end{bmatrix}$$

Both eigenvalues are negative, so the origin is an **attractor**.

---

### Complex Eigenvalues for Differential Equations

If $\lambda = a + bi$ ($b \neq 0$) is an eigenvalue with eigenvector $\mathbf{v}$, two real solutions are:

$$\mathbf{y}_1(t) = [\text{Re}\,\mathbf{v}\cos bt - \text{Im}\,\mathbf{v}\sin bt]\,e^{at}$$
$$\mathbf{y}_2(t) = [\text{Re}\,\mathbf{v}\sin bt + \text{Im}\,\mathbf{v}\cos bt]\,e^{at}$$

This uses Euler's formula: $e^{(a+bi)t} = e^{at}(\cos bt + i\sin bt)$.

The behavior:
- $a < 0$: **Spiral sink** (trajectories spiral inward).
- $a > 0$: **Spiral source** (trajectories spiral outward).
- $a = 0$: **Center** (closed elliptical orbits).

---

## 5.8 Iterative Estimates for Eigenvalues

### The Power Method

The **power method** estimates the **strictly dominant eigenvalue** (the eigenvalue with the largest absolute value).

> **Definition.** An eigenvalue $\lambda_1$ is **strictly dominant** if $|\lambda_1| > |\lambda_j|$ for all other eigenvalues $\lambda_j$.

**Algorithm:**
1. Choose an initial vector $\mathbf{x}_0$ with largest entry $= 1$.
2. For $k = 0, 1, 2, \dots$:
   - Compute $A\mathbf{x}_k$.
   - Let $\mu_k$ be the entry in $A\mathbf{x}_k$ with the largest absolute value.
   - Set $\mathbf{x}_{k+1} = \frac{1}{\mu_k}A\mathbf{x}_k$.
3. Then $\mu_k \to \lambda_1$ and $\mathbf{x}_k \to$ a corresponding eigenvector.

**Why it works:** If $\mathbf{x}_0 = c_1\mathbf{v}_1 + \cdots + c_n\mathbf{v}_n$ (with $c_1 \neq 0$), then:

$$A^k\mathbf{x}_0 = c_1\lambda_1^k\mathbf{v}_1 + c_2\lambda_2^k\mathbf{v}_2 + \cdots$$

Since $|\lambda_1| > |\lambda_j|$, the terms $(\lambda_j/\lambda_1)^k \to 0$, so:

$$A^k\mathbf{x}_0 \approx c_1\lambda_1^k\mathbf{v}_1$$

The scaling step keeps the vectors bounded. The **rate of convergence** depends on $|\lambda_2/\lambda_1|$.

---

### Example

**Q.** Apply the power method to $A = \begin{bmatrix} 6 & -1 \\ 5 & 2 \end{bmatrix}$ with $\mathbf{x}_0 = \begin{bmatrix} 0 \\ 1 \end{bmatrix}$.

**Solution.**

| $k$ | $\mathbf{x}_k$ | $A\mathbf{x}_k$ | $\mu_k$ |
|-----|-----------------|------------------|---------|
| 0 | $(0, 1)$ | $(-5, 2)$ | $5$ |
| 1 | $(1, 0.4)$ | $(8, -1.8)$ | $8$ |
| 2 | $(1, 0.225)$ | $(7.125, -1.45)$ | $7.125$ |
| 3 | $(1, 0.2035)$ | $(7.018, -1.407)$ | $7.018$ |

Converging to $\mu \approx 7$ with eigenvector $\approx (1, 0.2)$. Check: $A\begin{bmatrix}1\\0.2\end{bmatrix} = \begin{bmatrix}7\\1.4\end{bmatrix} = 7\begin{bmatrix}1\\0.2\end{bmatrix}$. Confirmed.

---

### The Inverse Power Method

To estimate an eigenvalue **near** a given estimate $\alpha$:
1. Let $B = (A - \alpha I)^{-1}$.
2. Apply the power method to $B$.
3. $B$'s dominant eigenvalue is $1/(\lambda - \alpha)$, where $\lambda$ is the eigenvalue of $A$ closest to $\alpha$.
4. Recover: $\lambda_k = \alpha + 1/\mu_k$.

**Algorithm (in practice, avoid computing $B$):**
1. Choose $\mathbf{x}_0$ with largest entry $= 1$.
2. For each $k$:
   - Solve $(A - \alpha I)\mathbf{y}_k = \mathbf{x}_k$ for $\mathbf{y}_k$.
   - Let $\mu_k = $ largest entry (in absolute value) of $\mathbf{y}_k$.
   - $\lambda_k = \alpha + 1/\mu_k$.
   - $\mathbf{x}_{k+1} = \frac{1}{\mu_k}\mathbf{y}_k$.

> **Tip:** Use an LU factorization of $A - \alpha I$ to speed up the repeated solves.

---

### Rayleigh Quotient

For **symmetric** matrices, the **Rayleigh quotient** provides faster convergence:

$$R(\mathbf{x}) = \frac{\mathbf{x}^T A\mathbf{x}}{\mathbf{x}^T\mathbf{x}}$$

If $\mathbf{x}$ is an eigenvector with eigenvalue $\lambda$, then $R(\mathbf{x}) = \lambda$ exactly. For approximate eigenvectors, $R(\mathbf{x}_k)$ converges roughly **twice as fast** (in digits of accuracy) as $\mu_k$.

---

## 5.9 Applications to Markov Chains

### Definitions

> **Probability vector**: A vector with nonnegative entries that sum to $1$.
>
> **Stochastic matrix**: A square matrix whose **columns** are probability vectors.
>
> **Markov chain**: A sequence $\mathbf{x}_0, \mathbf{x}_1, \mathbf{x}_2, \dots$ of probability vectors with $\mathbf{x}_{k+1} = P\mathbf{x}_k$, where $P$ is a stochastic matrix.

The vector $\mathbf{x}_k$ is called the **state vector** at step $k$.

---

### Theorem 10 (Stochastic Matrices and Eigenvalue 1)

> **Theorem 10.** If $P$ is a stochastic matrix, then $\lambda = 1$ is an eigenvalue of $P$.

**Proof.** Since the columns of $P$ sum to $1$, the rows of $P^T$ sum to $1$. Let $\mathbf{e}$ be the all-ones vector. Then $P^T\mathbf{e} = \mathbf{e}$, so $\mathbf{e}$ is an eigenvector of $P^T$ with eigenvalue $1$. Since $P$ and $P^T$ have the same eigenvalues (same characteristic polynomial), $1$ is also an eigenvalue of $P$. $\blacksquare$

---

### Steady-State Vectors

> **Definition.** A **steady-state vector** (or **equilibrium vector**) for a stochastic matrix $P$ is a probability vector $\mathbf{q}$ such that $P\mathbf{q} = \mathbf{q}$.

In other words, $\mathbf{q}$ is a probability eigenvector for $\lambda = 1$.

### Theorem 11 (Convergence to Steady State)

> **Theorem 11.** If $P$ is a **regular** stochastic matrix (i.e., some power $P^k$ has all strictly positive entries), then $P$ has a **unique** steady-state vector $\mathbf{q}$, and for any initial probability vector $\mathbf{x}_0$:
>
> $$\mathbf{x}_k = P^k\mathbf{x}_0 \to \mathbf{q} \quad \text{as } k \to \infty$$

**Why?** For a regular stochastic matrix, $\lambda = 1$ is the strictly dominant eigenvalue (all other eigenvalues have $|\lambda| < 1$). Therefore the power method (which the Markov chain essentially performs) converges to the eigenvector for $\lambda = 1$.

---

### Finding the Steady-State Vector

To find $\mathbf{q}$:
1. Solve $(P - I)\mathbf{q} = \mathbf{0}$ (i.e., find the eigenspace for $\lambda = 1$).
2. Among the solutions, find the one that is a **probability vector** (entries $\geq 0$, summing to $1$).

---

### Example: City/Suburb Migration

**Q.** The migration matrix is $P = \begin{bmatrix} 0.95 & 0.03 \\ 0.05 & 0.97 \end{bmatrix}$ and $\mathbf{x}_0 = \begin{bmatrix} 0.60 \\ 0.40 \end{bmatrix}$. Find the steady-state distribution.

**Solution.** Solve $(P - I)\mathbf{x} = \mathbf{0}$:

$$P - I = \begin{bmatrix} -0.05 & 0.03 \\ 0.05 & -0.03 \end{bmatrix}$$

Row reduce: $x_1 = 0.6x_2$, so $\mathbf{x} = x_2\begin{bmatrix} 0.6 \\ 1 \end{bmatrix}$. Normalizing to a probability vector (entries sum to $1$):

$$\mathbf{q} = \frac{1}{1.6}\begin{bmatrix} 0.6 \\ 1 \end{bmatrix} = \begin{bmatrix} 0.375 \\ 0.625 \end{bmatrix}$$

**Long-run prediction:** 37.5% city, 62.5% suburbs.

---

### Example: Voting Model

**Q.** With stochastic matrix $P = \begin{bmatrix} 0.7 & 0.1 & 0.3 \\ 0.2 & 0.8 & 0.3 \\ 0.1 & 0.1 & 0.4 \end{bmatrix}$ and $\mathbf{x}_0 = \begin{bmatrix} 0.55 \\ 0.40 \\ 0.05 \end{bmatrix}$, find the steady-state vector.

**Solution.** Solve $(P - I)\mathbf{q} = \mathbf{0}$:

$$P - I = \begin{bmatrix} -0.3 & 0.1 & 0.3 \\ 0.2 & -0.2 & 0.3 \\ 0.1 & 0.1 & -0.6 \end{bmatrix}$$

Row reduction yields one free variable. Setting $x_3 = t$: the eigenspace for $\lambda = 1$ is spanned by a vector, which when normalized gives the steady-state probability distribution for voting in the long run.

---

## Summary Table: Key Theorems

| Theorem | Statement |
|---|---|
| **Thm 1** | Eigenvalues of a triangular matrix = diagonal entries |
| **Thm 2** | Eigenvectors from distinct eigenvalues are linearly independent |
| **Thm 3** | Properties of determinants (invertibility, products, transposes) |
| **Thm 4** | Similar matrices have the same characteristic polynomial |
| **Thm 5** | $A$ is diagonalizable $\iff$ $A$ has $n$ linearly independent eigenvectors |
| **Thm 6** | $n$ distinct eigenvalues $\Rightarrow$ diagonalizable |
| **Thm 7** | Diagonalization criterion for repeated eigenvalues |
| **Thm 8** | Diagonal $\mathcal{B}$-matrix when $\mathcal{B}$ is eigenvector basis |
| **Thm 9** | Real $2\times 2$ with complex eigenvalue: $A = PCP^{-1}$ (rotation-scaling) |
| **Thm 10** | $\lambda = 1$ is always an eigenvalue of a stochastic matrix |
| **Thm 11** | Regular stochastic matrix $\Rightarrow$ unique steady-state vector |

## Key Formulas at a Glance

| Formula | Context |
|---|---|
| $\det(A - \lambda I) = 0$ | Characteristic equation |
| $A^k = PD^kP^{-1}$ | Powers via diagonalization |
| $\mathbf{x}_k = c_1\lambda_1^k\mathbf{v}_1 + \cdots + c_n\lambda_n^k\mathbf{v}_n$ | Discrete dynamical system |
| $\mathbf{x}(t) = c_1\mathbf{v}_1e^{\lambda_1 t} + \cdots + c_n\mathbf{v}_ne^{\lambda_n t}$ | Differential equation system |
| $e^{(a+bi)t} = e^{at}(\cos bt + i\sin bt)$ | Euler's formula |
| $R(\mathbf{x}) = \mathbf{x}^TA\mathbf{x}/\mathbf{x}^T\mathbf{x}$ | Rayleigh quotient |
| $P\mathbf{q} = \mathbf{q}$, $\mathbf{q}$ probability vector | Steady-state of Markov chain |
