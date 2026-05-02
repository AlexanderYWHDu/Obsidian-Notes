---
title: 2028 Spring — 技术产出最密集
tags:
  - study-plan
  - 2028
  - spring
  - semester
  - thesis
  - llm
phase: semester
status: future
created: 2026-03-17
---

# 2028 Spring — 技术产出最密集

> [!danger] 阶段定位
> Independent Study 实际上就是 Thesis 的前置，**这学期是技术产出最密集的时期**。Karpathy × CSE 5610 并行，每周精读 2–3 篇 Thesis 相关论文，学期结束前完成文献综述初稿。

← [[2027 Winter]] | 下一阶段 → [[2028 Summer]]

---

## 🎓 本学期课程

| 课程 | 内容 | 自学搭档 |
|------|------|---------|
| MATH 2500 | 微分方程 | Strogatz（选读，非必须） |
| CSE 5610 | LLM（大语言模型） | Karpathy Zero to Hero（并行） |
| CSE 4000 | Independent Study（=Thesis前置） | 文献综述 |
| LING/PSYCH | 选一 | — |

---

## 🤖 CSE 5610 × Karpathy 并行

> [!tip] 并行策略
> Karpathy 补实现细节，课上讲原理。遇到课上讲了某个技巧（如 KV Cache、Flash Attention）→ 去找对应实现或博客。

| CSE 5610 Topic | Karpathy / 实现参考 | 状态 |
|---------------|-------------------|------|
| Transformer 架构回顾 | nanoGPT（已实现） | ⬜ |
| Pre-training 策略 | nanoGPT speedrun | ⬜ |
| Fine-tuning / RLHF | InstructGPT 论文 | ⬜ |
| Prompting / In-context learning | GPT-3 论文 | ⬜ |
| Efficient Transformers | Flash Attention 论文 | ⬜ |
| LLM 评估 | BIG-bench, HELM | ⬜ |
| 应用 (RAG, Agents) | LangChain 文档 / 论文 | ⬜ |

---

## 📚 CSE 4000 — Independent Study / Thesis 文献

> [!danger] 核心任务
> **每周精读 2–3 篇与 Thesis topic 直接相关的论文，用 Obsidian 维护文献笔记。学期结束前完成文献综述初稿。**

### 周度文献计划

| 周次 | 论文数 | 综述进度 | 状态 |
|------|--------|---------|------|
| W1–W2 | 4–6 篇（奠基文献） | 框架草稿 | ⬜ |
| W3–W6 | 2–3 篇/周（核心方向） | 分章节填充 | ⬜ |
| W7–W10 | 2–3 篇/周（最新进展） | 比较与综合 | ⬜ |
| W11–W13 | 补漏，精修 | 初稿完成 | ⬜ |
| W14–W15 | Advisor 反馈修改 | 初稿定稿 | ⬜ |

---

## 📐 MATH 2500 微分方程

> [!info] 辅助读物（非必须）
> **Strogatz — *Nonlinear Dynamics and Chaos***：微分方程对 ML 里的连续优化和 ODE-based 模型有用。这本书有趣且直觉清晰，值得浏览但不强制。

| 内容 | 与 ML 的关联 | 状态 |
|------|-------------|------|
| 一维常微分方程 | 梯度下降的连续近似 | ⬜ |
| 相平面 | Neural ODE 的直觉 | ⬜ |
| 稳定性分析 | 优化景观的极点分析 | ⬜ |

---

## 🧠 哲学

### Deleuze — *Difference and Repetition*（原典）

> [!tip] 导读已完成，现在可以啃原典
> 每周一小节，慢慢读，不用赶。重点是理解"差异"的非否定性含义。

| 章节 | 内容 | 状态 |
|------|------|------|
| Introduction | Repetition and Difference | ⬜ |
| Ch. 1 | Difference in Itself | ⬜ |
| Ch. 2 | Repetition for Itself | ⬜ |
| Ch. 3 | The Image of Thought | ⬜ |
| Ch. 4 | Ideas and the Synthesis of Difference | ⬜ |
| Ch. 5 | Asymmetrical Synthesis of the Sensible | ⬜ |
| Conclusion | — | ⬜ |

> [!note] 笔记策略
> 每章读完，写一段"这个章节对我框架的意义"——不要只是摘要，要有自己的回应。

---

## ✅ 学期结束验收

1. 文献综述初稿完成（至少 15–20 篇论文覆盖）
2. 能讲清楚 RLHF 的三个步骤（SFT → Reward Model → PPO）
3. Independent Study 产出内容可直接进入 Thesis
4. Deleuze Ch. 1–3 读完，有笔记

---

*← [[2027 Winter]] | → [[2028 Summer]]*
