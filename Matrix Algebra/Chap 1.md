---
tags:
  - linear-algebra
  - review
aliases:
  - Linear Equations in Linear Algebra
created: 2026-03-12
source: Lay, Linear Algebra and Its Applications, 6th ed.
---

# Chapter 1: Linear Equations in Linear Algebra

> [!abstract] Chapter Overview
> This chapter centers on **systems of linear equations**, building three equivalent perspectives: the matrix equation $Ax=b$, the vector equation (linear combination), and the linear system. The goal is ultimately to abstract "solving" into the existence and uniqueness of **linear transformations**.

---

## 1.1 Systems of Linear Equations

### Core Concepts

**System of linear equations** ($m$ equations, $n$ unknowns):
$$a_{i1}x_1 + a_{i2}x_2 + \cdots + a_{in}x_n = b_i, \quad i=1,\ldots,m$$

**Augmented matrix**: $[A \mid b]$, where $A$ is the coefficient matrix.

**Elementary row operations**:
- **Replacement**: $R_i \leftarrow R_i + c\,R_j$
- **Interchange**: $R_i \leftrightarrow R_j$
- **Scaling**: $R_i \leftarrow c\,R_i,\ c\neq 0$

> [!info] Key Property
> Elementary row operations are **reversible** and preserve the solution set of the system (row equivalence preserves solutions).

### Two Fundamental Questions

| Question | Meaning |
|----------|---------|
| **Existence** | Does the system have a solution (is it consistent)? |
| **Uniqueness** | If a solution exists, is it unique? |

---

## 1.2 Row Reduction and Echelon Forms

### Definitions

> [!definition] Echelon Form (Row Echelon Form)
> A matrix is in echelon form if:
> 1. All zero rows are below any nonzero rows
> 2. The **leading entry** of each row lies strictly to the right of the leading entry of the row above
> 3. All entries below a leading entry are zeros

> [!definition] RREF (Reduced Row Echelon Form)
> A matrix in echelon form additionally satisfies:
> 4. Each leading entry is **1**
> 5. Each leading 1 is the **only nonzero entry** in its column

> [!theorem] Theorem 1 — Uniqueness of RREF
> Each matrix is row equivalent to **one and only one** reduced echelon matrix.

### Pivots and Variable Classification

- **Pivot position**: a location corresponding to a leading 1 in the RREF
- **Basic variable**: a variable corresponding to a pivot column (uniquely determined)
- **Free variable**: a variable corresponding to a non-pivot column (can take any value)

### Row Reduction Algorithm

**Forward phase** (produces Echelon Form):
1. Locate the leftmost nonzero column (pivot column)
2. Select a nonzero entry as pivot (interchange rows if necessary)
3. Use row replacement to create zeros below the pivot
4. Cover the pivot row and repeat on the remaining submatrix

**Backward phase** (produces RREF):
5. Starting from the rightmost pivot, create zeros above each pivot and scale each pivot to 1

> [!tip] Operation Count
> Forward phase $\approx \frac{2n^3}{3}$ flops; backward phase $\approx n^2$ flops (for an $n\times(n+1)$ matrix)

### Existence and Uniqueness Theorem

> [!theorem] Theorem 2 — Existence and Uniqueness
> A linear system is consistent **if and only if** the rightmost column of the augmented matrix is not a pivot column — i.e., the RREF has no row of the form $[0\ \cdots\ 0\ \mid\ b],\ b\neq 0$.
>
> If the system is consistent, then:
> - **No free variables** $\Rightarrow$ **unique solution**
> - **At least one free variable** $\Rightarrow$ **infinitely many solutions**

---

## 1.3 Vector Equations

### Vectors in $\mathbb{R}^n$

Vector operations in $\mathbb{R}^n$ (defined entry-wise) obey **8 algebraic properties**:

| Property | Expression |
|----------|-----------|
| Commutativity | $\mathbf{u}+\mathbf{v}=\mathbf{v}+\mathbf{u}$ |
| Associativity | $(\mathbf{u}+\mathbf{v})+\mathbf{w}=\mathbf{u}+(\mathbf{v}+\mathbf{w})$ |
| Zero element | $\mathbf{u}+\mathbf{0}=\mathbf{u}$ |
| Additive inverse | $\mathbf{u}+(-\mathbf{u})=\mathbf{0}$ |
| Distributivity 1 | $c(\mathbf{u}+\mathbf{v})=c\mathbf{u}+c\mathbf{v}$ |
| Distributivity 2 | $(c+d)\mathbf{u}=c\mathbf{u}+d\mathbf{u}$ |
| Scalar associativity | $c(d\mathbf{u})=(cd)\mathbf{u}$ |
| Identity | $1\mathbf{u}=\mathbf{u}$ |

