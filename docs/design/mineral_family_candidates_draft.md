# ColorPhage Mineral Family 候选草案

## 1. 当前定位

`mineral` 是 ColorPhage 第二个进阶 family 候选。

它的任务是提供一种更冷静、理性、结构感更强的科研配色：

- 矿物感
- 临床感
- 方法学感
- 稳定、克制、可信
- 有硬质边界，但不冷漠

## 2. 为什么第二个做 mineral

`forest` 已经建立了自然、有机、生命科学语境。第二个 family 应该拉开风格差异。

`mineral` 的优势是：

- 与 `forest` 的自然有机感形成对照
- 与 `soft` 的柔和感、`vivid` 的冲击感都有明显区别
- 适合临床队列、方法比较、模型性能、机制统计和多组实验结果
- 蓝灰、石板、矿物青、铁锈色很容易形成高级科研审美

## 3. 首批候选

### 3.1 `mineral_slate`

颜色：

```text
#26384A
#536879
#7F95A3
#AFC0C8
#D7D2C3
#B8A27A
#A46F5E
#6E4F63
```

定位：

- 石板蓝灰主线
- 最稳重、最像默认 mineral
- 有冷静临床和方法学图的气质

科研实例：

- 临床亚组比较
- 模型 benchmark
- 多方法性能对比图

### 3.2 `mineral_quartz`

颜色：

```text
#415A66
#6F8790
#9EB0B4
#D8DED9
#C9BEA5
#9E8E70
#C48B73
#7C6B82
```

定位：

- 更浅、更通透
- 石英、冷砂、雾灰蓝
- 适合主文统计图和需要长期阅读的图

科研实例：

- 多组散点图
- 组学分层统计
- 低刺激论文主图

### 3.3 `mineral_oxide`

颜色：

```text
#2B3F4A
#4E6B73
#789097
#B5C1BE
#D4C6A8
#B9825D
#A9574E
#5E4A5D
```

定位：

- 冷矿物底色 + 氧化铁暖色锚点
- 三个候选中主次冲突最明显
- 适合需要突出关键组别的结果图

科研实例：

- 疾病组/干预组主结果
- 机制图中关键模块强调
- 多组实验中需要暖色重点的图

## 4. 预览文件

当前预览页面：

- [mineral_family_candidates_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\mineral_family_candidates_preview.html)

图像资产：

- [mineral_family_preview_figures](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\mineral_family_preview_figures)

## 5. 审阅重点

建议审阅时重点看：

- 是否区别于 `forest`
- 是否足够冷静但不沉闷
- 暖色锚点是否高级、克制
- UMAP-like 图中蓝灰系是否容易混淆
- 哪一组最适合作为 `mineral` 默认

## 6. 当前建议

当前初步建议：

- 默认候选优先看 `mineral_slate`
- 更柔和通透应用看 `mineral_quartz`
- 更强调主结果看 `mineral_oxide`

如果审阅通过，再将保留版本写入 R 包 palette 数据。
