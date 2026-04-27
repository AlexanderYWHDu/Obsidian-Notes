---
title: Zotero + Obsidian + PDF++ 配置指南（Citations 版）
tags:
  - setup
  - zotero
  - workflow
  - papers
created: 2026-03-16
---

# ⚙️ Zotero + Obsidian + PDF++ 配置指南

> [!abstract] 本方案目标
> **Zotero 收录文献 → Citations 插件导入笔记 → PDF++ 在 Obsidian 内批注**
>
> 采用 `.bib` 文件桥接，完全不依赖 native 模块，兼容所有 Obsidian 版本。

---

## 一、整体架构

```
Zotero（文献管理）
    │
    ├─ Better BibTeX ──→ 自动导出 library.bib（纯文本，实时更新）
    │
    └─ Citations（Obsidian 插件）
           │  读取 library.bib 文件，无需 Zotero 运行
           └─ 创建 Paper Note ──→ 自动填充标题、作者、摘要等元数据

Zotero 附件存储
    │
    └─ PDF 复制到 Vault ──→ PDF++ 批注（高亮写入 PDF 本身）
```

---

## 二、Zotero 端配置

### 2.1 安装 Better BibTeX（如未安装）

1. 下载：https://retorque.re/zotero-better-bibtex/installation/
2. Zotero → **工具 → 附加组件 → 从文件安装** → 选 `.xpi`
3. 重启 Zotero
4. **编辑 → 首选项 → Better BibTeX → Citation key formula**：
   ```
   auth.lower + shorttitle(3,3) + year
   ```

### 2.2 配置 BBT 自动导出

1. Zotero → **文件 → 导出文献库**
2. 格式选 **Better BibLaTeX**
3. 勾选 **Keep updated**（每次文献变动自动刷新）
4. 保存路径：`D:\Obsidian Vault\Personal\Papers\library.bib`

> [!note] `library.bib` 说明
> 这个文件由 BBT 自动维护，不需要手动编辑。Citations 插件读取它来获取文献数据。

### 2.3 配置 PDF 存储路径（可选，推荐）

让 Zotero 把 PDF 直接存到 Vault，省去手动复制：

**Zotero → 编辑 → 首选项 → 高级 → Linked Attachment Base Directory**：
```
D:\Obsidian Vault\Personal\Papers\Attachments\PDFs
```

之后在 Zotero 添加文献时选 **"添加链接文件副本"**（非"存储副本"），PDF 自动落在 Vault 里。

---

## 三、Obsidian 端配置

### 3.1 必装插件

| 插件 | 用途 | 搜索关键词 |
|------|------|------------|
| **Citations** | 读取 `.bib`，一键创建 Paper Note | `Citations` |
| **PDF++** | PDF 高亮批注，批注写入文件本身 | `PDF++` |
| **Dataview** | 论文库 Dashboard 渲染 | `Dataview` |

### 3.2 配置 Citations 插件

**设置 → Citations**：

| 字段                                   | 填写                          |
| ------------------------------------ | --------------------------- |
| **Citation database format**         | `BibLaTeX`                  |
| **Citation database path**           | `Public/Papers/library.bib` |
| **Literature note folder**           | `Public/Papers`             |
| **Literature note title template**   | `{{citekey}}`               |
| **Literature note content template** | 见下方                         |

**Literature note content template**（完整粘贴）：

```
---
title: "{{title}}"
citekey: "{{citekey}}"
year: {{year}}
authors: "{{authorString}}"
journal: "{{containerTitle}}"
doi: "{{DOI}}"
url: "{{URL}}"
category:
tags:
  - paper
zotero: "zotero://select/items/@{{citekey}}"
pdf:
status: unread
rating:
date_added: {{importedDate}}
---

# {{title}}

**Authors**: {{authorString}}
**Year**: {{year}}
**Journal/Source**: {{containerTitle}}
**Category**:

> [!abstract] Abstract
> {{abstract}}

---

## 📌 Research Question

> What problem is this paper trying to solve?

## 💡 Main Arguments / Contributions

-

## 🔬 Methods

> Research design, data sources, analytical approach

## 📊 Key Findings

-

## 🔗 Related Literature

| Relation | Paper | Notes |
|----------|-------|-------|
| Supports | [[]] | |
| Challenges | [[]] | |
| Extends | [[]] | |

## 💬 Annotations & Notes

> [!note] Personal Assessment
>

### PDF Highlights

>

---

**Zotero link**: [Open in Zotero](zotero://select/items/@{{citekey}})

---
*[[Public/Papers/00_Papers Index|← Back to Paper Library]]*
```

