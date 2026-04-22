# ColorPhage Forest Family 候选草案

## 1. 当前定位

`forest` 是 ColorPhage 第一个进阶 family 候选。

它的任务不是替代 `soft` 或 `vivid`，而是提供一种更有主题感的科研配色：

- 自然
- 稳健
- 有机
- 克制
- 有生命科学气质

## 2. 为什么先做 forest

当前建议优先做 `forest`，原因是：

- 与 ColorPhage 的生命科学和 phage 语境贴合
- 与已完成的 simple modes 有明显区分
- 适合微生物、生态、环境、宿主、组织微环境等科研场景
- 容易形成用户可记忆的风格联想

## 3. 首批候选

### 3.1 `forest_canopy`

颜色：

```text
#23483A
#6F8F62
#A9B98F
#6F9092
#D6B36A
#C98563
#8A4A58
#E6DCC6
```

定位：

- 稳重林冠层
- 深绿作为锚点
- 灰青与苔绿建立自然层次
- 砖红和浆果色作为克制强调

科研实例：

- 微生物群落组成图
- 不同生态位或样本来源比较
- 多组环境来源堆叠柱状图

### 3.2 `forest_moss`

颜色：

```text
#557A5C
#8CA97A
#B8C6A3
#789C9A
#AFC6C2
#D7C8A5
#C99576
#7A5B4E
```

定位：

- 柔和苔藓层
- 更温和、更湿润
- 适合长期观看和统计图

科研实例：

- 多处理组箱线图或散点图
- 肠道菌群与环境因子关联
- 代谢组或表型分组比较

### 3.3 `forest_ember`

颜色：

```text
#1F3F35
#496B57
#7E916A
#B8B58B
#536E76
#9A6B5A
#C46F52
#D7C6A1
```

定位：

- 森林余烬
- 深绿和冷灰绿为主体
- 暖色锚点更明显
- 更适合主结果强调

科研实例：

- 疾病组对照图
- 干预组机制图
- 需要突出关键组别的主文图

## 4. 预览文件

当前预览页面：

- [forest_family_candidates_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\forest_family_candidates_preview.html)

图像资产：

- [forest_family_preview_figures](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\forest_family_preview_figures)

## 5. 审阅重点

建议审阅时重点看：

- 是否足够区别于现有 `soft` 和 `vivid`
- 是否有科研论文图的克制感
- 暖色锚点是否过强或刚好
- UMAP-like 图中类别是否足够区分
- 哪一组最适合作为 `forest` 默认

## 6. 当前建议

当前初步建议：

- 默认候选优先看 `forest_canopy`
- 更柔和应用看 `forest_moss`
- 更强调主结果看 `forest_ember`

如果审阅通过，再将保留版本写入 R 包 palette 数据。
