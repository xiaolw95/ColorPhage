# ColorPhage 项目记录

## 1. 文档目的

本文件用于记录 ColorPhage 项目中的关键讨论、决策、文档新增、结构调整和后续开发操作，以便在后续迭代中进行回溯。

记录原则：

- 尽量按时间顺序记录
- 优先记录关键决策和重要操作
- 对尚未定稿的事项标注为“待讨论”或“待确认”
- 后续每次重要更新都应补充到本文件

## 2. 项目基本信息

- 项目名：`ColorPhage`
- 项目目标：开发一个面向科研论文配图的 R 配色包
- 当前阶段：需求与规范梳理阶段

## 3. 历史记录

### 2026-04-22

#### 3.1 初始方向确认

- 明确项目核心不是单纯可访问性工具，而是“好看并且足够区分，并且符合科研审美可发表”的科研配色系统
- 确认产品定位应强调“高审美质量的科研图配色”
- 明确不将产品定义为顶刊色板复刻工具

#### 3.2 产品结构方向确认

- 确认整体结构分为：
  - 简单模式
  - 进阶模式
  - 定制生成模式

#### 3.3 简单模式定稿

- 简单模式英文名定为：
  - `soft`
  - `vivid`
- 中文解释名定为：
  - `soft` = 淡雅
  - `vivid` = 强烈
- 确认简单模式采用“少量参数直接生成高质量结果”的设计方向
- 确认简单模式本质上应对应两种核心视觉策略，而不是两套固定色板

#### 3.4 进阶模式 family 定稿

- 第一批 MVP family 定为：
  - `mist`
  - `mineral`
  - `forest`
  - `ocean`
  - `cinema`
  - `retro`
- 同时为每个 family 定义了：
  - 风格说明
  - 科研实例场景
  - 视觉边界
  - 最适合图类型
  - 不适合场景

#### 3.5 命名体系定稿

- 采用“三层分离”命名方案：
  - 包名
  - family 名
  - palette 名
- 包名继续使用：`ColorPhage`
- family 名采用画面感词汇，不直接使用 IP 名
- palette 名采用双层结构：
  - 内部稳定 ID
  - 对外展示名
- 确认不同 family 可以有各自偏好的文化联想来源，但不做硬绑定

#### 3.6 API 草案确认

- 第一版 API 采用“一个主入口 + 少量适配函数”
- 当前主结构为：
  - `phage_palette()`
  - `scale_color_phage()`
  - `scale_fill_phage()`
  - `theme_phage()`
- 第一版重点公开参数：
  - `n`
  - `mode`
  - `family`

#### 3.7 开发流程方向确认

- 第一版开发建议分为以下顺序：
  1. 审美规范最小版
  2. 首批 palette 库
  3. `phage_palette()`
  4. `ggplot2` 适配
  5. gallery 与文档

#### 3.8 本次文档创建操作

- 新建需求蓝图草案：
  - [requirements_blueprint_draft.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\planning\requirements_blueprint_draft.md)
- 新建审美规范最小版：
  - [aesthetic_spec_minimum.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\aesthetic_spec_minimum.md)
- 新建项目记录文档：
  - [project_log.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\management\project_log.md)

#### 3.9 参考图片库接入

- 确认 `pic` 文件夹中存在用户此前收集的配色与可视化参考图
- 当前统计到 `pic` 文件夹中约 292 个文件
- 已抽样查看一批“高级感配色”参考图和部分科研图示例

当前观察结论：

- 用户偏好并非单纯高饱和风格，而是“受控的高级感”
- 常见偏好组合为：
  - 冷静底色 + 暖色锚点
  - 柔和中间色 + 深色压轴
- 蓝灰、雾青、湖蓝、森林绿、米白、砖红、绯红等方向值得优先关注

#### 3.10 新增首批 palette 库规划草案

- 新建文档：
  - [palette_library_plan_draft.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\planning\palette_library_plan_draft.md)
- 当前首批规划建议：
  - `soft` 3 组
  - `vivid` 3 组
  - 6 个 family 各 2 组
  - 合计 18 组首批 palette
- 当前建议优先覆盖：
  - `n = 3`
  - `n = 4`
  - `n = 5`
  - `n = 6`

#### 3.11 参考图片全量初筛机制建立

- 确认由于 `pic` 文件夹命名不规则，不能仅凭文件名判断图片价值
- 决定对全部图片做一次“轻量初筛”，而非一开始就做全量深度解读
- 当前统计纳入初筛范围的图片共 290 张：
  - `.png` 191 张
  - `.jpg` 93 张
  - `.bmp` 6 张
- 新建参考图片总索引：
  - [reference_image_index.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\research\reference_image_index.md)
- 初步决定采用：
  - 全量初筛
  - 批次登记
  - 精选后二次分析

#### 3.12 Batch 01 初筛完成

