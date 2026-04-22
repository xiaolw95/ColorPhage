# ColorPhage Ocean Family 候选草案

## 1. 当前定位

`ocean` 是 ColorPhage 第三个进阶 family 候选。

它的任务是提供一种清洁、流动、偏冷、适合组学和连续结构图的科研配色：

- 海水感
- 清洁感
- 流动感
- 冷静但不机械
- 适合复杂数据中的层次表达

## 2. 为什么第三个做 ocean

当前已完成：

- `forest`：自然、有机、生命科学语境
- `mineral`：冷静、理性、临床和方法学语境

`ocean` 可以继续扩展冷色体系，但比 `mineral` 更流动、更轻盈，更适合：

- 组学分层
- 热图旁注
- 连续变量分组
- 空间图
- 多样本来源比较
- 需要清洁感的主文图

## 3. 首批候选

### 3.1 `ocean_current`

颜色：

```text
#1F4E5F
#337A84
#62A5A7
#A7CED1
#D8E7E4
#7FA6C2
#C99A6B
#B6635C
```

定位：

- 海流主线
- 蓝绿、浅海青、冷白和少量暖色锚点
- 最适合作为默认 ocean

科研实例：

- 组学样本分层
- 多来源样本比较
- 需要清洁区分的主文散点图

### 3.2 `ocean_glass`

颜色：

```text
#3E6674
#6D94A0
#9DB9C0
#D4E1DE
#B7CDC7
#86A9B8
#D6B48A
#A87573
```

定位：

- 海玻璃、磨砂蓝绿
- 更柔和、更透明
- 适合低刺激、长时间阅读的论文图

科研实例：

- 主文统计图
- 临床队列分层图
- 多组箱线图或点图

### 3.3 `ocean_depth`

颜色：

```text
#123B4A
#245E70
#3F8292
#7EB1B8
#BFD8D6
#5F7895
#9B6E7B
#D08965
```

定位：

- 深海层次
- 更强主次结构
- 适合 UMAP-like、空间图和需要深色锚点的图

科研实例：

- 单细胞聚类图
- 空间转录组分区
- 多亚型结果图

## 4. 预览文件

当前预览页面：

- [ocean_family_candidates_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\ocean_family_candidates_preview.html)

图像资产：

- [ocean_family_preview_figures](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\ocean_family_preview_figures)

## 5. 审阅重点

建议审阅时重点看：

- 是否区别于 `mineral`
- 是否足够清洁但不单调
- 蓝绿颜色在 UMAP-like 图中是否容易混淆
- 暖色锚点是否必要且克制
- 哪一组最适合作为 `ocean` 默认

## 6. 当前建议

当前初步建议：

- 默认候选优先看 `ocean_current`
- 更柔和透明应用看 `ocean_glass`
- 更强调空间和分群看 `ocean_depth`

如果审阅通过，再将保留版本写入 R 包 palette 数据。