### Linear Combination and Span

> [!definition] Linear Combination
> Given $\mathbf{v}_1,\ldots,\mathbf{v}_p \in \mathbb{R}^n$ and scalars $c_1,\ldots,c_p$, the vector
> $$\mathbf{y} = c_1\mathbf{v}_1 + \cdots + c_p\mathbf{v}_p$$
> is called a **linear combination** of $\mathbf{v}_1,\ldots,\mathbf{v}_p$ with weights $c_i$.

> [!definition] Span
> $\text{Span}\{\mathbf{v}_1,\ldots,\mathbf{v}_p\}$ is the set of all linear combinations of $\mathbf{v}_1,\ldots,\mathbf{v}_p$ — a **subset** (in fact a subspace) of $\mathbb{R}^n$.

**Geometric intuition** (in $\mathbb{R}^3$):
- $\text{Span}\{\mathbf{v}\}$ ($\mathbf{v}\neq\mathbf{0}$) = a **line** through the origin
- $\text{Span}\{\mathbf{u},\mathbf{v}\}$ ($\mathbf{v}$ not a multiple of $\mathbf{u}$) = a **plane** through the origin

**Key connection**: $\mathbf{b}\in\text{Span}\{\mathbf{a}_1,\ldots,\mathbf{a}_n\}$ $\Longleftrightarrow$ the linear system with augmented matrix $[\mathbf{a}_1\ \cdots\ \mathbf{a}_n\mid\mathbf{b}]$ is consistent.

---

## 1.4 The Matrix Equation $Ax = b$

### Matrix–Vector Product (Column View)

> [!definition] $Ax$ (column linear combination)
> If $A = [\mathbf{a}_1\ \cdots\ \mathbf{a}_n]$ and $\mathbf{x}\in\mathbb{R}^n$, then
> $$A\mathbf{x} = x_1\mathbf{a}_1 + x_2\mathbf{a}_2 + \cdots + x_n\mathbf{a}_n$$
> That is, $A\mathbf{x}$ is the **linear combination** of the columns of $A$ using the entries of $\mathbf{x}$ as weights.

**Row-vector rule (equivalent computation)**: $(A\mathbf{x})_i = \text{row}_i(A)\cdot \mathbf{x}$ (dot product)

### Three Equivalent Formulations

> [!theorem] Theorem 3
> The matrix equation $A\mathbf{x}=\mathbf{b}$, the vector equation $x_1\mathbf{a}_1+\cdots+x_n\mathbf{a}_n=\mathbf{b}$, and the linear system with augmented matrix $[\mathbf{a}_1\ \cdots\ \mathbf{a}_n\mid\mathbf{b}]$ all have the **same solution set**.

### Spanning $\mathbb{R}^m$ — Full Characterization

> [!theorem] Theorem 4 (Equivalent Statements)
> Let $A$ be an $m\times n$ matrix. The following are equivalent:
> 1. For each $\mathbf{b}\in\mathbb{R}^m$, the equation $A\mathbf{x}=\mathbf{b}$ has a solution
> 2. Each $\mathbf{b}\in\mathbb{R}^m$ is a linear combination of the columns of $A$
> 3. The columns of $A$ **span** $\mathbb{R}^m$
> 4. $A$ has a **pivot position in every row**

> [!proof] Proof sketch (1) $\Leftrightarrow$ (4)
> Let $U$ be an echelon form of $A$. If (4) holds, every row of $U$ contains a pivot, so the augmented column cannot be a pivot column, meaning $A\mathbf{x}=\mathbf{b}$ is consistent for every $\mathbf{b}$. If (4) fails, the last row of $U$ is all zeros; choosing $\mathbf{d}$ with a 1 in its last entry makes $[U\mid\mathbf{d}]$ inconsistent, and reversing the row operations yields a $\mathbf{b}$ for which $A\mathbf{x}=\mathbf{b}$ is inconsistent.

### Linearity of $A$

> [!theorem] Theorem 5
> For an $m\times n$ matrix $A$, vectors $\mathbf{u},\mathbf{v}\in\mathbb{R}^n$, and scalar $c$:
> $$A(\mathbf{u}+\mathbf{v}) = A\mathbf{u}+A\mathbf{v}, \qquad A(c\mathbf{u}) = c(A\mathbf{u})$$