- 已完成 [reference_image_index.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\research\reference_image_index.md) 中 Batch 01 的轻量初筛
- 本批次主要包含：
  - 一组高价值配色板图片
  - 少量文献科研图配色示例
  - 少量示意图
- 当前观察到的高价值规律包括：
  - 冷暖跨色系但秩序稳定
  - 低到中饱和度为主，局部暖色或深色作为锚点
  - 适合 `soft`、`mist`、`retro`、`mineral/cinema` 混合边界的颜色较多
- 当前已加入二次分析候选池的图片包括：
  - `0 (1).png`
  - `0 (3).png`
  - `0 (5).png`
  - `0 (6).png`
  - `0 (7).png`
  - `0 (8).png`
  - `0.png`
  - `000.png`
  - `11.png`

#### 3.13 Batch 02 初筛完成

- 已完成 [reference_image_index.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\research\reference_image_index.md) 中 Batch 02 的轻量初筛
- 本批次包含：
  - 文献配色提炼图
  - 大量 `640` 系列截图、示意图和地图图
- 当前判断：
- 本批次整体高价值样本少于 Batch 01
- 可作为科研配色主要参考的图片较少
- 较多图片更适合作为“示意图配色语气”或“版式气质”参考，而非离散统计图 palette 来源
- 本批次未新增进入二次分析候选池的强样本

#### 3.14 `soft` 首批候选 palette 草案建立

- 新建文档：
  - [soft_palette_candidates_draft.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\soft_palette_candidates_draft.md)
- 当前已提出 `soft` 首批 3 组候选：
  - `soft_01`
  - `soft_02`
  - `soft_03`
- 当前三组主要参考来源分别为：
  - `0 (1).png`
  - `0 (3).png`
  - `0 (6).png`
- 当前初步判断：
  - `soft_01` 适合作为简单模式默认入口候选
  - `soft_02` 更偏成熟科研图质感
  - `soft_03` 更偏 `mist` 倾向，需要后续检验区分度

#### 3.15 `soft` 候选参考图实例化整理

- 新建参考目录：
  - [soft_candidates](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\references\curated\curated_references\soft_candidates)
- 已按 3 组候选分别整理代表性图片：
  - `soft_01`
  - `soft_02`
  - `soft_03`
- 每组包含：
  - 1 张主参考图
  - 2 张辅助参考图
- 新建目录说明：
  - [README.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\references\curated\curated_references\soft_candidates\README.md)

#### 3.16 工作区结构化整理

- 已将核心文档按用途整理到 [docs](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs) 下：
  - `planning`
  - `design`
  - `research`
  - `management`
- 已将参考资料整理到 [references](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\references) 下：
  - [raw_images/pic](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\references\raw_images\pic)
  - [curated/curated_references](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\references\curated\curated_references)
- 已在根目录新增总说明与总索引：
  - [README.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\README.md)
  - [INDEX.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\INDEX.md)
- 已同步修正文档内部主要链接到新路径

#### 3.17 遗留目录清理

- 根目录遗留的空 `curated_references` 目录已由用户手动删除
- 当前根目录结构已以 `docs`、`references`、`README.md`、`INDEX.md` 为主

#### 3.18 `soft_02` 提升为默认优先候选

- 当前阶段暂定 `soft_02` 为 `soft` 模式默认优先候选
- 当前排序建议为：
  1. `soft_02`
  2. `soft_01`
  3. `soft_03`
- 已在 [soft_palette_candidates_draft.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\soft_palette_candidates_draft.md) 中补充：
  - 默认优先候选说明
  - `soft_02` 在 `n = 3`
  - `soft_02` 在 `n = 4`
  - `soft_02` 在 `n = 5`
  的建议取色顺序

#### 3.19 `soft_01` 子集规则补充

- 已在 [soft_palette_candidates_draft.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\soft_palette_candidates_draft.md) 中补充 `soft_01` 的：
  - `n = 3`
  - `n = 4`
  - `n = 5`
  建议取色顺序
- 当前判断：
  - `soft_01` 在 `n = 3` 和 `n = 4` 时表现最稳
  - `n = 5` 时浅粉的识别度需要后续在真实图型中验证

#### 3.20 大数量颜色需求纳入设计约束

- 已明确记录：配色需求不能只停留在 `n = 3` 或 `n = 5`
- 后续需要考虑支持 8 到 12 甚至更多类别的场景
- 当前已在以下文档补充该要求：
  - [palette_library_plan_draft.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\planning\palette_library_plan_draft.md)
  - [soft_palette_candidates_draft.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\soft_palette_candidates_draft.md)
- 当前原则：
  - 3 到 5 色方案是第一阶段种子
  - 大数量类别需要单独扩展策略
  - 不能简单机械补色或插值

#### 3.21 `soft_03` 子集规则补充