### 3.3 配置 PDF++ 插件

**设置 → PDF++**：

**① 高亮颜色标签**：

| 颜色 | 标签 | 用途 |
|------|------|------|
| 🟡 黄 | `重点` | 核心论点、关键定义 |
| 🔴 红 | `质疑` | 有争议或不理解处 |
| 🟢 绿 | `方法` | 研究方法、实验设计 |
| 🔵 蓝 | `引用` | 值得引用的表述 |
| 🟣 紫 | `联想` | 触发的灵感或关联 |

**② 复制格式模板（Copy Format）**：

```
> "{{highlight}}"
> — ![[{{file}}#page={{page}}&annotation={{annotationId}}|p.{{page}}]]
{{#if comment}}
> 💬 {{comment}}
{{/if}}
```

**③ 其他**：开启 Backlink highlight color、Hover over PDF links。

---

## 四、核心使用流程

### 📥 流程 A：导入文献元数据 → 创建 Paper Note

```
1. 在 Zotero 中收录文献（Connector / DOI / 拖拽 PDF）
   → BBT 自动更新 library.bib

2. Obsidian：Ctrl+P → "Citations: Open literature note"
   → 搜索标题或作者 → Enter

3. Public/Papers/{{citekey}}.md 自动创建
   → 标题、作者、年份、摘要、DOI 已自动填入
```

### 📄 流程 B：链接 PDF

```
配置了链接附件目录（推荐）：
   PDF 在 Zotero 添加时已自动存入 Vault
   → 在 Paper Note 的 pdf 字段填：
     [[Attachments/PDFs/filename.pdf]]

未配置链接附件目录：
   Zotero 中右键文献 → 在文件管理器中显示附件
   → 复制 PDF 到 Public/Papers/Attachments/PDFs/
   → 填入 pdf 字段
```

### ✏️ 流程 C：PDF++ 批注

```
1. 在 Paper Note 中点击 pdf 字段的链接，打开 PDF
2. 选中文字 → 点击颜色按钮高亮
3. 高亮内容 + 页面跳转链接自动复制到剪贴板
4. 切换回 Paper Note → 粘贴到「PDF 划线摘录」区域
```

> [!tip] 粘贴效果
> ```
> > "干预组的生活困扰显著降低，母胎依恋得分显著提高。"
> > — ![[shokrishams2022.pdf#page=5&annotation=abc123|p.5]]
> ```
> 点击链接直接跳回 PDF 对应位置。

---

## 五、文件夹结构

```
Public/Papers/
├── 00_Papers Index.md       ← Dataview Dashboard
├── 00_Zotero Setup Guide.md ← 本文件
├── library.bib              ← BBT 自动维护，勿手动编辑
├── Humanities/              ← 可手动将笔记移入分类
├── Tech/
└── Attachments/
    ├── PDFs/                ← PDF 文件（批注写入本身）
    └── Images/              ← PDF++ 矩形截图
```

---

## 六、常见问题

> [!faq] Citations 搜索结果为空？
> 确认 `library.bib` 路径填写正确，且文件已由 BBT 生成（打开文件看是否有内容）。Zotero 需至少运行过一次以触发初始导出。

> [!faq] 导入的笔记某些字段为空？
> 该文献在 Zotero 中缺少对应字段（如无摘要、无 DOI）。在 Zotero 中补全后，BBT 自动更新 `.bib`，重新导入即可。

> [!faq] PDF++ 高亮链接点击没反应？
> PDF 必须在 Vault 内部。确认文件已复制到 `Attachments/PDFs/`，且 pdf 字段用的是 wikilink 格式 `[[...]]`。

> [!faq] citekey 重复？
> 在 BBT Citation key formula 末尾加字符，如 `auth.lower + shorttitle(4,4) + year`。

---

*创建：2026-03-16 · [[Public/Papers/00_Papers Index|← 返回论文库]]*
