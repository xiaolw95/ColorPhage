# ColorPhage 当前状态与下一步路线

## 1. 当前项目阶段

截至当前版本，ColorPhage 已从第一阶段的需求、审美系统与首批 palette 资产建设，进入简单模式 MVP 的可试用原型阶段。

当前已经完成的重点包括产品定义、首批简单模式 palette、最小 R 包骨架、R CMD check 验证，以及 simple modes gallery。

## 2. 已完成内容

### 2.1 产品定位

已明确 ColorPhage 的核心定位：

- 面向科研论文配图的 R 配色包
- 核心目标是好看、足够区分、符合科研审美、可发表
- 不做纯期刊复刻，也不做普通 palette 集合
- 强调少量参数即可得到高质量科研图配色

### 2.2 模式结构

已确定三层产品结构：

- 简单模式
- 进阶 family 模式
- 后续定制生成模式

### 2.3 简单模式

简单模式已确定为两类：

- `soft`：淡雅、柔和、低攻击性、适合大多数论文图
- `vivid`：强烈、醒目、有视觉锚点、适合强调差异

### 2.4 `soft` 首批 8 色版本

`soft` 三条分支已完成语义化命名，并完成最终 `n = 8` 预览页。

当前有效 ID：

- `soft_breeze`
- `soft_harbor`
- `soft_mist`

当前默认建议：

- `mode = "soft"` 默认映射到 `soft_harbor`

最终预览页：

- [soft_breeze_n8_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\soft_breeze_n8_preview.html)
- [soft_harbor_n8_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\soft_harbor_n8_preview.html)
- [soft_mist_n8_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\soft_mist_n8_preview.html)

### 2.5 `vivid` 首批 8 色版本

`vivid` 三条分支已完成 `n = 8` 预览页。

当前有效 ID：

- `vivid_core`
- `vivid_fresh`
- `vivid_drama`

当前默认建议：

- `mode = "vivid"` 默认映射到 `vivid_core`

最终预览页：

- [vivid_core_n8_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\vivid_core_n8_preview.html)
- [vivid_fresh_n8_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\vivid_fresh_n8_preview.html)
- [vivid_drama_n8_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\vivid_drama_n8_preview.html)

### 2.6 审美规范

已建立最小审美规范：

- 低到中等饱和度优先
- 好看和可区分并重
- 高对比不等于高刺眼
- 柔和不等于发灰没精神
- 颜色必须服务于科研图结构

### 2.7 参考图体系

已建立参考图目录和初步筛选机制：

- 原始图片库：[raw_images/pic](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\references\raw_images\pic)
- `soft` 参考：[soft_candidates](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\references\curated\curated_references\soft_candidates)
- `vivid_drama` 参考：[vivid_drama_rework](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\references\curated\curated_references\vivid_drama_rework)

## 3. 当前尚未完成内容

### 3.1 R 包代码

已完成最小骨架，正式仓库位于：

- [github_repo/ColorPhage](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage)
- [DESCRIPTION](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage\DESCRIPTION)
- [NAMESPACE](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage\NAMESPACE)
- [R/data-palettes.R](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage\R\data-palettes.R)
- [R/phage-palette.R](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage\R\phage-palette.R)
- [R/ggplot-scales.R](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage\R\ggplot-scales.R)
- [tests/testthat](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage\tests\testthat)

尚未完成：

- 人工审阅 gallery
- 用更真实的科研数据示例继续验证 scale 函数

已完成：

- 独立 GitHub 仓库目录已通过 `R CMD check --no-manual`
- simple modes gallery 已生成
- 可复用开发脚本已创建并验证

### 3.2 API 落地

已有初版实现：

- `phage_palette()`
- `scale_color_phage()`
- `scale_fill_phage()`

尚未实现：

- `theme_phage()`

### 3.3 palette 数据结构

当前 6 组 `n = 8` 已转成包内数据结构，保存在：

- [R/data-palettes.R](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage\R\data-palettes.R)

对应结构说明保存在：

- [palette_data_structure_draft.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\planning\palette_data_structure_draft.md)

### 3.4 进阶 family 模式

已确定第一批 family：

- `mist`
- `mineral`
- `forest`
- `ocean`
- `cinema`
- `retro`

但尚未开始为这些 family 设计首批 palette 和网页预览。