- 已在 [soft_palette_candidates_draft.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\soft_palette_candidates_draft.md) 中补充 `soft_03` 的：
  - `n = 3`
  - `n = 4`
  - `n = 5`
  建议取色顺序
- 当前判断：
  - `soft_03` 最适合 `n = 3` 和 `n = 4`
  - `n = 5` 时区分度风险最高
  - 更适合作为偏 `mist` 的分支方案

#### 3.22 大数量类别扩展策略草案建立

- 新建文档：
  - [high_cardinality_palette_strategy_draft.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\high_cardinality_palette_strategy_draft.md)
- 当前已明确：
  - `n = 3` 到 `n = 5` 视为种子 palette
  - `n > 5` 视为扩展系统问题
  - 高类别场景不能简单依赖插值或机械补色
- 当前建议采用“三层扩展策略”：
  - 核心色层
  - 扩展色层
  - 分组色层

#### 3.23 `soft_02` 的 `n = 8` 试点初稿

- 已在 [high_cardinality_palette_strategy_draft.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\high_cardinality_palette_strategy_draft.md) 中提出 `soft_02` 的 8 色扩展初稿
- 当前目标：
  - 先验证 `soft` 默认候选是否具备向高类别扩展的潜力
  - 再决定是否进入 `n = 12` 设计

#### 3.24 `soft_02` 的 `n = 8` 实例化预览

- 新建预览文件：
  - [soft_02_n8_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\soft_02_n8_preview.html)
- 该预览包含：
  - 原始核心 5 色
  - 扩展后的 8 色
  - 扩展逻辑说明
  - 简化条形图观感展示

#### 3.25 `soft_02` 的 `n = 8` 第一轮微调预览

- 新建对照预览文件：
  - [soft_02_n8_refined_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\soft_02_n8_refined_preview.html)
- 该预览包含：
  - 原版 8 色
  - 微调版 8 色
  - 简化条形图对照
  - 每个调整点的说明
- 当前微调重点：
  - 拉开冷色中段
  - 拉开暖色尾段
  - 尽量保持 `soft_02` 的成熟和科研感

#### 3.26 设计交互流程确认

- 用户确认：后续其他 palette 或 family 设计都应参照当前网页预览方式进行交互
- 后续默认流程定为：
  1. 先讨论目标风格
  2. 再确定具体参考颜色与扩展颜色
  3. 最后生成网页预览供用户阅览和判断
- 用户确认：当前不继续对 `soft_02_n8` 做进一步微调
- 当前结论：
  - [soft_02_n8_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\soft_02_n8_preview.html) 作为当前符合要求的展示版本保留
  - [soft_02_n8_refined_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\soft_02_n8_refined_preview.html) 保留为过程对照稿，不作为当前优先方案

#### 3.27 `vivid_core` 首版启动

- 已新建草案文档：
  - [vivid_palette_candidates_draft.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\vivid_palette_candidates_draft.md)
- 已生成首版网页预览：
  - [vivid_core_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\vivid_core_preview.html)
- 当前方向：
  - 以深蓝灰和中蓝为冷色骨架
  - 以珊瑚红作为最强视觉锚点
  - 作为 `vivid` 模式默认入口候选

#### 3.28 `vivid_fresh` 首版启动

- 已在 [vivid_palette_candidates_draft.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\vivid_palette_candidates_draft.md) 中补充 `vivid_fresh` 初版方向
- 已生成首版网页预览：
  - [vivid_fresh_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\vivid_fresh_preview.html)
- 当前方向：
  - 以深青蓝为骨架
  - 以浅青绿和冷白建立清爽层次
  - 以浅桃和暖陶色构成温暖对比

#### 3.29 `vivid` 默认方向初步确认

- 用户确认：`vivid_core` 更像想要的默认 `vivid`
- 当前结论：
  - [vivid_core_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\vivid_core_preview.html) 作为当前默认 `vivid` 优先候选保留
  - [vivid_fresh_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\vivid_fresh_preview.html) 作为清爽分支保留
- 已在 [vivid_palette_candidates_draft.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\vivid_palette_candidates_draft.md) 中补充排序建议

#### 3.30 `vivid_drama` 首版启动

- 已在 [vivid_palette_candidates_draft.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\vivid_palette_candidates_draft.md) 中补充 `vivid_drama` 初版方向
- 已生成首版网页预览：
  - [vivid_drama_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\vivid_drama_preview.html)
- 当前方向：
  - 以深墨蓝和冷灰蓝作为骨架
  - 以冷白形成高亮缓冲位
  - 以两级红色承担戏剧化聚焦

#### 3.31 `soft` 分支网页预览补全

- 已新增：
  - [soft_01_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\soft_01_preview.html)
  - [soft_03_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\soft_03_preview.html)
- 当前 `soft` 三支现在都具备网页预览：
  - `soft_01`
  - `soft_02`
  - `soft_03`