> [!proof]
> Expand directly using the column linear combination definition of $Ax$. Let $A=[\mathbf{a}_1\ \cdots\ \mathbf{a}_n]$:
> $$A(\mathbf{u}+\mathbf{v}) = \sum_i(u_i+v_i)\mathbf{a}_i = \sum_i u_i\mathbf{a}_i + \sum_i v_i\mathbf{a}_i = A\mathbf{u}+A\mathbf{v}$$

---

## 1.5 Solution Sets of Linear Systems

### Homogeneous Systems

The system $A\mathbf{x}=\mathbf{0}$ is called **homogeneous**.
- Always has the **trivial solution** $\mathbf{x}=\mathbf{0}$
- Has a nontrivial solution $\Longleftrightarrow$ **there is at least one free variable**

**Parametric vector form**: if there are $k$ free variables $x_{f_1},\ldots,x_{f_k}$, then:
$$\mathbf{x} = x_{f_1}\mathbf{v}_1 + \cdots + x_{f_k}\mathbf{v}_k$$

The solution set is $\text{Span}\{\mathbf{v}_1,\ldots,\mathbf{v}_k\}$ — a subspace through the origin.

### Nonhomogeneous Systems

> [!theorem] Theorem 6 (Structure Theorem)
> Suppose $A\mathbf{x}=\mathbf{b}$ is consistent and let $\mathbf{p}$ be any particular solution. Then the complete solution set is:
> $$\{\mathbf{w} = \mathbf{p} + \mathbf{v}_h \mid \mathbf{v}_h \in \text{Nul}(A)\}$$
> That is, the solution set of $A\mathbf{x}=\mathbf{b}$ is a **translation** of the solution set of $A\mathbf{x}=\mathbf{0}$.

> [!proof]
> **$\mathbf{p}+\mathbf{v}_h$ is a solution**: $A(\mathbf{p}+\mathbf{v}_h)=A\mathbf{p}+A\mathbf{v}_h=\mathbf{b}+\mathbf{0}=\mathbf{b}$ (by Theorem 5).
> **Every solution has this form**: if $\mathbf{w}$ is any solution, let $\mathbf{v}_h=\mathbf{w}-\mathbf{p}$; then $A\mathbf{v}_h=A\mathbf{w}-A\mathbf{p}=\mathbf{b}-\mathbf{b}=\mathbf{0}$.

**Geometric interpretation**:
- 1 free variable → solution set is a **line** not through the origin (when $\mathbf{b}\neq\mathbf{0}$)
- 2 free variables → solution set is a **plane** not through the origin

---

## 1.6 Applications (Overview)

### Leontief Exchange Model
An economy with $n$ sectors has an equilibrium price vector $\mathbf{p}$ satisfying:
$$C\mathbf{p} = \mathbf{p} \quad \Longleftrightarrow \quad (I - C)\mathbf{p} = \mathbf{0}$$
where $C$ is the exchange matrix (each column sums to 1). This is a homogeneous system; equilibrium prices are its nonzero solutions.

### Balancing Chemical Equations
Write atom-conservation as a vector equation $x_1\mathbf{c}_1+\cdots+x_n\mathbf{c}_n=\mathbf{0}$ (where $\mathbf{c}_i$ is the atom-count vector for molecule $i$) and find the smallest positive integer solution.

### Network Flow
**Conservation law** (at each node): flow in = flow out → each node yields one linear equation. The system is typically underdetermined; feasible flows are described in parametric vector form.

---

## 1.7 Linear Independence

### Definition

> [!definition] Linear Independence / Dependence
> A set $\{\mathbf{v}_1,\ldots,\mathbf{v}_p\}\subset\mathbb{R}^n$ is:
> - **Linearly independent**: $x_1\mathbf{v}_1+\cdots+x_p\mathbf{v}_p=\mathbf{0}$ has only the trivial solution
> - **Linearly dependent**: there exist weights $c_i$, not all zero, such that $c_1\mathbf{v}_1+\cdots+c_p\mathbf{v}_p=\mathbf{0}$

**Connection to matrices**:
$$\text{cols of } A \text{ are lin. indep.} \Longleftrightarrow A\mathbf{x}=\mathbf{0} \text{ has only the trivial solution} \Longleftrightarrow A \text{ has a pivot in every column}$$

### Characterization Theorems

