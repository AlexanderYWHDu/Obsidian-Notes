---
title: 2027 Summer — NLP 起飞
tags:
  - study-plan
  - 2027
  - summer
  - nlp
  - thesis
phase: intensive
status: future
created: 2026-03-17
---

# 2027 Summer — NLP 起飞

> [!abstract] 阶段定位
> **这是 NLP 方向起飞的关键暑假。** 2027 Fall 有 CSE 5270（NLP），这个暑假做完整准备后开学直接降维打击。同时要开始接触潜在 Thesis advisor，**不能等到 2028**。

← [[2027 Spring]] | 下一阶段 → [[2027 Fall]]

---

## 📋 总任务清单

### NLP 主线
- [ ] Jurafsky & Martin *SLP* 3rd ed. — 前20章
- [ ] Vaswani et al. *Attention Is All You Need* — 手推每个公式

### 数学
- [ ] Casella & Berger *Statistical Inference* — 重点章节
- [ ] Horn & Johnson / Strang — SVD + 特征分解选读

### 哲学
- [ ] Foucault *The Order of Things* — 开始阅读
- [ ] Chomsky *Syntactic Structures*（如选 LING 3150）

### 科研
- [ ] 邮件联系潜在 NLP/计算语言学 advisor

---

## 🤖 NLP 主线

### Jurafsky & Martin — *Speech and Language Processing* 3rd ed.