#### 3.32 `vivid_drama` 需要重做方向确认

- 当前收到的新反馈：
  - `vivid_drama` 与 `vivid_core` 过于相似
  - 新方向应更鲜艳、区分度更高
  - 可参考顶级学术期刊单细胞 UMAP 图配色
- 后续建议：
  - 先从 [references/raw_images/pic](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\references\raw_images\pic) 中继续搜索和分类更接近 UMAP/高类别分组图的本地参考
  - 再按既定网页预览流程重做 `vivid_drama`

#### 3.33 `vivid_drama` 本地参考分类整理

- 已新建参考目录：
  - [vivid_drama_rework](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\references\curated\curated_references\vivid_drama_rework)
- 已整理本地高价值参考图：
  - `primary_640 (12).png`
  - `support_20231014103724.png`
  - `support_20240217114223.png`
  - `support_20241120124729.jpg`
- 已新增目录说明：
  - [README.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\references\curated\curated_references\vivid_drama_rework\README.md)

#### 3.34 `vivid_drama` 重做版完成

- 已生成新网页预览：
  - [vivid_drama_rework_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\vivid_drama_rework_preview.html)
- 当前新方向：
  - 更鲜艳
  - 更高区分度
  - 更接近单细胞 UMAP / 多类别分群图逻辑
- 旧版 `vivid_drama_preview.html` 已不再作为当前主参考

#### 3.35 用户更新参考图后重新收紧 `vivid_drama` 与 `soft` 边界

- 用户手动更新了：
  - [vivid_drama_rework](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\references\curated\curated_references\vivid_drama_rework)
  - [soft_candidates](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\references\curated\curated_references\soft_candidates)
- 新反馈明确指出：
  - 旧版 `vivid_drama_rework` 色系方向可以接受
  - 但亮度和饱和度都过高
  - 不符合高级学术期刊的成熟科研审美
- 本轮重新判断后确认：
  - `vivid_drama` 应从“高纯度强冲击”改为“低亮度、低饱和、仍有高区分”的成熟多类别系统
  - `soft` 方向总体成立，无需重做主线，只需继续维持低纯度成熟路线

#### 3.36 `vivid_drama` 第二轮优化预览

- 已基于更新后的本地参考图生成第二轮网页预览：
  - [vivid_drama_rework_v2_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\vivid_drama_rework_v2_preview.html)
- 当前新颜色方向：
  - 烟蓝
  - 灰青
  - 苔绿
  - 老金
  - 陶土
  - 烟紫
- 当前设计关键词：
  - 降低亮度
  - 降低饱和度
  - 保留多类别区分
  - 更像成熟学术图，而不是亮色 UMAP 海报

#### 3.37 用户对 `vivid_drama` 第二轮优化的反馈

- 用户反馈：“这一版还可以”
- 说明当前 `vivid_drama` 第二轮方向已基本进入可接受区间
- 用户已将不需要的参考图手动移动到 `trash` 文件夹，后续参考筛选应默认以清理后的目录为准
- 当前建议：
  - 保留 [vivid_drama_rework_v2_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\vivid_drama_rework_v2_preview.html) 作为现阶段有效版本
  - 若继续推进，下一步优先考虑 `n = 8` 扩展，而不是再做同层级微调

#### 3.38 `soft` / `vivid` 统一补齐 `n = 8` 预览

- 已按照用户要求，将各主线补齐为统一结构的 `n = 8` 页面
- 页面结构统一参照：
  - [soft_02_n8_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\soft_02_n8_preview.html)
- 新增页面：
  - [soft_01_n8_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\soft_01_n8_preview.html)
  - [soft_03_n8_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\soft_03_n8_preview.html)
  - [vivid_core_n8_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\vivid_core_n8_preview.html)
  - [vivid_fresh_n8_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\vivid_fresh_n8_preview.html)
  - [vivid_drama_n8_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\vivid_drama_n8_preview.html)
- 当前统一命名规则：
  - `<palette_id>_n8_preview.html`
- 同步更新：
  - [soft_palette_candidates_draft.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\soft_palette_candidates_draft.md)
  - [vivid_palette_candidates_draft.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\vivid_palette_candidates_draft.md)
  - [INDEX.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\INDEX.md)

#### 3.39 用户确认并清理最终 `n = 8` 版本

- 用户反馈当前 6 个 `n = 8` 版本“目前都可以”
- 用户已手动保留最终 8 色版本，并删除此前旧版预览页面
- 当前 [docs/design](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design) 中保留的最终 8 色预览页为：
  - [soft_01_n8_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\soft_01_n8_preview.html)
  - [soft_02_n8_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\soft_02_n8_preview.html)
  - [soft_03_n8_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\soft_03_n8_preview.html)
  - [vivid_core_n8_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\vivid_core_n8_preview.html)
  - [vivid_fresh_n8_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\vivid_fresh_n8_preview.html)
  - [vivid_drama_n8_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\vivid_drama_n8_preview.html)
