---
title: 2026 Winter — 算法 + 语言哲学预热
tags:
  - study-plan
  - 2026
  - winter
phase: intensive
status: upcoming
created: 2026-03-17
---

# 2026 Winter — 算法 + 语言哲学预热

> [!info] 背景
> 两门硬课压着：2027 Spring 的 **CSE 3407（算法）** 和 **MATH 3420（Graph Theory / 抽象代数？）**。寒假做算法预习 + 哲学推进。

← [[2026 Fall]] | 下一阶段 → [[2027 Spring]]

---

## 📋 任务清单

- [ ] Kleinberg & Tardos *Algorithm Design* — 核心章节
- [ ] Wittgenstein *Philosophical Investigations* §1–88
- [ ] Searle *Minds, Brains, and Programs*（短文）
- [ ] 形式语法基础（如选 LING 3250）

---

## 💻 数学 / CS

### Kleinberg & Tardos — *Algorithm Design*

> [!tip] 为什么选 K&T 而不是 CLRS
> K&T 比 CLRS 更适合自学，叙述清晰，直觉优先。开学 CSE 3407 就是在复习。CLRS 作为查阅参考，不要主读。

| 章节 | 内容 | 核心目标 | 状态 |
|------|------|---------|------|
| Ch. 1 | Introduction: Some Representative Problems | 建立算法分析直觉 | ⬜ |
| Ch. 2 | Basics of Algorithm Analysis | $O / \Omega / \Theta$ 严格定义 | ⬜ |
| Ch. 3 | Graphs | BFS / DFS / 连通性 | ⬜ |
| Ch. 4 | Greedy Algorithms | 区间调度、最小生成树 | ⬜ |
| Ch. 5 | Divide and Conquer | Mergesort、快速幂 | ⬜ |
| Ch. 6 | Dynamic Programming | 子问题结构 + 备忘录 | ⬜ |
| Ch. 7 | Network Flow | 最大流最小割定理 | ⬜ |

> [!goal] 最重要的直觉
> 1. **贪心**：为什么贪心正确？（交换论证 / 保持领先论证）
> 2. **动态规划**：子问题的拓扑顺序，memo vs bottom-up
> 3. **网络流**：Ford-Fulkerson 终止性，残差图

> [!note] 关于 Graph Theory
> MATH 3020 图论**不需要单独预习**——proof-based 训练完了之后图论读起来自然。

---

## 🧠 哲学

### Wittgenstein — *Philosophical Investigations* §1–88

> [!warning] 这是核心文本
> §1–88 是语言游戏的核心，对应 PHIL 3020（语言哲学），而且直接和 NLP 的哲学基础有接口。

| 段落 | 内容 | 关键概念 | 状态 |
|------|------|---------|------|
| §1–20 | Augustine 图像，语言游戏的引入 | 语言游戏（Sprachspiel） | ⬜ |
| §21–38 | 命名与指称 | 私人语言批判的铺垫 | ⬜ |
| §39–64 | 逻辑原子论的批判 | 家族相似（family resemblance） | ⬜ |
| §65–88 | 规则遵循 | 规则遵循悖论（Kripkenstein） | ⬜ |

> [!tip] 读法
> PI 不适合快读。一天读 5–10 小节，停下来想"他在反对谁？"。可以参考 Anscombe 或 Baker & Hacker 的导读。

> [!example] 和 NLP 的接口
> §43 "词的意义就是它在语言中的用法"（meaning as use）→ 分布语义学的哲学根基 → word2vec、BERT 的表示学习为什么有效？

---

### Searle — *Minds, Brains, and Programs*（1980）

> [!info] 这是一篇短文
> 大约 20 页，BBS 期刊论文。中文房间论证（Chinese Room），PHIL 3100（心灵哲学）的标准入场文本。

| 内容 | 关键论点 | 状态 |
|------|---------|------|
| 中文房间思想实验 | 句法 ≠ 语义 | ⬜ |
| 系统回复（Systems Reply）批判 | | ⬜ |
| 大脑模拟回复（Brain Simulator Reply）批判 | | ⬜ |
| 结论：意向性的生物基础 | | ⬜ |

> [!note] 对话 Chalmers
> Searle 的结论和 Chalmers 不同——Searle 是生物自然主义，Chalmers 是属性二元论。把这个区别记下来，之后 PHIL 3100 或 PNP 2000 里会有直接碰撞。

---

## 🗣️ 语言学（条件性）

> [!info] 如果选了 LING 3250
> 提前了解基本的形式语法概念，这些和 CSE 后续 NLP 课高度重叠：

| 概念 | 简述 | 状态 |
|------|------|------|
| Chomsky hierarchy | Regular → CFG → CSG → Unrestricted | ⬜ |
| CFG（上下文无关文法） | 产生式规则、推导树 | ⬜ |
| 正则语言 | 有限状态自动机 | ⬜ |

> [!tip] 资源
> Jurafsky & Martin *SLP* Ch. 12–13 有清晰的形式语法介绍，和 NLP 应用直接挂钩。

---

## ✅ 寒假结束验收

1. 能解释 DP 的子问题结构，手写背包问题
2. 能用自己的语言复述"语言游戏"和"规则遵循悖论"
3. 能解释中文房间论证，以及 Chalmers 会如何反驳 Searle

---

*← [[2026 Fall]] | → [[2027 Spring]]*
