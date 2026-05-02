---
tags:
  - dashboard
aliases:
  - home
  - 总览
cssclasses:
  - dashboard
---

# 🏠 Dashboard

```dataviewjs
const today = dv.date("today");
const todayStr = today.toFormat("yyyy-MM-dd");
const weekStr = today.toFormat("kkkk-'W'WW");
const monthStr = today.toFormat("yyyy-MM");
const quarterNum = Math.ceil(today.month / 3);
const quarterStr = `${today.year}-Q${quarterNum}`;
const yearStr = String(today.year);

dv.paragraph(
  `**今天** [[Daily/${todayStr}|${todayStr}]] ｜ ` +
  `**本周** [[Weekly/${weekStr}|${weekStr}]] ｜ ` +
  `**本月** [[Monthly/${monthStr}|${monthStr}]] ｜ ` +
  `**本季** [[Quarterly/${quarterStr}|${quarterStr}]] ｜ ` +
  `**本年** [[Yearly/${yearStr}|${yearStr}]]`
);
```

---

## 📊 近 30 天热力图

```contributionGraph
title: 近 30 天得分
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
dateRangeType: RECENT_DAYS_BEFORE_TODAY
recentDays: 30
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

## 🧠 近 7 天心理状态

```dataview
TABLE mental_state AS "状态", sleep_quality AS "睡眠", cycle_phase AS "周期", trigger AS "触发", agitation AS "激越"
FROM "Daily"
SORT file.name DESC
LIMIT 7
```

---

## ⚡ 当前任务

```tasks
not done
scheduled before tomorrow
hide scheduled date
hide due date
hide backlink
limit 10
```

---

## 🔺 高优先级

```tasks
not done
priority is high
hide priority
limit 8
```

---

## 📅 即将到期（7天内）

```tasks
not done
due before in 7 days
sort by due
hide backlink
limit 15
```

---

## 📚 进行中的课程

```dataview
TABLE file.mtime AS "最后修改"
FROM "Courses"
WHERE file.name = "MOC" OR contains(file.name, "MOC")
SORT file.mtime DESC
```

---

## 📖 最近修改的笔记

```dataview
TABLE file.mtime AS "修改时间"
FROM "Knowledge" OR "Papers" OR "Courses"
SORT file.mtime DESC
LIMIT 10
```

---

## 🗺 快速入口

| 区域 | 链接 |
|------|------|
| 📅 计划总览 | [[Plans/00 Overview]] |
| 📄 论文索引 | [[Papers/00_Papers Index]] |
| 🎹 钢琴计划 | [[Projects/Piano/钢琴手指练习计划]] |
| 💡 灵感速记 | [[Fleeting/]] |
| 📦 example-library | [[example-library/⏰ 时间管理系统简介]] |