- 已同步清理 [INDEX.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\INDEX.md) 中指向旧版预览页的链接

#### 3.40 `soft` 分支语义化重命名

- 用户指出：`vivid_core`、`vivid_fresh`、`vivid_drama` 可以保留，但 `soft_01`、`soft_02`、`soft_03` 不应继续用序号指代
- 当前已将 `soft` 三支重命名为：
  - `soft_01` -> `soft_breeze`
  - `soft_02` -> `soft_harbor`
  - `soft_03` -> `soft_mist`
- 命名含义：
  - `soft_breeze`：清新青绿、轻柔跨色系
  - `soft_harbor`：成熟稳重、冷暖平衡，也是默认 `soft` 候选
  - `soft_mist`：雾感低冲突、偏 `mist` 支线
- 已同步重命名最终预览页：
  - [soft_breeze_n8_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\soft_breeze_n8_preview.html)
  - [soft_harbor_n8_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\soft_harbor_n8_preview.html)
  - [soft_mist_n8_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\soft_mist_n8_preview.html)
- 已同步重命名参考目录：
  - [soft_breeze](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\references\curated\curated_references\soft_candidates\soft_breeze)
  - [soft_harbor](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\references\curated\curated_references\soft_candidates\soft_harbor)
  - [soft_mist](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\references\curated\curated_references\soft_candidates\soft_mist)
- 已同步更新：
  - [INDEX.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\INDEX.md)
  - [soft_palette_candidates_draft.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\soft_palette_candidates_draft.md)
  - [high_cardinality_palette_strategy_draft.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\high_cardinality_palette_strategy_draft.md)
  - [palette_library_plan_draft.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\planning\palette_library_plan_draft.md)
  - [soft_candidates README](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\references\curated\curated_references\soft_candidates\README.md)

#### 3.41 当前状态与下一步路线复盘

- 已重新阅读并整理当前核心计划与流程文档，包括：
  - [requirements_blueprint_draft.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\planning\requirements_blueprint_draft.md)
  - [palette_library_plan_draft.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\planning\palette_library_plan_draft.md)
  - [aesthetic_spec_minimum.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\aesthetic_spec_minimum.md)
  - [high_cardinality_palette_strategy_draft.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\high_cardinality_palette_strategy_draft.md)
  - [INDEX.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\INDEX.md)
- 已新增当前状态复盘文档：
  - [current_status_and_next_steps.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\planning\current_status_and_next_steps.md)
- 当前判断：
  - 阶段 1 审美规范基本完成
  - 阶段 2 简单模式 palette 资产已完成第一批 `n = 8`
  - 进阶 family 资产尚未开始
  - R 包骨架与核心 API 尚未开始
- 下一步建议：
  - 优先建立 palette 数据结构
  - 将 6 组最终 `n = 8` palette 转为包内数据资产
  - 然后开始 R 包骨架与 `phage_palette()` 最小实现

#### 3.42 创建简单模式 MVP 的 R 包骨架

- 用户确认：先基于简单版创建 R 包骨架，不等进阶 family 全部完成
- 当前已创建最小 R 包结构：
  - [DESCRIPTION](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\DESCRIPTION)
  - [NAMESPACE](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\NAMESPACE)
  - [R/data-palettes.R](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\R\data-palettes.R)
  - [R/phage-palette.R](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\R\phage-palette.R)
  - [R/ggplot-scales.R](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\R\ggplot-scales.R)
  - [man](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\man)
  - [tests/testthat](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\tests\testthat)
- 已新增 palette 数据结构文档：
  - [palette_data_structure_draft.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\planning\palette_data_structure_draft.md)
- 当前实现范围：
  - `phage_palette()`
  - `available_phage_palettes()`
  - `scale_color_phage()`
  - `scale_fill_phage()`
  - 6 组简单模式 `n = 8` palette
- 当前默认映射：
  - `mode = "soft"` -> `soft_harbor`
  - `mode = "vivid"` -> `vivid_core`
- 当前限制：
  - `n <= 8`
  - 暂不实现进阶 family
  - 暂不实现连续、发散、生成式 palette
- 当前环境说明：
  - 命令行中暂未检测到可直接调用的 `R/Rscript`
  - 因此尚未运行 `R CMD check` 或 testthat 测试

#### 3.43 创建独立 GitHub 仓库目录并完成 R 包检查

- 用户要求：
  - 按 Git 仓库结构和流程开发
  - 创建单独目录用于后续上传 GitHub
  - 记录流程和说明
- 已创建独立仓库目录：
  - [github_repo/ColorPhage](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage)
- 已在该目录中初始化 Git：
  - `git init -b main`
