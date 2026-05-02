---
month: <% tp.file.title %>
year: <% tp.date.now("YYYY", 0, tp.file.title + "-01", "YYYY-MM-DD") %>
tags:
  - monthly
---
#monthly

← [[<% tp.date.now("YYYY-MM", -30, tp.file.title + "-01", "YYYY-MM-DD") %>]] | [[<% tp.date.now("YYYY", 0, tp.file.title + "-01", "YYYY-MM-DD") %>]] | [[<% tp.date.now("YYYY-MM", 30, tp.file.title + "-01", "YYYY-MM-DD") %>]] →

# <% tp.date.now("YYYY年M月", 0, tp.file.title + "-01", "YYYY-MM-DD") %>

---

## 📊 本月热力图

```contributionGraph
title: 本月得分
graphType: month-track
showCellRuleIndicators: true
titleStyle:
  textAlign: center
  fontSize: 16px
dataSource:
  type: PAGE
  value: "#daily"
  dateField:
    type: FILE_NAME
    format: yyyy-MM-DD
  countField:
    type: PAGE_PROPERTY
    value: score
fillTheScreen: false
dateRangeType: FIXED_DATE_RANGE
fromDate: <% tp.file.title %>-01
toDate: <% tp.date.now("YYYY-MM", 30, tp.file.title + "-01", "YYYY-MM-DD") %>-01
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

## 🧠 本月心理状态趋势

```dataview
TABLE mental_state AS "状态(1-10)", sleep_quality AS "睡眠", cycle_phase AS "周期", trigger AS "触发"
FROM "Daily"
WHERE month = "<% tp.file.title %>"
SORT file.name ASC
```

---

## 🎯 月度目标

### 必须完成
- [ ]
- [ ]

### 计划完成
- [ ]

### 如果有时间
- [ ]

---

## 📚 课程进度

| 课程 | 本月目标 | 实际进度 | 状态 |
|------|----------|----------|------|
| | | | 🔴/🟡/🟢 |
| | | | 🔴/🟡/🟢 |
| | | | 🔴/🟡/🟢 |

---

## 📅 本月各周

<%*
const base = tp.file.title + "-01";
const thisMonth = tp.file.title;
const weeks = [];
for (let i = 0; i < 5; i++) {
  const w = tp.date.now("YYYY-[W]ww", i * 7, base, "YYYY-MM-DD");
  const wm = tp.date.now("YYYY-MM", i * 7, base, "YYYY-MM-DD");
  if (i === 0 || wm === thisMonth) {
    if (!weeks.includes(w)) weeks.push(w);
  }
}
tR += weeks.map(w => `- [[${w}]]`).join("\n");
-%>

---

## 💪 习惯统计

| 习惯 | 完成天数 |
|------|----------|
| 📖 阅读 / 文献 | |
| 🏃 运动 | |
| 🎹 钢琴 | |
| 🌙 12点前睡觉 | |

---

## 🔁 月末回顾

**最值得记录的一件事：**
>

**哪件事没做到、原因是什么：**
>

**下个月最想改变的一件事：**
>

**本月整体评分：** __ / 10
