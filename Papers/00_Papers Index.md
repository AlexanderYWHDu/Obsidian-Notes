---
title: 论文库 · 总览
tags:
  - papers
  - index
  - dashboard
created: 2026-03-16
---

# 📚 论文搜集库

> [!tip] 快速导航
> [[Public/Papers/00_Zotero Setup Guide|⚙️ Zotero + PDF++ 批注配置指南]] · [[Personal/论文工作流|📋 AI 论文写作工作流]]

---

## 📊 阅读看板

### 🔴 待读

```dataview
TABLE
  authors AS "作者",
  year AS "年份",
  category AS "分类",
  rating AS "⭐"
FROM "Public/Papers"
WHERE status = "unread" AND file.name != "00_Papers Index"
SORT date_added DESC
```

### 🟡 阅读中

```dataview
TABLE
  authors AS "作者",
  year AS "年份",
  category AS "分类"
FROM "Public/Papers"
WHERE status = "reading"
SORT date_added DESC
```

### 🟢 已读

```dataview
TABLE
  authors AS "作者",
  year AS "年份",
  category AS "分类",
  rating AS "⭐"
FROM "Public/Papers"
WHERE status = "done"
SORT rating DESC
```

---

## 🗂️ 按分类浏览

### 人文 / 社科

```dataview
TABLE
  authors AS "作者",
  year AS "年份",
  status AS "状态",
  rating AS "⭐"
FROM "Public/Papers/Humanities"
SORT year DESC
```

### 理工 / AI

```dataview
TABLE
  authors AS "作者",
  year AS "年份",
  status AS "状态",
  rating AS "⭐"
FROM "Public/Papers/Tech"
SORT year DESC
```

---

## 📈 统计

```dataview
TABLE WITHOUT ID
  "总论文数" AS 指标, length(rows) AS 数量
FROM "Public/Papers"
WHERE file.name != "00_Papers Index" AND file.name != "00_Zotero Setup Guide"
FLATTEN 1 AS dummy
GROUP BY dummy
```

```dataview
TABLE WITHOUT ID
  status AS "状态",
  length(rows) AS "数量"
FROM "Public/Papers"
WHERE file.name != "00_Papers Index" AND file.name != "00_Zotero Setup Guide" AND status
GROUP BY status
```

---

## ⭐ 精选（Rating ≥ 4）

```dataview
TABLE
  authors AS "作者",
  year AS "年份",
  category AS "分类",
  rating AS "⭐"
FROM "Public/Papers"
WHERE rating >= 4
SORT rating DESC
```

---

## 🏷️ 按标签检索

```dataview
TABLE
  tags AS "标签",
  year AS "年份",
  status AS "状态"
FROM "Public/Papers"
WHERE file.name != "00_Papers Index" AND file.name != "00_Zotero Setup Guide"
SORT file.mtime DESC
LIMIT 20
```

---

*最后更新：自动 · 由 Dataview 渲染*