> [!tip] 这是 CSE 5270 的核心教材
> 建议**完整读完前20章**，从 n-gram 到 Transformer 都覆盖。免费在线：[web.stanford.edu/~jurafsky/slp3/](https://web.stanford.edu/~jurafsky/slp3/)

| 章节 | 内容 | 状态 |
|------|------|------|
| Ch. 2 | Regular Expressions, Text Normalization | ⬜ |
| Ch. 3 | N-gram Language Models | ⬜ |
| Ch. 4 | Naive Bayes, Text Classification | ⬜ |
| Ch. 5 | Logistic Regression | ⬜ |
| Ch. 6 | Vector Semantics and Embeddings | ⬜ |
| Ch. 7 | Neural Networks | ⬜ |
| Ch. 8 | Sequence Labeling (HMM, CRF) | ⬜ |
| Ch. 9 | RNNs and LSTMs | ⬜ |
| Ch. 10 | Transformers | ⬜ |
| Ch. 11 | Pre-training (BERT, GPT) | ⬜ |
| Ch. 12 | Fine-tuning and Prompting | ⬜ |
| Ch. 13 | Machine Translation | ⬜ |
| Ch. 14 | Question Answering | ⬜ |
| Ch. 15 | Chatbots | ⬜ |
| Ch. 16 | ASR | ⬜ |
| Ch. 17 | Speech Synthesis | ⬜ |
| Ch. 18 | Parsing (CFG) | ⬜ |
| Ch. 19 | Dependency Parsing | ⬜ |
| Ch. 20 | Semantic Role Labeling | ⬜ |

---

### Vaswani et al. — *Attention Is All You Need*（2017）

> [!danger] 必须手推每个公式
> 这不是"读懂"，是"能推出来"。

| 公式 / 机制 | 手推状态 |
|------------|---------|
| Scaled Dot-Product Attention：$\text{Attention}(Q,K,V) = \text{softmax}\left(\frac{QK^T}{\sqrt{d_k}}\right)V$ | ⬜ |
| Multi-Head Attention | ⬜ |
| Positional Encoding | ⬜ |
| Add & Norm 层 | ⬜ |
| FFN 层 | ⬜ |
| Encoder / Decoder 架构 | ⬜ |
| Label Smoothing + Optimizer (Warmup) | ⬜ |

> [!tip] 辅助资源
> - Jay Alammar 的可视化博客 "The Illustrated Transformer"（先看图再手推）
> - Andrej Karpathy 的 nanoGPT（手推之后对照实现）

---

## 📐 数学

### Casella & Berger — *Statistical Inference*

> [!info] 为 SDS 4020 预热（2027 Fall）

| 章节 | 内容 | 状态 |
|------|------|------|
| Ch. 5 | Properties of a Random Sample | ⬜ |
| Ch. 6 | Principles of Data Reduction (充分统计量) | ⬜ |
| Ch. 7 | Point Estimation (MLE, MOM, Bayes) | ⬜ |
| Ch. 8 | Hypothesis Testing (NP Lemma) | ⬜ |
| Ch. 9 | Interval Estimation | ⬜ |
| Ch. 10 | Asymptotic Evaluations | ⬜ |

> [!note] 重点
> MLE 的推导、Fisher 信息、Cramér–Rao 下界——这些在 NLP 的生成模型里反复出现。

---

### Horn & Johnson / Gilbert Strang — SVD + 特征分解

> [!goal] 目标
> 为 MATH 4301（2027 Fall 线性代数）和 NLP 降维方法（LSA, PCA）建立直觉。

| 内容 | 资源 | 状态 |
|------|------|------|
| 特征值分解 $A = Q\Lambda Q^T$ | Strang Ch. 6 | ⬜ |
| SVD $A = U\Sigma V^T$ | Strang Ch. 7 | ⬜ |
| 低秩近似 + PCA | Strang / J&M Ch. 6 | ⬜ |

---

## 🧠 哲学

### Foucault — *The Order of Things*（1966）

> [!info] 现在可以啃了
> 有了 Gutting 导读基础，原典现在可以开始。知识型（épistème）概念为你框架的认识论部分提供大陆哲学支撑。

| 章节 | 内容 | 状态 |
|------|------|------|
| Preface | 博尔赫斯的中国百科全书 | ⬜ |
| Ch. 1 | Las Meninas | ⬜ |
| Part I (Ch. 2–4) | 文艺复兴时代的知识型 | ⬜ |
| Part II (Ch. 5–7) | 古典时代的知识型 | ⬜ |
| Part III (Ch. 8–10) | 现代知识型（人的诞生） | ⬜ |
| Conclusion | 人的消逝 | ⬜ |

> [!tip] 读法
> 每章读完后停下来问：**这个时代"知识"的组织方式是什么？** 比较不同知识型，理解为什么福柯说"人"是近代的发明。

---

### Chomsky — *Syntactic Structures*（1957）

> [!info] 条件性：如果选了 LING 3150（句法分析）

| 内容 | 状态 |
|------|------|
| Ch. 1–2 | 语法的独立性论证 | ⬜ |
| Ch. 4 | 转换语法 | ⬜ |
| Colorless green ideas... 例子 | ⬜ |

> [!note] 认知科学接口
> Chomsky 在语言学和认知科学的交叉对 PNP 方向也有价值：普遍语法假设 vs 后来的用法理论（和 Wittgenstein 形成对立）。

---

## 🔬 科研布局

> [!danger] 不能等到 2028
> **这个暑假要开始接触潜在 Thesis advisor**，邮件联系 NLP / 计算语言学方向的教授，表达兴趣。

### 邮件准备清单

- [ ] 读目标教授最近 2–3 篇论文（ACL Anthology）
- [ ] 在邮件里提到具体论文内容（不能是套话）
- [ ] 说明自己的背景（课程 + 自学 + 编程能力）
- [ ] 询问是否有 RA 机会或 Thesis 合作意愿

> [!tip] 时间线
> 2027 Summer 接触 → 2027 Fall 读课程论文、加深关系 → 2027 Winter 确定 advisor

---

## ✅ 暑假结束验收

1. 能从头手推 Transformer 架构（不看论文）
2. 理解 MLE、NP 引理、充分统计量
3. 解释 SVD 的几何意义和在 LSA 里的应用
4. 发出至少 2–3 封有质量的 advisor 联系邮件
5. 能解释福柯的知识型概念，以及为什么"人"在现代知识型里是中心

---

*← [[2027 Spring]] | → [[2027 Fall]]*