- 已补充仓库文件：
  - `.gitignore`
  - `.github/workflows/R-CMD-check.yaml`
  - `LICENSE.md`
  - GitHub 版 `README.md`
  - `ColorPhage.Rproj`
- 已定位本机 R：
  - `C:\Program Files\R\R-4.5.3\bin\R.exe`
  - `C:\Program Files\R\R-4.5.3\bin\Rscript.exe`
- 已运行：
  - `R CMD build .`
  - `R CMD check --no-manual ColorPhage_0.0.0.9000.tar.gz`
- 当前检查结果：
  - `Status: OK`
- 检查完成后已清理生成产物：
  - `ColorPhage_0.0.0.9000.tar.gz`
  - `ColorPhage.Rcheck`
- 已新增流程说明：
  - [github_repo_workflow.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\management\github_repo_workflow.md)

#### 3.44 根目录清理

- 用户要求删除不再需要的文档和目录，保持根目录简洁
- 已删除根目录中被独立 GitHub 仓库取代的重复 R 包文件和目录：
  - `R`
  - `man`
  - `tests`
  - `DESCRIPTION`
  - `NAMESPACE`
  - `LICENSE`
  - `.Rbuildignore`
- 已删除不再需要的 `trash` 目录
- 当前根目录保留：
  - [docs](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs)
  - [github_repo](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo)
  - [references](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\references)
  - [README.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\README.md)
  - [INDEX.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\INDEX.md)
- 已同步更新：
  - [README.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\README.md)
  - [INDEX.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\INDEX.md)
  - [current_status_and_next_steps.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\planning\current_status_and_next_steps.md)
  - [palette_data_structure_draft.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\planning\palette_data_structure_draft.md)

#### 3.45 创建 simple modes 最小 gallery

- 已在独立 GitHub 仓库中创建：
  - [inst/gallery](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage\inst\gallery)
- 已新增生成脚本：
  - [build_simple_modes_gallery.R](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage\inst\gallery\build_simple_modes_gallery.R)
- 已生成 HTML gallery：
  - [simple_modes_gallery.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage\inst\gallery\simple_modes_gallery.html)
- 当前 gallery 展示内容：
  - 6 组简单模式最终 `n = 8` palette 色块
  - 简化柱状图效果
  - 简化散点图效果
  - 简化折线图效果
- 生成命令：
  - `Rscript inst/gallery/build_simple_modes_gallery.R`

#### 3.46 建立可复用开发流程与脚本

- 用户要求：
  - 将执行流程和脚本整理成文档
  - 后续不再重复寻找路径或命令
  - 每一步后保持文档更新
  - 核对开发流程等文档是否重复或冲突
- 已新增可复用开发流程文档：
  - [reusable_development_workflows.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\management\reusable_development_workflows.md)
- 已新增可复用脚本：
  - [tools/check_package.ps1](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage\tools\check_package.ps1)
  - [tools/build_gallery.ps1](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage\tools\build_gallery.ps1)
- 已验证：
  - `tools/build_gallery.ps1` 可成功生成 gallery
  - `tools/check_package.ps1` 可成功完成 `R CMD build` 和 `R CMD check --no-manual`
  - 当前检查结果为 `Status: OK`
- 已更新：
  - [README.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\README.md)
  - [INDEX.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\INDEX.md)
  - [github_repo_workflow.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\management\github_repo_workflow.md)
  - [current_status_and_next_steps.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\planning\current_status_and_next_steps.md)
- 文档核对结论：
  - `current_status_and_next_steps.md` 中“制作最小 gallery”的过期下一步已修正为“人工审阅 gallery 与准备首次 commit”
  - `github_repo_workflow.md` 已补充 `tools/` 和 `inst/gallery/` 流程
  - `README.md` 和 `INDEX.md` 已加入可复用脚本入口

#### 3.47 同步正式仓库文档并复测脚本

- 已将根目录 `docs/` 下最新文档同步到正式 R 包仓库：
  - [github_repo/ColorPhage/docs](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage\docs)
- 已复测正式仓库包检查脚本：
  - [tools/check_package.ps1](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage\tools\check_package.ps1)
- 当前复测结果：
  - `R CMD build`：通过
  - `R CMD check --no-manual`：`Status: OK`
- 检查期间仍出现外部仓库索引访问 warning：
  - CRAN/Bioconductor package index 网络访问受限
  - 该 warning 不影响当前本地包检查结论
- 当前根目录结构保持简洁：
  - `docs/`
  - `github_repo/`
  - `references/`
  - `README.md`
  - `INDEX.md`

#### 3.48 完成首次 commit 与 GitHub 推送

- 用户确认当前 simple modes gallery 没有问题。
- 已为当前仓库配置本地 Git 作者信息：
  - `user.name = xiaolw95`
  - `user.email = xiaolw95@users.noreply.github.com`
- 已完成首次本地 commit：
  - `7ca789d Initial ColorPhage package prototype`
