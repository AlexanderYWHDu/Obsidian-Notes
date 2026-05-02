---
week: <% tp.file.title %>
month: <% tp.date.now("YYYY-MM", 0, tp.file.title + "-1", "YYYY-[W]ww-e") %>
year: <% tp.date.now("YYYY", 0, tp.file.title + "-1", "YYYY-[W]ww-e") %>
tags:
  - weekly
---
#weekly

<%*
const monday = tp.date.now("YYYY-MM-DD", 0, tp.file.title + "-1", "YYYY-[W]ww-e");
const days = [];
for (let i = 0; i < 7; i++) {
  days.push(tp.date.now("YYYY-MM-DD", i, monday, "YYYY-MM-DD"));
}
const [d0,d1,d2,d3,d4,d5,d6] = days;
-%>
← [[<% tp.date.now("YYYY-[W]ww", -7, tp.file.title + "-1", "YYYY-[W]ww-e") %>]] | [[<% tp.date.now("YYYY-MM", 0, tp.file.title + "-1", "YYYY-[W]ww-e") %>]] | [[<% tp.date.now("YYYY-[W]ww", 7, tp.file.title + "-1", "YYYY-[W]ww-e") %>]] →

---

## 📊 本周热力图

```contributionGraph
title: 本周得分
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
fromDate: <% monday %>
toDate: <% d6 %>
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

```dataview
TABLE mental_state AS "状态", sleep_quality AS "睡眠", cycle_phase AS "周期"
FROM "Daily"
WHERE week = "<% tp.file.title %>"
SORT file.name ASC
```

---

## 📌 本周最高优先级

> [!important] 这周结束时，完成哪 3 件事会让你觉得值得？

- [ ] 🔺
- [ ] 🔺
- [ ] 🔺

> [!tip] 月度目标
> ![[<% tp.date.now("YYYY-MM", 0, tp.file.title + "-1", "YYYY-[W]ww-e") %>#🎯 月度目标]]

---

## 📅 每日概览

| 日期 | 核心任务 | 状态 |
|------|----------|------|
| 一 [[<% d0 %>]] | | |
| 二 [[<% d1 %>]] | | |
| 三 [[<% d2 %>]] | | |
| 四 [[<% d3 %>]] | | |
| 五 [[<% d4 %>]] | | |
| 六 [[<% d5 %>]] | | |
| 日 [[<% d6 %>]] | | |

---

## 🌾 本周收获汇总

### 学习上
![[<% d0 %>#学习上]]
![[<% d1 %>#学习上]]
![[<% d2 %>#学习上]]
![[<% d3 %>#学习上]]
![[<% d4 %>#学习上]]
![[<% d5 %>#学习上]]
![[<% d6 %>#学习上]]

### 感兴趣的
![[<% d0 %>#感兴趣的]]
![[<% d1 %>#感兴趣的]]
![[<% d2 %>#感兴趣的]]
![[<% d3 %>#感兴趣的]]
![[<% d4 %>#感兴趣的]]
![[<% d5 %>#感兴趣的]]
![[<% d6 %>#感兴趣的]]

---

## 🥺 本周阻碍

![[<% d0 %>#🥺 遇到的阻碍]]
![[<% d1 %>#🥺 遇到的阻碍]]
![[<% d2 %>#🥺 遇到的阻碍]]
![[<% d3 %>#🥺 遇到的阻碍]]
![[<% d4 %>#🥺 遇到的阻碍]]
![[<% d5 %>#🥺 遇到的阻碍]]
![[<% d6 %>#🥺 遇到的阻碍]]

---

## 🌌 感想汇总

![[<% d0 %>#🌌 感想]]
![[<% d1 %>#🌌 感想]]
![[<% d2 %>#🌌 感想]]
![[<% d3 %>#🌌 感想]]
![[<% d4 %>#🌌 感想]]
![[<% d5 %>#🌌 感想]]
![[<% d6 %>#🌌 感想]]

---

## 📍 任务追踪

![[<% d0 %>#✅ 其他计划]]
![[<% d1 %>#✅ 其他计划]]
![[<% d2 %>#✅ 其他计划]]
![[<% d3 %>#✅ 其他计划]]
![[<% d4 %>#✅ 其他计划]]
![[<% d5 %>#✅ 其他计划]]
![[<% d6 %>#✅ 其他计划]]

---

## 🔁 周回顾

**这周做得好的：**
-

**这周可以改进的：**
-

**下周要注意的：**
-
