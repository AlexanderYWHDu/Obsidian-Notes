---
year: <% tp.file.title %>
tags:
  - yearly
---
#yearly

# <% tp.file.title %> 年度总结

← [[<% tp.date.now("YYYY", -365) %>]] | [[<% tp.date.now("YYYY", 365) %>]] →

---

## 📊 全年热力图

```contributionGraph
title: <% tp.file.title %> 全年得分
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
dateRangeType: FIXED_DATE_RANGE
fromDate: <% tp.file.title %>-01-01
toDate: <% tp.file.title %>-12-31
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

## 🗓 四个季度

- [[<% tp.file.title %>-Q1]] — Winter
- [[<% tp.file.title %>-Q2]] — Spring
- [[<% tp.file.title %>-Q3]] — Summer
- [[<% tp.file.title %>-Q4]] — Fall

---

## 📖 自学计划执行情况

> 参考 [[Plans/00 Overview|自学计划总览]]

---

## 🔁 年度反思

**今年最重要的三件事：**
1.
2.
3.

**今年最大的改变：**
>

**明年最想做到的一件事：**
>

**给明年的自己一句话：**
>