- 提交后发现正式仓库内 `docs/research` 被误记录为文件而非目录。
- 已修正为正确路径：
  - [reference_image_index.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage\docs\research\reference_image_index.md)
- 已追加结构修复 commit：
  - `96771a3 Fix research docs index path`
- 已添加 GitHub remote：
  - `https://github.com/xiaolw95/ColorPhage.git`
- 已成功推送 `main` 到 GitHub：
  - [ColorPhage GitHub repository](https://github.com/xiaolw95/ColorPhage)
- 推送时发现全局 Git 配置 `http.sslVerify=false` 导致 TLS 安全 warning。
- 已恢复：
  - `git config --global http.sslVerify true`
- 已通过远程连接测试：
  - `git ls-remote --heads origin`

#### 3.49 升级真实 ggplot2 gallery

- 用户要求：
  - 先更新记录文件
  - 然后继续执行建议的下一步
- 已将 `simple_modes_gallery.html` 从手写简化 SVG 预览升级为真实 `ggplot2` 示例 gallery。
- 已更新生成脚本：
  - [build_simple_modes_gallery.R](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage\inst\gallery\build_simple_modes_gallery.R)
- 当前每个 palette 生成 4 类真实 `ggplot2` 图：
  - bar：填充型分组比较
  - scatter：多组散点
  - line：多组趋势线
  - UMAP-like：单细胞/降维图风格散点
- 已新增 gallery 图像资产目录：
  - [figures](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage\inst\gallery\figures)
- 当前共生成：
  - 6 个 palette
  - 每个 palette 4 张 SVG
  - 合计 24 张真实 `ggplot2` SVG 图
- 生成命令：
  - `powershell -ExecutionPolicy Bypass -File "tools\build_gallery.ps1"`
- 生成结果：
  - 成功
- 同步修复：
  - 移除了 `R/ggplot-scales.R` 中已被 ggplot2 弃用的 `scale_name` 参数
  - 避免新版 ggplot2 下出现 deprecation warning
- 包检查结果：
  - `tools\check_package.ps1` 通过
  - `R CMD check --no-manual`：`Status: OK`

#### 3.50 确认真实 ggplot2 gallery 并启动进阶 family 阶段

- 用户已审阅真实 `ggplot2` gallery，并确认：
  - 当前没有问题
  - 可以开始下一步
- 当前 simple modes MVP 已进入稳定基线：
  - 6 组 simple palette 已可调用
  - 真实 `ggplot2` gallery 已通过审阅
  - GitHub 仓库已同步
- 下一阶段建议：
  - 启动第一个进阶 family 的设计
  - 优先从 `forest` 开始，而不是 `mist` 或 `cinema`
- 原因：
  - `mist` 与现有 `soft` 气质过近
  - `cinema` 与现有 `vivid_drama` 容易重叠
  - `forest` 与生物、生态、微生物、phage 语境天然贴合
  - `forest` 能提供与 simple modes 足够不同的第一组高级风格样本

#### 3.51 创建 forest family 候选预览

- 已新增进阶 family 启动草案：
  - [advanced_family_design_plan.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\advanced_family_design_plan.md)
- 已新增 `forest` 候选草案：
  - [forest_family_candidates_draft.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\forest_family_candidates_draft.md)
- 已新增 `forest` 候选预览生成脚本：
  - [build_forest_family_candidates_preview.R](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\build_forest_family_candidates_preview.R)
- 已生成预览页面：
  - [forest_family_candidates_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\forest_family_candidates_preview.html)
- 当前候选：
  - `forest_canopy`
  - `forest_moss`
  - `forest_ember`
- 当前预览内容：
  - 每个候选 `n = 8`
  - 每个候选包含 bar、scatter、line、UMAP-like 四类真实 `ggplot2` 图
  - 合计 12 张 SVG 图像资产
- 图像资产目录：
  - [forest_family_preview_figures](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\forest_family_preview_figures)

#### 3.52 将 forest family 写入 R 包

- 用户已审阅 `forest` 三个候选分支，并确认：
  - 当前版本没有问题
  - 可以继续
- 已将以下 palette 写入 R 包核心数据：
  - `forest_canopy`
  - `forest_moss`
  - `forest_ember`
- 已新增默认映射：
  - `mode = "forest"` -> `forest_canopy`
- 当前 `phage_palette()` 支持：
  - `mode = "soft"`
  - `mode = "vivid"`
  - `mode = "forest"`
- 当前 R 包 palette 总数：
  - 9 组
- 已更新：
  - `R/data-palettes.R`
  - `R/phage-palette.R`
  - `R/ggplot-scales.R`
  - `tests/testthat/test-phage-palette.R`
  - `man/*.Rd`
  - `README.md`
- 已重新生成主 gallery：
  - [simple_modes_gallery.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage\inst\gallery\simple_modes_gallery.html)
- 当前主 gallery 内容：
  - 3 组 `soft`
  - 3 组 `vivid`
  - 3 组 `forest`
  - 每组 4 类真实 `ggplot2` 图
  - 合计 36 张 SVG 图像

#### 3.53 启动第二个进阶 family：mineral

- 用户要求：
  - 继续做第二个进阶 family
- 当前建议第二个 family 选择：
  - `mineral`
- 选择原因：
  - 与 `forest` 的自然有机感拉开差异
  - 更适合临床、方法学、模型比较、机制统计图
  - 蓝灰、石板、矿物青、冷砂与铁锈锚点能形成高级科研审美
- 当前创建 3 个候选分支：
  - `mineral_slate`
  - `mineral_quartz`
  - `mineral_oxide`
- 已新增 `mineral` 候选草案：
  - [mineral_family_candidates_draft.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\mineral_family_candidates_draft.md)
- 已新增 `mineral` 候选预览生成脚本：
  - [build_mineral_family_candidates_preview.R](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\build_mineral_family_candidates_preview.R)
- 已生成预览页面：
  - [mineral_family_candidates_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\mineral_family_candidates_preview.html)
- 当前预览内容：
  - 每个候选 `n = 8`
  - 每个候选包含 bar、scatter、line、UMAP-like 四类真实 `ggplot2` 图
  - 合计 12 张 SVG 图像资产
- 图像资产目录：
  - [mineral_family_preview_figures](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\mineral_family_preview_figures)

#### 3.54 将 mineral family 写入 R 包

- 用户已审阅 `mineral` 三个候选分支，并确认：
  - 当前版本审核通过
  - 可以继续下一个 family
- 已检查当前 Git 状态：
  - 本地 `main` 与 `origin/main` 同步
  - 本地日志显示 `forest` 与 `mineral` 设计提交已位于 `origin/main`
  - 实时 `git ls-remote` 因当前网络无法连接 GitHub，未能在线二次确认
- 已将以下 palette 写入 R 包核心数据：
  - `mineral_slate`
  - `mineral_quartz`
  - `mineral_oxide`
- 已新增默认映射：
  - `mode = "mineral"` -> `mineral_slate`
- 当前 `phage_palette()` 支持：
  - `mode = "soft"`
  - `mode = "vivid"`
  - `mode = "forest"`
  - `mode = "mineral"`
- 当前 R 包 palette 总数：
  - 12 组
- 已重新生成主 gallery：
  - 3 组 `soft`
  - 3 组 `vivid`
  - 3 组 `forest`
  - 3 组 `mineral`
  - 每组 4 类真实 `ggplot2` 图
  - 合计 48 张 SVG 图像

#### 3.55 启动第三个进阶 family：ocean

- 当前建议第三个 family 选择：
  - `ocean`
- 选择原因：
  - `forest` 已覆盖自然有机语境
  - `mineral` 已覆盖冷静理性和方法学语境
  - `ocean` 可覆盖清洁、流动、偏冷、组学与空间结构语境
- 当前创建 3 个候选分支：
  - `ocean_current`
  - `ocean_glass`
  - `ocean_depth`
- 已新增 `ocean` 候选草案：
  - [ocean_family_candidates_draft.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\ocean_family_candidates_draft.md)
- 已新增 `ocean` 候选预览生成脚本：
  - [build_ocean_family_candidates_preview.R](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\build_ocean_family_candidates_preview.R)
- 已生成预览页面：
  - [ocean_family_candidates_preview.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\ocean_family_candidates_preview.html)
- 当前预览内容：
  - 每个候选 `n = 8`
  - 每个候选包含 bar、scatter、line、UMAP-like 四类真实 `ggplot2` 图
  - 合计 12 张 SVG 图像资产
- 图像资产目录：
  - [ocean_family_preview_figures](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\ocean_family_preview_figures)

## 4. 当前已存在核心文档

- [requirements_blueprint_draft.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\planning\requirements_blueprint_draft.md)
- [aesthetic_spec_minimum.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\design\aesthetic_spec_minimum.md)
- [project_log.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\management\project_log.md)
- [palette_library_plan_draft.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\planning\palette_library_plan_draft.md)
- [reference_image_index.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\research\reference_image_index.md)

## 5. 待讨论事项

- 每个 family 下 palette 展示名的具体方案
- palette 名是否在函数层直接暴露
- 第一批 palette 库的数量与设计方法
- `base` 和 `vibe` 是否在第一版开放
- `theme_phage()` 是否在第一版同步推出

## 6. 后续记录规范

从本次开始，建议后续以下操作都记录在本文件中：

- 新增或修改核心文档
- 关键产品决策
- API 调整
- palette 设计批次
- 代码结构建立
- 测试、示例和 gallery 进展

---

本文件将持续更新，作为项目回溯主记录。
