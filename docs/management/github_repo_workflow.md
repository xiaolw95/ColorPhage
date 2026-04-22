# ColorPhage GitHub 仓库整理与检查流程

## 1. 独立仓库目录

当前已创建独立 GitHub 上传目录：

- [github_repo/ColorPhage](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage)

该目录是后续建议上传到 GitHub 的 R 包仓库根目录。

## 2. 仓库结构

当前仓库目录包含：

- `DESCRIPTION`
- `LICENSE`
- `LICENSE.md`
- `NAMESPACE`
- `README.md`
- `ColorPhage.Rproj`
- `.Rbuildignore`
- `.gitignore`
- `.github/workflows/R-CMD-check.yaml`
- `R/`
- `man/`
- `tests/`
- `inst/gallery/`
- `tools/`
- `docs/`

未复制进入仓库的内容：

- 原始大体量参考图
- `trash`
- 工作区级别临时文件

## 3. 当前 R 路径

本机检测到可用 R：

```text
C:\Program Files\R\R-4.5.3\bin\R.exe
C:\Program Files\R\R-4.5.3\bin\Rscript.exe
```

注意：

- PowerShell 中的 `R` 当前会被解析为历史命令别名
- 因此建议使用完整路径调用 R

## 4. 当前 Git 状态

已在独立目录中初始化 Git 仓库：

```powershell
git init -b main
```

当前尚未创建提交。

后续上传 GitHub 时可在该目录中执行：

```powershell
git add .
git commit -m "Initial ColorPhage package prototype"
git remote add origin <YOUR_GITHUB_REPO_URL>
git push -u origin main
```

## 5. R 包检查流程

推荐直接使用可复用脚本：

```powershell
powershell -ExecutionPolicy Bypass -File "tools\check_package.ps1"
```

等价手动命令：

```powershell
& "C:\Program Files\R\R-4.5.3\bin\R.exe" CMD build .
& "C:\Program Files\R\R-4.5.3\bin\R.exe" CMD check --no-manual "ColorPhage_0.0.0.9000.tar.gz"
```

当前检查结果：

```text
Status: OK
```

检查中曾出现 CRAN/Bioconductor 索引访问 warning，这是当前环境网络访问限制导致，不影响最终 `R CMD check` 状态。

## 6. 当前清理策略

检查完成后已清理本地生成产物：

- `ColorPhage_0.0.0.9000.tar.gz`
- `ColorPhage.Rcheck`

这些文件不应提交到 GitHub。

## 6.1 Gallery 生成流程

推荐直接使用可复用脚本：

```powershell
powershell -ExecutionPolicy Bypass -File "tools\build_gallery.ps1"
```

该脚本会调用：

- [build_simple_modes_gallery.R](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage\inst\gallery\build_simple_modes_gallery.R)

并生成：

- [simple_modes_gallery.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage\inst\gallery\simple_modes_gallery.html)

## 7. 当前包能力

当前 MVP 支持：

- `phage_palette()`
- `available_phage_palettes()`
- `scale_color_phage()`
- `scale_fill_phage()`

当前已内置 6 组简单模式 palette：

- `soft_breeze`
- `soft_harbor`
- `soft_mist`
- `vivid_core`
- `vivid_fresh`
- `vivid_drama`

当前默认映射：

- `mode = "soft"` -> `soft_harbor`
- `mode = "vivid"` -> `vivid_core`

## 8. 下一步建议

建议下一步进入：

1. 打开 [simple_modes_gallery.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage\inst\gallery\simple_modes_gallery.html) 进行人工审阅
2. 若 gallery 认可，准备首次 Git commit
3. 后续再开始接入第一个进阶 family
