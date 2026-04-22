# ColorPhage 可复用开发流程

## 1. 文档目的

本文件记录 ColorPhage 当前稳定的本地开发路径、脚本和常用命令。

后续每完成一个关键步骤，都应同步更新本文件，避免重复查找 R 路径、仓库路径或检查命令。

## 2. 固定路径

### 2.1 工作区根目录

```text
C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage
```

用途：

- 保存项目说明文档
- 保存参考图
- 保存独立 GitHub 仓库目录

### 2.2 GitHub 仓库目录

```text
C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage
```

用途：

- 这是后续上传 GitHub 的正式 R 包仓库
- 后续 R 包代码修改应优先在此目录内进行

### 2.3 R 路径

```text
C:\Program Files\R\R-4.5.3\bin\R.exe
C:\Program Files\R\R-4.5.3\bin\Rscript.exe
```

注意：

- PowerShell 中的 `R` 会被解析为历史命令别名
- 因此本项目脚本统一使用完整 R 路径

## 3. 可复用脚本

### 3.1 包检查脚本

脚本位置：

- [check_package.ps1](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage\tools\check_package.ps1)

用途：

- 清理旧检查产物
- 运行 `R CMD build`
- 运行 `R CMD check --no-manual`
- 检查通过后清理 `.tar.gz` 和 `.Rcheck`

运行方式：

```powershell
powershell -ExecutionPolicy Bypass -File "tools\check_package.ps1"
```

工作目录：

```text
C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage
```

当前最近结果：

```text
Status: OK
```

最近复测说明：

- `tools\check_package.ps1` 已在正式仓库目录中复测通过
- 检查期间如出现 CRAN/Bioconductor index warning，通常是当前网络限制导致
- 只要最终显示 `Status: OK`，当前本地包检查视为通过

### 3.2 Gallery 生成脚本

PowerShell 包装脚本：

- [build_gallery.ps1](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage\tools\build_gallery.ps1)

R 生成脚本：

- [build_simple_modes_gallery.R](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage\inst\gallery\build_simple_modes_gallery.R)

输出文件：

- [simple_modes_gallery.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage\inst\gallery\simple_modes_gallery.html)

运行方式：

```powershell
powershell -ExecutionPolicy Bypass -File "tools\build_gallery.ps1"
```

## 4. 常规开发顺序

每次修改 R 包代码或 palette 数据后，建议按以下顺序执行：

1. 修改 `github_repo/ColorPhage` 中的 R 包文件
2. 如涉及 palette 或展示，运行 `tools\build_gallery.ps1`
3. 运行 `tools\check_package.ps1`
4. 更新相关文档
5. 查看 `git status --short`
6. 确认无误后再 commit

## 5. 文档同步规则

每次完成关键步骤后，应至少更新：

- [project_log.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\management\project_log.md)
- [INDEX.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\INDEX.md)

如果涉及当前状态或下一步：

- [current_status_and_next_steps.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\planning\current_status_and_next_steps.md)

如果涉及包检查、GitHub、脚本、R 路径：

- [github_repo_workflow.md](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\docs\management\github_repo_workflow.md)
- 本文件

## 6. 当前仓库状态

当前独立 GitHub 仓库已初始化：

```powershell
git init -b main
```

当前尚未创建首次 commit。

上传 GitHub 前建议执行：

```powershell
git status --short
powershell -ExecutionPolicy Bypass -File "tools\check_package.ps1"
```

确认无误后：

```powershell
git add .
git commit -m "Initial ColorPhage package prototype"
git remote add origin <YOUR_GITHUB_REPO_URL>
git push -u origin main
```

## 7. 当前下一步

当前建议下一步：

1. 人工审阅 [simple_modes_gallery.html](C:\Users\Administrator\OneDrive\Documentos\Myjob_codex\ColorPhage\github_repo\ColorPhage\inst\gallery\simple_modes_gallery.html)
2. 根据审阅结果微调 gallery 或 palette
3. 若 gallery 通过，开始准备首次 Git commit
4. 之后再接入第一个进阶 family