> [!theorem] Theorem 7 (Characterization of Linearly Dependent Sets)
> A set $S=\{\mathbf{v}_1,\ldots,\mathbf{v}_p\}$ ($p\geq 2$) is linearly dependent $\Longleftrightarrow$ at least one vector in $S$ is a **linear combination of the preceding vectors**.
> More precisely: if $S$ is linearly dependent and $\mathbf{v}_1\neq\mathbf{0}$, then some $\mathbf{v}_j$ ($j>1$) is in $\text{Span}\{\mathbf{v}_1,\ldots,\mathbf{v}_{j-1}\}$.

> [!theorem] Theorem 8 (Too Many Vectors)
> If $p > n$, then any set of $p$ vectors in $\mathbb{R}^n$ is **necessarily linearly dependent**.

> [!proof]
> Let $A=[\mathbf{v}_1\ \cdots\ \mathbf{v}_p]$, an $n\times p$ matrix. When $p>n$, the system $A\mathbf{x}=\mathbf{0}$ has more unknowns than equations, so it must have a free variable and hence a nontrivial solution.

> [!theorem] Theorem 9
> Any set containing the zero vector is linearly dependent. (Since $1\cdot\mathbf{0}=\mathbf{0}$.)

### Special Cases

- **2 vectors**: linearly dependent $\Longleftrightarrow$ one is a scalar multiple of the other (geometrically: collinear)
- **Geometry in $\mathbb{R}^3$**: $\{\mathbf{u},\mathbf{v},\mathbf{w}\}$ is linearly dependent (with $\mathbf{u},\mathbf{v}$ independent) $\Longleftrightarrow$ $\mathbf{w}\in\text{Span}\{\mathbf{u},\mathbf{v}\}$ (coplanar)

---

## 1.8 Introduction to Linear Transformations

### Definition

> [!definition] Linear Transformation
> A mapping $T:\mathbb{R}^n\to\mathbb{R}^m$ is a **linear transformation** if:
> 1. $T(\mathbf{u}+\mathbf{v}) = T(\mathbf{u})+T(\mathbf{v})$ &emsp;(preservation of addition)
> 2. $T(c\mathbf{u}) = cT(\mathbf{u})$ &emsp;(preservation of scalar multiplication)

**Immediate consequences** (from the two conditions above):
$$T(\mathbf{0}) = \mathbf{0}$$
$$T(c\mathbf{u}+d\mathbf{v}) = cT(\mathbf{u})+dT(\mathbf{v}) \qquad \text{(equivalent condition for linearity)}$$
$$T(c_1\mathbf{v}_1+\cdots+c_p\mathbf{v}_p) = c_1 T(\mathbf{v}_1)+\cdots+c_p T(\mathbf{v}_p) \qquad \text{(superposition principle)}$$

> [!caution] Note
> Every matrix transformation $\mathbf{x}\mapsto A\mathbf{x}$ is a linear transformation (guaranteed by Theorem 5). Conversely (§1.9), every linear transformation can be represented by a matrix.

### Terminology

| Term | Meaning |
|------|---------|
| Domain | $\mathbb{R}^n$ |
| Codomain | $\mathbb{R}^m$ |
| Image of $\mathbf{x}$ | $T(\mathbf{x})$ |
| Range | $\{T(\mathbf{x})\mid\mathbf{x}\in\mathbb{R}^n\}$ = all linear combinations of the columns of $A$ |

### Common Geometric Transformations

| Transformation | Standard Matrix |
|----------------|----------------|
| Reflection through the $x_1$-axis | $\begin{pmatrix}1&0\\0&-1\end{pmatrix}$ |
| Reflection through the $x_2$-axis | $\begin{pmatrix}-1&0\\0&1\end{pmatrix}$ |
| Reflection through $x_2=x_1$ | $\begin{pmatrix}0&1\\1&0\end{pmatrix}$ |
| Rotation by angle $\varphi$ | $\begin{pmatrix}\cos\varphi&-\sin\varphi\\\sin\varphi&\cos\varphi\end{pmatrix}$ |
| Horizontal shear | $\begin{pmatrix}1&k\\0&1\end{pmatrix}$ |
| Vertical shear | $\begin{pmatrix}1&0\\k&1\end{pmatrix}$ |
| Projection onto $x_1$-axis | $\begin{pmatrix}1&0\\0&0\end{pmatrix}$ |
| Dilation (scaling) | $\begin{pmatrix}r&0\\0&r\end{pmatrix}$ |

---

## 1.9 The Matrix of a Linear Transformation

