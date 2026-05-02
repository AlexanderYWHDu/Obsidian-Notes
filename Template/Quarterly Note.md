---
quarter: <% tp.file.title %>
year: <% tp.file.title.split("-")[0] %>
tags:
  - quarterly
---
#quarterly

# <% tp.file.title %>

> 季度记对接学期规划，连接 [[Plans/00 Overview|自学计划总览]]。

---

## 📌 对应学期计划

<%*
const parts = tp.file.title.split("-Q");
const year = parts[0];
const q = parts[1];
const seasons = {"1": "Winter", "2": "Spring", "3": "Summer", "4": "Fall"};
const season = seasons[q] || "Spring";
tR += `![[Plans/${year} ${season}]]`;
-%>

---

## 🎯 本季度核心目标（3–5 件）

- [ ]
- [ ]
- [ ]

---

## 📚 课程与学习回顾

| 课程 / 书目 | 目标 | 实际 | 反思 |
|-------------|------|------|------|
| | | | |
| | | | |

---

## 📊 季度热力图

```contributionGraph
title: 季度得分总览
graphType: month-track
showCellRuleIndicators: true
dataSource:
  type: PAGE
  value: "#daily"
  dateField:
    type: FILE_NAME
    format: yyyy-MM-DD
  countField:
    type: PAGE_PROPERTY
    value: score
fillTheScreen: true
cellStyleRules:
  - id: low
    color: "#cae7ec"
    min: "1"
    max: "30"
    text: 😅
  - id: mid1
    color: "#8ea6c8"
    min: "30"
    max: "50"
  - id: mid2
    color: "#5d81a1"
    min: "50"
    max: "70"
  - id: high
    color: "#04234b"
    min: "70"
    max: "1000"
    text: 🥳
```

---

## 🧠 心理状态季度回顾

```dataview
TABLE mental_state AS "状态", cycle_phase AS "周期", agitation AS "激越"
FROM "Daily"
WHERE year = this.year
SORT file.name ASC
```

---

## 🔁 季度反思

**这个季度最重要的收获：**
>

**自学计划完成情况：**
>

**下个季度调整方向：**
>
