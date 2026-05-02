---
title: 2027 Winter — LLM 底层 + Thesis 定题
tags:
  - study-plan
  - 2027
  - winter
  - llm
  - thesis
phase: intensive
status: future
created: 2026-03-17
---

# 2027 Winter — LLM 底层 + Thesis 定题

> [!abstract] 阶段定位
> 2028 Spring 有 CSE 5610（LLM），需要提前准备。**这个寒假要把 Thesis topic 初稿和 advisor 关系确定下来。** 同时开始维护文献库（Zotero + Obsidian）。

← [[2027 Fall]] | 下一阶段 → [[2028 Spring]]

---

## 📋 任务清单

### LLM 技术
- [ ] Karpathy Zero to Hero 系列（YouTube）
- [ ] BERT / GPT 系列 / T5 论文精读

### Thesis
- [ ] Thesis topic 初稿完成
- [ ] Advisor 关系确定
- [ ] 开始维护 Zotero + Obsidian 文献库

### 哲学
- [ ] Somers-Hall *Deleuze's Difference and Repetition: A Reader's Guide*

---

## 🤖 LLM 技术准备

### Karpathy — Zero to Hero 系列

> [!tip] 最好的 Transformer 底层实现教程
> 从零实现 GPT，配合 d2l.ai Transformer 章节。这个系列是目前最好的 Transformer 底层实现教程。

| 视频 | 内容 | 状态 |
|------|------|------|
| micrograd | 反向传播引擎（~2h） | ⬜ |
| makemore (1–5) | bigram → MLP → Attention | ⬜ |
| nanoGPT | 完整 GPT 实现 | ⬜ |
| nanoGPT speedrun | 训练优化技巧 | ⬜ |

> [!goal] 验收标准
> 能从空白文件写出一个可以运行的 GPT（不是复制 nanoGPT，是**理解后重写**）。

---

### 重要 LLM 论文精读

> [!info] 建立 paper reading 习惯
> 这学期开始，每读完一篇论文，在 Obsidian 里写一篇 literature note（用 Zotero 管理元数据）。

| 论文 | 年份 | 核心贡献 | 状态 |
|------|------|---------|------|
| Devlin et al. *BERT: Pre-training of Deep Bidirectional Transformers* | 2019 | Masked LM + NSP | ⬜ |
| Radford et al. *GPT-2* | 2019 | 语言模型即多任务学习器 | ⬜ |
| Brown et al. *GPT-3* | 2020 | In-context learning, few-shot | ⬜ |
| Raffel et al. *T5* | 2020 | Text-to-Text 统一框架 | ⬜ |

> [!tip] 读论文方法（三遍法）
> 1. **第一遍**（15min）：标题 + Abstract + 结论 + 图表，搞清楚"做了什么"
> 2. **第二遍**（1h）：Introduction + 方法 + 实验，搞清楚"怎么做的"
> 3. **第三遍**（2h+）：公式推导，搞清楚"为什么这么做"

---

## 📚 Thesis 布局

> [!danger] 关键节点
> 2028 Fall 要交 Thesis，2028 Spring Independent Study 要产出内容。**这个寒假 = 最后一个可以从容定题的窗口。**

### Thesis Topic 初稿

| 任务 | 状态 |
|------|------|
| 确定大方向（NLP + 哲学？ NLP + 语言学？） | ⬜ |
| 浏览该方向近3年 ACL/EMNLP/NAACL 论文 | ⬜ |
| 写出 Thesis topic 1–2 段描述（草稿） | ⬜ |
| 和 advisor 讨论 topic 可行性 | ⬜ |

---

### 文献库设置

> [!tip] 工具链
> **Zotero**（元数据管理）+ **Obsidian**（笔记、synthesis）

| 设置步骤 | 状态 |
|---------|------|
| 安装 Zotero + Better BibTeX 插件 | ⬜ |
| 设置 Zotero → Obsidian 连接（obsidian-zotero 或手动） | ⬜ |
| 建立论文笔记模板（Obsidian） | ⬜ |
| 把之前读过的论文补录入库 | ⬜ |

**论文笔记模板建议：**
```
## 元数据
- 作者：
- 年份：
- 会议/期刊：

## 一句话总结

## 核心贡献
-
-

## 方法
（关键公式 / 架构图）

## 与我研究的关联

## 问题 / 疑惑
```

---

## 🧠 哲学

### Somers-Hall — *Deleuze's Difference and Repetition: A Reader's Guide*

> [!warning] 先导读，再啃原典
> Deleuze *Difference and Repetition* 原典语言极难，**必须先过导读**。2028 Spring 再开始原典。

| 章节 | 对应 D&R | 状态 |
|------|---------|------|
| 导论 | D&R 背景、柏格森影响 | ⬜ |
| Ch. 1 | Difference in Itself | ⬜ |
| Ch. 2 | Repetition for Itself | ⬜ |
| Ch. 3 | The Image of Thought | ⬜ |
| Ch. 4 | Ideas | ⬜ |
| Ch. 5 | Asymmetrical Synthesis of the Sensible | ⬜ |

> [!note] 与框架的关联
> 差异（difference）概念是你的 *The Architecture of Conscious Exile* 框架里"异质性"维度的哲学来源。把 Deleuze 的 difference-in-itself 和 Hegel 的 difference-through-negation 对比记录。

---

## ✅ 寒假结束验收

1. 能从零写出一个可运行的小型 Transformer（手写 Attention）
2. 能概括 BERT 和 GPT 架构的核心区别（Encoder-only vs Decoder-only）
3. Thesis topic 有初稿，并与 advisor 讨论过
4. Zotero + Obsidian 文献库已建立，有 5+ 篇论文笔记
5. 能用自己的话解释 Deleuze 的"差异"概念为何不是 Hegel 式的否定

---

*← [[2027 Fall]] | → [[2028 Spring]]*
