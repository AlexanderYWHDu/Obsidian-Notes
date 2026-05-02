## 3 分钟 Demo 计划

> 提前准备：已运行 `npm run dev`，浏览器打开 localhost:5173，清空旧 session

---

### 0:00 - 0:20 | 创建探索 (20s)

- 点 **New Exploration**
- 输入一个有争议性、容易出好内容的问题，建议：
    
    > "Should universities replace traditional lectures with AI tutors?"
    
- 点 Create

**讲**：_"We start by asking a question. The system will explore it from 4 completely different angles simultaneously."_

---

### 0:20 - 0:50 | 核心功能：4路并行 Diverge (30s)

- 4 张卡片同时开始 streaming — **这是最大的视觉冲击点，停下来让观众看**
- 等卡片全部完成
- **点击一张卡展开**，滚动展示完整 Markdown 回答
- 点 **Select this direction**

**讲**：_"4 AI responses stream in parallel, each from a genuinely different angle. I can expand any card to read the full response, then choose one to go deeper."_

---

### 0:50 - 1:20 | Follow-up 追问 (30s)

- 在新节点的 idle 视图，输入追问：
    
    > "What about students with learning disabilities?"
    
- Enter 发送，展示流式回答
- 等完成，自动跳转到追问节点

**讲**：_"Instead of always branching, I can ask a follow-up for a linear deep-dive on any point."_

---

### 1:20 - 1:50 | 再次 Diverge + Guidance (30s)

- 在追问节点上，展开 **"Steer this divergence"**
- 输入 guidance：
    
    > "Focus on policy and implementation"
    
- 点 **Diverge from here**
- 卡片开始 streaming — 不等完成，继续讲

**讲**：_"From any node, I can diverge again. I can optionally steer the AI with guidance — here I'm telling it to focus on policy."_

---

### 1:50 - 2:15 | 树导航 (25s)

- **点左侧树上的根节点** — 跳回初始问题
- **点击另一个之前没选的 diverge 子节点** — 展示可以随时探索其他分支
- 指着树说明结构

**讲**：_"The tree on the left tracks every branch. I can jump to any node — revisit old branches, compare different angles. The diverge we started is still running in the background."_

---

### 2:15 - 2:35 | 快捷键 + 导出 (20s)

- 按 **Backspace** 回到父节点
- 按 **1** 快速选第一张卡
- 从一个字节点点 **Download 按钮** — 下载 Markdown 文件
- 快速打开下载的 .md 文件闪一下

**讲**：_"Keyboard shortcuts for speed — 1-4 to select, backspace to go back. And I can export the current path as Markdown."_

---

### 2:35 - 3:00 | Light/Dark + 收尾 (25s)

- 点 **月亮/太阳图标** 切换主题
- 切回来
- 点 **返回按钮** 回到 Session 列表，展示 session 卡片

**讲**：_"Light and dark themes. All data is stored locally in IndexedDB — no backend, no data leaves your machine except for the LLM API calls. Everything is a local-first, real-time streaming experience."_

---

### 关键节奏提示

|时间段|重点|观众注意力|
|---|---|---|
|0:20-0:50|4路并行 streaming|**最高** — 这是 wow moment，放慢|
|0:50-1:20|Follow-up|展示不只是 branching|
|1:50-2:15|树导航|展示"exploration"的核心价值|

### 提前准备 checklist

- [ ]  `.env` 里 API key 有效，model 选延迟低的（Groq 或 Claude Haiku 更快出结果）
- [ ]  清空旧 session（或留一个已经有深度的做 backup）
- [ ]  浏览器全屏，字体大小调大一档（Ctrl + +）
- [ ]  关掉所有通知