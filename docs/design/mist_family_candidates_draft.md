# ColorPhage Mist Family 候选草案

## 1. 当前定位

`mist` 是 ColorPhage 第六个进阶 family 候选。

它的任务是提供一种低冲突、安静、轻盈、雾感的科研配色：

- 雾感
- 轻盈
- 安静
- 温和
- 主文长期阅读友好

## 2. 为什么最后做 mist

`mist` 很重要，但它与 `soft` 的距离最近，所以放在后面更合适。

当前已完成的 family 已经覆盖：

- 自然、有机
- 冷静、理性
- 清洁、流动
- 温暖、叙事
- 聚焦、戏剧

现在再做 `mist`，更容易把它做成一种“高级而克制的轻雾系统”，而不是简单重复 `soft`。

## 3. 首批候选

### 3.1 `mist_cloud`

颜色：

```text
#8CA0B3
#B3C0C9
#D8E0DE
#E8E5DE
#E0D1C9
#C9B7C4
#A8B2C7
#CFC6D8
```

定位：

- 云层、浅雾、低冲突
- 最适合作为默认 mist

科研实例：

- 主文统计图
- 补充材料趋势图
- 多组轻量分层图

### 3.2 `mist_lilac`

颜色：

```text
#9EA6C4
#C0C6D8
#DDE2E8
#E9E6E1
#D9CFD4
#C7B8C8
#B6C6D4
#E0D7E5
```

定位：

- 更偏淡紫和雾蓝
- 更适合温和叙事型主图

科研实例：

- 多时间点变化图
- 细胞亚群温和比较图
- 低刺激主文图

### 3.3 `mist_shell`

颜色：

```text
#95A7A0
#B9C7C1
#DDE3DE
#EAE2D7
#D8C7BC
#C6B6AA
#B8C5D1
#D9D1DA
```

定位：

- 贝壳白、雾灰绿、浅沙色
- 比前两组略暖

科研实例：

- 机制模块图
- 综述补充图
- 长时间阅读的统计图

## 4. 预览文件

当前预览页面：

- [mist_family_candidates_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\mist_family_candidates_preview.html)

图像资产：

- [mist_family_preview_figures](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\mist_family_preview_figures)

## 5. 审阅重点

建议审阅时重点看：

- 是否与 `soft` 有足够区别
- 是否足够轻盈但不发灰
- 是否适合长期阅读
- UMAP-like 图中是否仍可区分
- 哪一组最适合作为 `mist` 默认

## 6. 当前建议

当前初步建议：

- 默认候选优先看 `mist_cloud`
- 更偏紫雾应用看 `mist_lilac`
- 更偏沙色和贝壳白应用看 `mist_shell`

如果审阅通过，再将保留版本写入 R 包 palette 数据。