### 3.5 连续与发散色板

当前已完成的是离散 palette 的第一批 8 色版本。

尚未开始：

- continuous palette
- diverging palette
- heatmap 适配策略

## 4. 当前实际进度判断

如果按照最初开发阶段划分：

1. 定规范
2. 做颜色资产
3. 做核心 API
4. 接 ggplot2
5. 做 gallery 与文档

当前状态是：

- 阶段 1 基本完成
- 阶段 2 已完成简单模式的第一批核心资产
- 阶段 2 的进阶 family 资产尚未开始
- 阶段 3 已开始，完成了最小 R 包骨架和核心 API 初版
- 独立 GitHub 仓库已创建、已完成首次 commit、已推送到 GitHub，并已通过 `R CMD check --no-manual`
- 当前 simple modes gallery 已升级为真实 `ggplot2` 示例 gallery

因此我们正处在：

> 从“简单模式可版本化 MVP”过渡到“真实 ggplot2 gallery 人工审阅、进阶 family 设计与高数量扩展”的节点。

## 5. 下一步建议

### 5.1 最推荐的下一步

下一步建议优先做：

1. 人工审阅真实 `ggplot2` gallery
2. 如需调整，优先调整图形场景或 palette 显示细节
3. 若 gallery 认可，进入第一个进阶 family 设计
4. 后续按稳定节点继续 commit 并 push

原因：

- 当前简单模式颜色已经确认并已转入代码
- 当前代码已经通过 `R CMD check`
- 当前 MVP 已经推送到 GitHub，有可靠回退点
- 真实 `ggplot2` gallery 已经建立，后续 palette 判断可以基于更接近实际科研图的场景

### 5.2 具体执行顺序

建议接下来按以下顺序推进：

1. 新建 `palette_data_structure_draft.md`
2. 定义内部 palette 数据字段
3. 确认默认映射：
   - `mode = "soft"` -> `soft_harbor`
   - `mode = "vivid"` -> `vivid_core`
4. 建立第一份机器可读 palette 文件
5. 创建 R 包骨架
6. 实现 `phage_palette()`
7. 实现 `scale_color_phage()` 与 `scale_fill_phage()`
8. 用当前 6 组 palette 做最小 gallery

当前第 1 到第 8 步已经完成，并已完成首次 commit、GitHub 推送和真实 `ggplot2` gallery 升级；下一步应人工审阅 gallery 或开始进阶 family 设计。

### 5.3 可以暂缓的事项

以下事项可以暂缓，不建议现在优先做：

- `n = 12` 扩展
- 进阶 family 的全部 palette
- 自然语言生成模式
- `theme_phage()`
- 连续和发散色板

原因：

- 当前最重要的是把已经确认的颜色资产变成可调用能力
- 先形成最小可运行包，再继续扩展 palette 数量会更稳

## 6. 当前推荐里程碑

### Milestone A：简单模式可调用

目标：

- 用户可以通过 `phage_palette(n = 8, mode = "soft")` 调用颜色
- 用户可以通过 `phage_palette(n = 8, mode = "vivid")` 调用颜色
- 支持指定具体 palette ID

### Milestone B：ggplot2 可用

目标：

- `scale_color_phage()`
- `scale_fill_phage()`
- 能用于柱状图、散点图、折线图

当前状态：

- 基础 scale 函数已实现
- gallery 已生成简化柱状图、散点图和折线图预览
- 正式仓库已通过 `R CMD check --no-manual`

### Milestone C：展示与验证

目标：

- 建立 gallery
- 用真实科研图示例展示 6 组 palette
- 检查默认输出是否符合审美规范

当前状态：

- simple modes gallery 已升级为真实 `ggplot2` 示例 gallery
- 用户已确认当前 gallery 没有问题
- 根目录文档已同步到正式 R 包仓库，开发流程脚本已复测通过
- MVP 已推送到 GitHub
- 当前真实 `ggplot2` gallery 尚待用户审阅

## 7. 当前结论

当前不建议继续无边界扩展新 palette。

更合理的推进方式是：

> 先审阅当前真实 `ggplot2` gallery，如果展示逻辑认可，再开始第一个进阶 family。

当前 ColorPhage 已经进入“可版本化迭代的 R 包 MVP”阶段。
