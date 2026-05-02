---
title: 2026 Summer — 最重要的暑假
tags:
  - study-plan
  - 2026
  - summer
phase: intensive
status: upcoming
created: 2026-03-17
---

# 2026 Summer — 最重要的暑假

> [!danger] 重要性说明
> **这是整个规划里最重要的一个暑假。** 2026 Fall 五门课同时硬核（MATH 3010 · CSE 4107 · SDS 4010 · LING 1600 · PNP 2000）。这个暑假做的准备直接决定那个学期的上限。

← [[2026 Spring]] | 下一阶段 → [[2026 Fall]]

---

## 📋 总任务清单

### ML / 数学主线
- [ ] CS229 notes — 完整过一遍，手推核心算法
- [ ] Blitzstein & Hwang *Introduction to Probability* — 系统阅读
- [ ] d2l.ai — 完成 MLP、CNN 基础部分

### 编程
- [ ] 独立搭出完整训练流程（目标：开学前达到）

### 语言学
- [ ] Fromkin et al. *An Introduction to Language* — 翻阅框架

### 哲学
- [ ] Scruton *Kant: A Very Short Introduction* — 通读
- [ ] Chalmers *The Conscious Mind* — 开始阅读

---

## 🤖 ML / 数学主线

### CS229 Notes（Stanford 机器学习）

> [!goal] 核心目标
> **重点手推**，不是只看懂。每个推导都要自己在纸上写一遍。

| 模块 | 内容 | 手推重点 | 状态 |
|------|------|---------|------|
| 线性回归 | 最小二乘、正规方程、概率解释 | $(X^TX)^{-1}X^Ty$ 推导 | ⬜ |
| 逻辑回归 | Sigmoid、交叉熵、梯度下降 | $\nabla_\theta J$ 推导 | ⬜ |
| GDA | 高斯判别分析、生成模型 vs 判别模型 | 参数 MLE 推导 | ⬜ |
| 朴素贝叶斯 | 条件独立假设 | 完整推导 | ⬜ |
| SVM | 最大间隔、对偶问题、核函数 | KKT 条件 | ⬜ |
| EM 算法 | 期望最大化、混合高斯 | E-step / M-step | ⬜ |
| 神经网络 | 反向传播、链式法则 | $\delta^{(l)}$ 推导 | ⬜ |

> [!tip] 资源
> - 官方 notes：[cs229.stanford.edu](https://cs229.stanford.edu/notes2022fall/)
> - 配合 Andrej Karpathy 的 micrograd 博客加深反向传播直觉

---

### Blitzstein & Hwang — *Introduction to Probability*（Stat110）

> [!info] 为什么选这本
> 比一般概率教材写得好，直接为 SDS 4010 预热。有配套视频（Harvard Stat110 YouTube）可以选择性看。

| 章节 | 内容 | 状态 |
|------|------|------|
| Ch. 1 | Probability and Counting | ⬜ |
| Ch. 2 | Conditional Probability | ⬜ |
| Ch. 3 | Random Variables and their Distributions | ⬜ |
| Ch. 4 | Expectation | ⬜ |
| Ch. 5 | Continuous Random Variables | ⬜ |
| Ch. 6 | Moments | ⬜ |
| Ch. 7 | Joint Distributions | ⬜ |
| Ch. 8 | Transformations | ⬜ |
| Ch. 9 | Conditional Expectation | ⬜ |
| Ch. 10 | Inequalities and Limit Theorems | ⬜ |

> [!note] 读法
> 每章的 Story Proof 和 Symmetry 论证特别值得细读，这是这本书区别于普通教材的地方。

---

### d2l.ai（续）

> [!goal] 目标：开学前能独立搭一个完整训练流程

| 章节 | 内容 | 状态 |
|------|------|------|
| Ch. 4 | Multilayer Perceptrons | ⬜ |
| Ch. 5 | Deep Learning Computation | ⬜ |
| Ch. 6 | Convolutional Neural Networks | ⬜ |
| Ch. 7 | Modern CNNs (ResNet 等) | ⬜ |

**最终验收标准：** 不查文档，从零写出一个 CNN 在 CIFAR-10 上的完整训练流程（数据加载 → 模型定义 → 训练循环 → 验证）。

---

## 🗣️ 语言学

### Fromkin et al. — *An Introduction to Language*

> [!goal] 目标
> LING 1600 的标准教材。提前翻一遍，了解基本框架，**开学会轻松很多**。不需要精读，建章节式浏览。

| 章节 | 内容 | 状态 |
|------|------|------|
| Ch. 2 | Morphology（词法） | ⬜ |
| Ch. 3 | Syntax（句法）基础 | ⬜ |
| Ch. 4 | Semantics（语义）基础 | ⬜ |
| Ch. 5 | Phonetics（音标） | ⬜ |
| Ch. 6 | Phonology（音韵） | ⬜ |

---

## 🧠 哲学

### Scruton — *Kant: A Very Short Introduction*

> [!goal] 目标
> 把先验感性论（Transcendental Aesthetic）和现象/本体（phenomenon/noumenon）区分搞清楚，为认识论框架建立基础。

| 章节 | 内容 | 状态 |
|------|------|------|
| 空间与时间 | 先验感性论 | ⬜ |
| 知性 | 范畴、图式论 | ⬜ |
| 现象与本体 | 物自体的界限 | ⬜ |
| 道德哲学 | 定言命令（可以略读） | ⬜ |

> [!note] 核心概念卡片
> 读完后整理以下概念到笔记：
> - 先天综合判断（synthetic a priori）
> - 先验感性论（transcendental aesthetic）
> - 现象 vs 物自体（phenomenon vs noumenon）
> - 哥白尼式革命

---

### Chalmers — *The Conscious Mind*

> [!warning] 核心文本
> 意识难问题（hard problem of consciousness）直接对口 PNP 2000，也是你框架的核心文本。这本书要认真读，不是浏览。

| 章节 | 内容 | 状态 |
|------|------|------|
| Introduction | 意识的难问题 vs 容易问题 | ⬜ |
| Ch. 1 | Two Concepts of Mind | ⬜ |
| Ch. 2 | Supervenience and Explanation | ⬜ |
| Ch. 3 | Can Consciousness be Reductively Explained? | ⬜ |
| Ch. 4 | The Irreducibility of Consciousness | ⬜ |
| Ch. 5 | The Paradox of Phenomenal Judgment | ⬜ |

> [!tip] 读法
> 遇到关键论证（如 zombie argument、property dualism）就停下来，用自己的语言重述一遍，再继续。配合 [[2026 Fall]] 的 PNP 2000 内容会有很好的共鸣。

---

## ✅ 暑假结束验收

完成本阶段后，应能：
1. 手推逻辑回归、反向传播（纸笔，不看笔记）
2. 独立写出完整 PyTorch 训练流程
3. 解释"意识难问题"和"现象/本体区分"的关系
4. 听到 LING 1600 第一节课时有"这我见过"的感觉

---

*← [[2026 Spring]] | → [[2026 Fall]]*
