# ColorPhage Cinema Family 候选草案

## 1. 当前定位

`cinema` 是 ColorPhage 第五个进阶 family 候选。

它的任务是提供一种有叙事张力、主次明确、适合突出主结果的科研配色：

- 电影感
- 戏剧张力
- 主次结构
- 深色锚点
- 结果导向

## 2. 为什么做 cinema

当前已完成：

- `forest`：自然、有机
- `mineral`：理性、冷静
- `ocean`：清洁、流动
- `retro`：温暖、叙事

`cinema` 用来补足“主结果聚焦型”风格，适合：

- 主文核心图
- 疾病与对照冲突图
- 机制图中的关键模块
- 需要一眼看到焦点的结果图

## 3. 首批候选

### 3.1 `cinema_noir`

颜色：

```text
#1F2A36
#3C4E63
#6A7D91
#A8B6C2
#D9D5CC
#C59A63
#B45A53
#7A5D78
```

定位：

- 黑白电影式冷暗结构
- 深蓝灰为骨架，暖铜与红褐为锚点

科研实例：

- 疾病组/对照组核心结果
- 机制图关键通路
- 模型优劣对比图

### 3.2 `cinema_marquee`

颜色：

```text
#24313F
#46606F
#72959A
#C1D2CF
#E6DDD1
#D8B06B
#C97B5D
#9A667C
```

定位：

- 更亮、更像灯牌与舞台前景
- 仍然控制在科研审美内

科研实例：

- 主文摘要图
- 关键结果分组图
- 需要更明显视觉锚点的图

### 3.3 `cinema_velvet`

颜色：

```text
#2A2632
#51455E
#7B6B82
#A9B0B9
#D8D0C8
#B89B6F
#A95C58
#5C7288
```

定位：

- 更偏丝绒与剧场感
- 紫灰和暖铜更明显

科研实例：

- 机制示意图
- 多亚型主结果图
- 需要叙事感但仍然发表友好的图

## 4. 预览文件

当前预览页面：

- [cinema_family_candidates_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\cinema_family_candidates_preview.html)

图像资产：

- [cinema_family_preview_figures](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\cinema_family_preview_figures)

## 5. 审阅重点

建议审阅时重点看：

- 是否足够聚焦但不廉价
- 暗色锚点是否压图
- 暖色是否高级
- 是否比 `vivid_drama` 更有“主结果感”
- 哪一组最适合作为 `cinema` 默认

## 6. 当前建议

当前初步建议：

- 默认候选优先看 `cinema_noir`
- 更亮的主结果图看 `cinema_marquee`
- 更有戏剧感的图看 `cinema_velvet`

如果审阅通过，再将保留版本写入 R 包 palette 数据。