### The Standard Matrix

> [!theorem] Theorem 10 (Existence and Uniqueness of Standard Matrix)
> Let $T:\mathbb{R}^n\to\mathbb{R}^m$ be a linear transformation. Then there exists a unique matrix $A$ such that
> $$T(\mathbf{x}) = A\mathbf{x}, \quad \forall\,\mathbf{x}\in\mathbb{R}^n$$
> This matrix is called the **standard matrix** for $T$; its $j$-th column is $T(\mathbf{e}_j)$ (where $\mathbf{e}_j$ is the $j$-th column of $I_n$):
> $$A = \bigl[T(\mathbf{e}_1)\ \cdots\ T(\mathbf{e}_n)\bigr]$$

> [!proof]
> For any $\mathbf{x} = x_1\mathbf{e}_1+\cdots+x_n\mathbf{e}_n$, linearity gives:
> $$T(\mathbf{x}) = x_1 T(\mathbf{e}_1)+\cdots+x_n T(\mathbf{e}_n) = [T(\mathbf{e}_1)\ \cdots\ T(\mathbf{e}_n)]\mathbf{x} = A\mathbf{x}$$
> **Uniqueness**: if $A\mathbf{x}=B\mathbf{x}$ for all $\mathbf{x}$, substituting $\mathbf{x}=\mathbf{e}_j$ shows the $j$-th columns of $A$ and $B$ are equal.

### Onto and One-to-One

> [!definition]
> - $T$ is **onto** $\mathbb{R}^m$: every $\mathbf{b}\in\mathbb{R}^m$ is the image of at least one $\mathbf{x}$ (existence)
> - $T$ is **one-to-one**: every $\mathbf{b}\in\mathbb{R}^m$ is the image of at most one $\mathbf{x}$ (uniqueness)

> [!theorem] Theorem 11
> A linear transformation $T$ is one-to-one $\Longleftrightarrow$ $T(\mathbf{x})=\mathbf{0}$ has only the trivial solution.

> [!proof]
> $(\Rightarrow)$: If $T$ is one-to-one, $T(\mathbf{x})=\mathbf{0}$ has at most one solution, so only $\mathbf{x}=\mathbf{0}$.
> $(\Leftarrow)$ (contrapositive): If $T$ is not one-to-one, there exist $\mathbf{u}\neq\mathbf{v}$ with $T(\mathbf{u})=T(\mathbf{v})$, so $T(\mathbf{u}-\mathbf{v})=\mathbf{0}$ has the nonzero solution $\mathbf{u}-\mathbf{v}\neq\mathbf{0}$.

> [!theorem] Theorem 12
> Let $A$ be the standard matrix for $T$:
> - $T$ is **onto** $\mathbb{R}^m$ $\Longleftrightarrow$ the columns of $A$ **span** $\mathbb{R}^m$ $\Longleftrightarrow$ $A$ has a pivot in every row
> - $T$ is **one-to-one** $\Longleftrightarrow$ the columns of $A$ are **linearly independent** $\Longleftrightarrow$ $A$ has a pivot in every column

### Master Equivalence Chart

$$\boxed{
\underbrace{T \text{ one-to-one}}_{\text{uniqueness}} \Longleftrightarrow \underbrace{A\mathbf{x}=\mathbf{0} \text{ has only trivial solution}}_{\text{no free variables}} \Longleftrightarrow \underbrace{\text{cols of } A \text{ lin. indep.}}_{\text{pivot in every column}}
}$$

$$\boxed{
\underbrace{T \text{ onto } \mathbb{R}^m}_{\text{existence}} \Longleftrightarrow \underbrace{A\mathbf{x}=\mathbf{b} \text{ always consistent}}_{\text{no zero rows}} \Longleftrightarrow \underbrace{\text{cols of } A \text{ span } \mathbb{R}^m}_{\text{pivot in every row}}
}$$

---

## Representative Problems

### Computational

**T1.** Solve the system and write the solution in parametric vector form:
$$x_1 - 2x_2 + x_3 = 0,\quad 2x_1 + x_2 - 3x_3 = 0,\quad 4x_1 - 3x_2 - x_3 = 0$$

**T2.** Let $A = \begin{pmatrix}1&3&-5\\2&5&-1\\4&11&-13\end{pmatrix}$ and $\mathbf{b} = \begin{pmatrix}b_1\\b_2\\b_3\end{pmatrix}$. Find a necessary and sufficient condition on $b_1, b_2, b_3$ for $A\mathbf{x}=\mathbf{b}$ to be consistent.

