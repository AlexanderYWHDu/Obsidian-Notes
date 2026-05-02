---
title: "<%- it.title %>"
citekey: "<%- it.citekey %>"
year: <%- it.year %>
authors: "<%- it.authors?.map(a => a.lastName + (a.firstName ? ', ' + a.firstName : '')).join(' · ') %>"
journal: "<%- it.publicationTitle %>"
doi: "<%- it.DOI %>"
url: "<%- it.url %>"
volume: "<%- it.volume %>"
issue: "<%- it.issue %>"
pages: "<%- it.pages %>"
category:
tags:
  - paper
zotero: "zotero://select/items/@<%- it.citekey %>"
pdf:
status: unread
rating:
date_added: "<%- new Date().toISOString().slice(0,10) %>"
---

# <%- it.title %>

**作者**：<%- it.authors?.map(a => a.lastName + (a.firstName ? ', ' + a.firstName : '')).join('；') %>
**年份**：<%- it.year %>
**期刊/来源**：<%- it.publicationTitle %>
**分类**：

> [!abstract] 摘要
> <%- it.abstract %>

---

## 📌 核心问题

> 这篇论文试图解决什么问题？

## 💡 主要论点 / 贡献

-

## 🔬 方法

> 研究设计、数据来源、分析方法

## 📊 主要发现

-

## 🔗 与其他文献的关系

| 关系 | 文献 | 说明 |
|------|------|------|
| 支持 | [[]] | |
| 反驳 | [[]] | |
| 延伸 | [[]] | |

## 💬 批注 & 笔记

> [!note] 个人评价
>

### PDF 划线摘录

>

---

## 📎 引用信息

```
<%- it.bibliography %>
```

**Zotero 链接**：[在 Zotero 中打开](zotero://select/items/@<%- it.citekey %>)

---
*[[Public/Papers/00_Papers Index|← 返回论文库]]*
