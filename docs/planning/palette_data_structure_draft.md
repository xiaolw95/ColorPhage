# ColorPhage Palette 数据结构草案

## 1. 文档目的

本文件记录 ColorPhage 第一版 R 包内部 palette 数据结构。

当前目标是先支持已经确认的 6 组简单模式 `n = 8` palette，并为后续进阶 family 留出扩展空间。

## 2. 当前实现范围

第一版 MVP 只实现简单模式：

- `soft`
- `vivid`

当前不实现：

- `mist` / `mineral` / `forest` / `ocean` / `cinema` / `retro`
- continuous palette
- diverging palette
- prompt-based generation

## 3. 当前 palette ID

### 3.1 `soft`

- `soft_breeze`
- `soft_harbor`
- `soft_mist`

默认映射：

- `mode = "soft"` -> `soft_harbor`

### 3.2 `vivid`

- `vivid_core`
- `vivid_fresh`
- `vivid_drama`

默认映射：

- `mode = "vivid"` -> `vivid_core`

## 4. 内部字段

每个 palette 当前包含：

- `id`
- `mode`
- `variant`
- `display_name`
- `role`
- `colors`

后续可以补充：

- `family`
- `type`
- `source_reference`
- `recommended_plot_types`
- `avoid_plot_types`
- `display_alias`
- `cultural_reference`

## 5. 当前 R 实现

当前数据保存在：

- [R/data-palettes.R](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage\R\data-palettes.R)

当前核心入口：

- [R/phage-palette.R](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage\R\phage-palette.R)
- [R/ggplot-scales.R](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage\R\ggplot-scales.R)

## 6. 当前 API

### 6.1 主入口

```r
phage_palette(n, mode = "soft")
phage_palette(n, mode = "vivid")
phage_palette(n, palette = "soft_breeze")
phage_palette(n, mode = "vivid", variant = "drama")
```

### 6.2 ggplot2 适配

```r
p + scale_color_phage(mode = "soft")
p + scale_fill_phage(mode = "vivid", variant = "fresh")
```

## 7. 当前限制

当前 MVP 限制：

- `n` 必须在 1 到 8 之间
- 超过 8 会报错
- 暂不做自动插值或自动扩展

这样做的原因是：

- 当前每组只审美确认到 `n = 8`
- 高类别扩展应单独设计，不应机械插值
- 先保证第一版输出稳定