**T3.** Determine whether the following vectors are linearly dependent, and if so find a dependence relation:
$$\mathbf{v}_1=\begin{pmatrix}1\\2\\3\end{pmatrix},\quad \mathbf{v}_2=\begin{pmatrix}4\\5\\6\end{pmatrix},\quad \mathbf{v}_3=\begin{pmatrix}7\\8\\9\end{pmatrix}$$

**T4.** Let $T:\mathbb{R}^2\to\mathbb{R}^2$ first apply a horizontal shear (shear factor 3) and then rotate by $\pi/2$. Find the standard matrix of $T$ and determine whether $T$ is one-to-one and/or onto.

### Proofs

**T5.** Prove: if $\mathbf{u}$ and $\mathbf{v}$ are both solutions of $A\mathbf{x}=\mathbf{b}$, then $\mathbf{u}-\mathbf{v}$ is a solution of $A\mathbf{x}=\mathbf{0}$.

**T6.** Let $A$ be an $m\times n$ matrix with $m < n$. Prove that $A\mathbf{x}=\mathbf{0}$ must have a nontrivial solution.

**T7. (Harder)** Let $T:\mathbb{R}^n\to\mathbb{R}^m$ be a linear transformation and suppose $\{\mathbf{v}_1,\ldots,\mathbf{v}_k\}$ is linearly independent. If $T$ is one-to-one, prove that $\{T(\mathbf{v}_1),\ldots,T(\mathbf{v}_k)\}$ is also linearly independent.

### Conceptual

**T8.** Can the columns of a $5\times 7$ matrix span $\mathbb{R}^5$? What about a $7\times 5$ matrix? Explain each case.

**T9.** Suppose $A$ is a $3\times 3$ matrix such that $A\mathbf{x}=\mathbf{b}$ has a unique solution for every $\mathbf{b}\in\mathbb{R}^3$. What is the RREF of $A$?

---

## Extensions and Applications

### 🔗 Master Equivalence Table
The following table summarizes the **equivalent statements** recurring throughout Chapter 1 (for an $m\times n$ matrix $A$):

| $A$ has a pivot in every column ($n$ pivots, $m\geq n$) | $A$ has a pivot in every row ($m$ pivots, $n\geq m$) |
|---|---|
| $A\mathbf{x}=\mathbf{0}$ has only the trivial solution | $A\mathbf{x}=\mathbf{b}$ is consistent for all $\mathbf{b}$ |
| Columns are linearly independent | Columns span $\mathbb{R}^m$ |
| $T(\mathbf{x})=A\mathbf{x}$ is one-to-one | $T(\mathbf{x})=A\mathbf{x}$ is onto |
| Solution is unique (when it exists) | At least one solution always exists |

### 🖥️ Computer Graphics
An affine transformation = linear transformation + translation, unified via **homogeneous coordinates**:
$$\begin{pmatrix}x'\\y'\\1\end{pmatrix} = \begin{pmatrix}a&b&t_x\\c&d&t_y\\0&0&1\end{pmatrix}\begin{pmatrix}x\\y\\1\end{pmatrix}$$
Rotations, reflections, shears, and scalings are all linear ($t_x=t_y=0$) and can be **composed** simply by multiplying their matrices.

### 📐 Looking Ahead
- **Chapter 2**: Matrix algebra and invertible matrices — when does $A\mathbf{x}=\mathbf{b}$ have a unique solution given by $\mathbf{x}=A^{-1}\mathbf{b}$?
- **Chapter 4**: Generalizes $\mathbb{R}^n$ to abstract vector spaces — span, linear independence, and linear transformations all have abstract counterparts
- **Chapter 5**: Eigenvalues and eigenvectors — finding special directions where $A\mathbf{x}=\lambda\mathbf{x}$

### 📊 Numerical Linear Algebra
- **Partial Pivoting**: at each step, choose the entry with the largest absolute value as the pivot to minimize floating-point errors (used by production software such as LAPACK)
- **LU Factorization**: the row reduction process itself produces a factorization $A=LU$ ($L$ lower triangular, $U$ upper triangular), making it efficient to solve $A\mathbf{x}=\mathbf{b}$ for multiple right-hand sides (see §2.5)
- **Operation Count**: solving an $n\times n$ system costs $\approx \frac{2n^3}{3}$ flops (forward elimination) plus $\approx n^2$ flops (back substitution to RREF)
