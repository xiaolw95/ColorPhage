# ColorPhage Retro Family 候选草案

## 1. 当前定位

`retro` 是 ColorPhage 第四个进阶 family 候选。

它的任务是提供一种温暖、沉静、有时间感的科研配色：

- 旧纸张
- 胶片感
- 温暖土色
- 柔和砖红
- 带一点叙事性，但不脏旧

## 2. 为什么做 retro

当前已完成：

- `forest`：自然、有机
- `mineral`：冷静、理性
- `ocean`：清洁、流动

`retro` 可以补足温暖叙事型场景，适合：

- 综述图
- 机制示意图
- 时间序列图
- 历史队列或长期随访图
- 需要更有人文温度的科研图

## 3. 首批候选

### 3.1 `retro_film`

颜色：

```text
#4A4E46
#6F7764
#A19B72
#D5C08A
#E6D5B8
#C7835F
#A6534B
#6C596E
```

定位：

- 胶片绿、旧纸张、柔和砖红
- 最适合作为默认 retro

科研实例：

- 综述型机制图
- 纵向队列结果
- 主文叙事型统计图

### 3.2 `retro_paper`

颜色：

```text
#5F5A4A
#8C8060
#B8A878
#E2D0A8
#D8BFA3
#B87962
#8E5A58
#586A73
```

定位：

- 旧纸张和温暖土色
- 更柔和、更适合长期阅读

科研实例：

- 图文摘要
- 机制模块分组
- 多时间点趋势图

### 3.3 `retro_signal`

颜色：

```text
#3F4A46
#697464
#9B956C
#D3AE62
#E4CDA6
#C66F54
#93485A
#526A82
```

定位：

- 复古底色 + 更清晰信号色
- 更适合需要突出主结果的图

科研实例：

- 干预组对照图
- 疾病进展图
- 主结果强调图

## 4. 预览文件

当前预览页面：

- [retro_family_candidates_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\retro_family_candidates_preview.html)

图像资产：

- [retro_family_preview_figures](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\retro_family_preview_figures)

## 5. 审阅重点

建议审阅时重点看：

- 是否温暖但不陈旧发脏
- 是否适合论文主图而不是海报
- 暖色是否过重
- UMAP-like 图中是否仍有足够区分
- 哪一组最适合作为 `retro` 默认

## 6. 当前建议

当前初步建议：

- 默认候选优先看 `retro_film`
- 更柔和叙事看 `retro_paper`
- 更强调主结果看 `retro_signal`

如果审阅通过，再将保留版本写入 R 包 palette 数据。
