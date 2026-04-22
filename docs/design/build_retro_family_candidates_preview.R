`%||%` <- function(x, y) {
  if (is.null(x)) y else x
}

if (!requireNamespace("ggplot2", quietly = TRUE)) {
  stop("Package `ggplot2` is required to build the retro candidate preview.", call. = FALSE)
}

script_arg <- grep("^--file=", commandArgs(trailingOnly = FALSE), value = TRUE)
script_path <- if (length(script_arg)) sub("^--file=", "", script_arg[[1]]) else getwd()
root_dir <- normalizePath(file.path(dirname(script_path), "..", ".."), winslash = "/", mustWork = FALSE)
if (!dir.exists(file.path(root_dir, "docs", "design"))) {
  root_dir <- normalizePath(getwd(), winslash = "/", mustWork = TRUE)
}

escape_html <- function(x) {
  x <- gsub("&", "&amp;", x, fixed = TRUE)
  x <- gsub("<", "&lt;", x, fixed = TRUE)
  x <- gsub(">", "&gt;", x, fixed = TRUE)
  x
}

palettes <- list(
  retro_film = list(
    display_name = "Retro Film",
    role = "胶片绿和旧纸张主线：适合综述机制图、纵向队列和叙事型统计图。",
    colors = c("#4A4E46", "#6F7764", "#A19B72", "#D5C08A", "#E6D5B8", "#C7835F", "#A6534B", "#6C596E")
  ),
  retro_paper = list(
    display_name = "Retro Paper",
    role = "旧纸张和温暖土色：适合图文摘要、机制模块和多时间点趋势图。",
    colors = c("#5F5A4A", "#8C8060", "#B8A878", "#E2D0A8", "#D8BFA3", "#B87962", "#8E5A58", "#586A73")
  ),
  retro_signal = list(
    display_name = "Retro Signal",
    role = "复古底色加清晰信号：适合干预组、疾病进展和主结果强调图。",
    colors = c("#3F4A46", "#697464", "#9B956C", "#D3AE62", "#E4CDA6", "#C66F54", "#93485A", "#526A82")
  )
)

design_dir <- file.path(root_dir, "docs", "design")
figure_dir <- file.path(design_dir, "retro_family_preview_figures")
if (!dir.exists(figure_dir)) {
  dir.create(figure_dir, recursive = TRUE)
}

old_figures <- list.files(figure_dir, pattern = "\\.svg$", full.names = TRUE)
if (length(old_figures)) {
  unlink(old_figures)
}

theme_preview <- function(base_size = 11) {
  ggplot2::theme_minimal(base_size = base_size) +
    ggplot2::theme(
      text = ggplot2::element_text(family = "sans", colour = "#332f2a"),
      plot.background = ggplot2::element_rect(fill = "#fffaf0", colour = NA),
      panel.background = ggplot2::element_rect(fill = "#fffaf0", colour = NA),
      panel.grid.major = ggplot2::element_line(colour = "#e6dcc8", linewidth = 0.35),
      panel.grid.minor = ggplot2::element_blank(),
      axis.title = ggplot2::element_blank(),
      axis.text = ggplot2::element_text(colour = "#746b5f", size = 9),
      legend.position = "none",
      plot.margin = ggplot2::margin(10, 12, 10, 12)
    )
}

manual_color <- function(colors) {
  ggplot2::scale_colour_manual(values = colors)
}

manual_fill <- function(colors) {
  ggplot2::scale_fill_manual(values = colors)
}

save_svg_plot <- function(plot, file, width = 5.8, height = 3.6) {
  grDevices::svg(filename = file, width = width, height = height, bg = "transparent")
  on.exit(grDevices::dev.off(), add = TRUE)
  print(plot)
}

bar_plot <- function(colors) {
  values <- c(8.5, 10.8, 9.2, 12.0, 11.2, 8.8, 13.1, 10.4)
  df <- data.frame(
    group = factor(paste0("G", seq_along(values)), levels = paste0("G", seq_along(values))),
    value = values
  )

  ggplot2::ggplot(df, ggplot2::aes(group, value, fill = group)) +
    ggplot2::geom_col(width = 0.72, alpha = 0.96) +
    manual_fill(colors) +
    ggplot2::scale_y_continuous(expand = ggplot2::expansion(mult = c(0, 0.12))) +
    ggplot2::labs(title = "Grouped comparison") +
    theme_preview()
}

scatter_plot <- function(colors) {
  set.seed(1018)
  group <- factor(rep(paste0("C", 1:8), each = 14), levels = paste0("C", 1:8))
  centers <- data.frame(
    x = c(-1.8, -1.1, -0.4, 0.3, 0.9, 1.5, 2.0, 2.5),
    y = c(0.2, 1.2, -0.8, 0.9, -0.2, 1.4, -0.7, 0.5)
  )
  df <- data.frame(
    group = group,
    x = rep(centers$x, each = 14) + stats::rnorm(length(group), 0, 0.18),
    y = rep(centers$y, each = 14) + stats::rnorm(length(group), 0, 0.22)
  )

  ggplot2::ggplot(df, ggplot2::aes(x, y, colour = group)) +
    ggplot2::geom_point(size = 2.4, alpha = 0.86) +
    manual_color(colors) +
    ggplot2::labs(title = "Clustered scatter") +
    theme_preview()
}

line_plot <- function(colors) {
  time <- rep(seq_len(7), times = 8)
  group <- factor(rep(paste0("L", 1:8), each = 7), levels = paste0("L", 1:8))
  baseline <- rep(seq(3.8, 6.2, length.out = 8), each = 7)
  trend <- rep(c(0.15, -0.04, 0.1, 0.2, -0.08, 0.16, 0.05, 0.12), each = 7) * time
  wave <- rep(c(0.4, -0.2, 0.1, -0.35, 0.25, -0.15, 0.32), times = 8)
  df <- data.frame(group = group, time = time, value = baseline + trend + wave)

  ggplot2::ggplot(df, ggplot2::aes(time, value, colour = group, group = group)) +
    ggplot2::geom_line(linewidth = 1.05, alpha = 0.9) +
    ggplot2::geom_point(size = 1.8, alpha = 0.9) +
    manual_color(colors) +
    ggplot2::labs(title = "Longitudinal trend") +
    theme_preview()
}

umap_plot <- function(colors) {
  set.seed(1024)
  group <- factor(rep(paste0("T", 1:8), each = 70), levels = paste0("T", 1:8))
  angle <- seq(0, 2 * pi, length.out = 9)[-9]
  radius <- c(2.7, 2.2, 2.9, 2.3, 2.8, 2.1, 2.6, 2.4)
  centers <- data.frame(x = cos(angle) * radius, y = sin(angle) * radius * 0.82)
  df <- data.frame(
    group = group,
    x = rep(centers$x, each = 70) + stats::rnorm(length(group), 0, 0.38),
    y = rep(centers$y, each = 70) + stats::rnorm(length(group), 0, 0.32)
  )

  ggplot2::ggplot(df, ggplot2::aes(x, y, colour = group)) +
    ggplot2::geom_point(size = 1.15, alpha = 0.78) +
    manual_color(colors) +
    ggplot2::coord_equal() +
    ggplot2::labs(title = "UMAP-like embedding") +
    theme_preview(base_size = 10) +
    ggplot2::theme(
      axis.text = ggplot2::element_blank(),
      panel.grid = ggplot2::element_blank()
    )
}

make_plot_files <- function(id, colors) {
  plots <- list(
    bar = bar_plot(colors),
    scatter = scatter_plot(colors),
    line = line_plot(colors),
    umap = umap_plot(colors)
  )

  vapply(names(plots), function(kind) {
    out <- file.path(figure_dir, sprintf("%s_%s.svg", id, kind))
    save_svg_plot(plots[[kind]], out)
    file.path("retro_family_preview_figures", basename(out))
  }, character(1))
}

swatch_cards <- function(colors) {
  paste(
    sprintf(
      '<div class="swatch-card"><div class="chip" style="background:%s"></div><code>%s</code></div>',
      colors,
      colors
    ),
    collapse = "\n"
  )
}

plot_card <- function(title, src) {
  sprintf(
    '<div class="preview-card"><h3>%s</h3><img src="%s" alt="%s"></div>',
    escape_html(title),
    escape_html(src),
    escape_html(title)
  )
}

palette_section <- function(id) {
  meta <- palettes[[id]]
  colors <- meta$colors
  figure_files <- make_plot_files(id, colors)
  plot_cards <- paste(
    plot_card("Fill / bar", figure_files[["bar"]]),
    plot_card("Colour / scatter", figure_files[["scatter"]]),
    plot_card("Colour / line", figure_files[["line"]]),
    plot_card("UMAP-like", figure_files[["umap"]]),
    sep = "\n"
  )

  sprintf(
    '<section class="palette-section">
      <div class="palette-head">
        <div>
          <p class="eyebrow">advanced family / retro</p>
          <h2>%s <span>%s</span></h2>
          <p>%s</p>
        </div>
      </div>
      <div class="swatches">%s</div>
      <div class="preview-grid">%s</div>
    </section>',
    escape_html(meta$display_name),
    escape_html(id),
    escape_html(meta$role),
    swatch_cards(colors),
    plot_cards
  )
}

sections <- paste(vapply(names(palettes), palette_section, character(1)), collapse = "\n")

html <- sprintf(
'<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ColorPhage Retro Family Candidates</title>
  <style>
    :root {
      --bg: #f3ead9;
      --panel: #fffaf0;
      --ink: #332f2a;
      --muted: #746b5f;
      --line: #e0d2bb;
      --retro: #a6534b;
    }
    * { box-sizing: border-box; }
    body {
      margin: 0;
      font-family: "Segoe UI", "PingFang SC", "Microsoft YaHei", sans-serif;
      color: var(--ink);
      background:
        radial-gradient(circle at 10%% 10%%, rgba(166,83,75,.16), transparent 26%%),
        radial-gradient(circle at 86%% 6%%, rgba(213,192,138,.28), transparent 24%%),
        radial-gradient(circle at 78%% 88%%, rgba(88,106,115,.16), transparent 24%%),
        var(--bg);
      line-height: 1.55;
    }
    .wrap { width: min(1280px, calc(100%% - 48px)); margin: 36px auto 72px; }
    .hero, .palette-section {
      background: rgba(255,250,240,.94);
      border: 1px solid var(--line);
      border-radius: 30px;
      box-shadow: 0 22px 54px rgba(80,66,48,.10);
    }
    .hero { padding: 34px 36px; margin-bottom: 22px; }
    h1, h2, h3, p { margin: 0; }
    h1 { font-size: clamp(34px, 5vw, 58px); letter-spacing: .01em; margin-bottom: 12px; }
    .hero p { max-width: 900px; color: var(--muted); font-size: 17px; }
    .mode-strip { display: flex; flex-wrap: wrap; gap: 10px; margin-top: 22px; }
    .pill {
      border: 1px solid var(--line);
      border-radius: 999px;
      padding: 8px 14px;
      background: #fbf4e8;
      color: var(--muted);
      font-size: 14px;
    }
    .palette-section { padding: 26px; margin-top: 20px; }
    .palette-head { display: flex; justify-content: space-between; gap: 20px; margin-bottom: 20px; }
    .eyebrow { color: var(--muted); text-transform: uppercase; letter-spacing: .12em; font-size: 12px; margin-bottom: 6px; }
    h2 { font-size: clamp(24px, 3vw, 34px); margin-bottom: 8px; }
    h2 span {
      font-size: 14px;
      color: var(--muted);
      font-weight: 500;
      border: 1px solid var(--line);
      border-radius: 999px;
      padding: 5px 10px;
      vertical-align: middle;
      margin-left: 8px;
    }
    .palette-head p:last-child { color: var(--muted); max-width: 820px; }
    .swatches { display: grid; grid-template-columns: repeat(auto-fit, minmax(112px, 1fr)); gap: 12px; margin-bottom: 18px; }
    .swatch-card {
      border: 1px solid var(--line);
      background: #fff;
      border-radius: 18px;
      overflow: hidden;
      box-shadow: 0 8px 18px rgba(50,60,70,.05);
    }
    .chip { height: 98px; }
    .swatch-card code {
      display: block;
      padding: 10px 12px 12px;
      font-size: 12px;
      color: var(--muted);
      background: #fbf4e8;
    }
    .preview-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(260px, 1fr)); gap: 14px; }
    .preview-card {
      border: 1px solid var(--line);
      background: linear-gradient(180deg, #fff, #fbf4e8);
      border-radius: 22px;
      padding: 16px 16px 12px;
      overflow: hidden;
    }
    .preview-card h3 { font-size: 15px; color: var(--muted); margin-bottom: 10px; }
    .preview-card img {
      width: 100%%;
      height: auto;
      display: block;
      border-radius: 14px;
      background: #fffaf0;
    }
    .footer { color: var(--muted); text-align: center; padding: 26px 0 0; font-size: 14px; }
  </style>
</head>
<body>
  <main class="wrap">
    <section class="hero">
      <h1>ColorPhage Retro Family Candidates</h1>
      <p>这是第四个进阶 family 的候选预览。Retro 不是脏旧滤镜，而是旧纸张、胶片绿、温暖土色和柔和信号色组成的叙事型科研配色。</p>
      <div class="mode-strip">
        <span class="pill">advanced family: retro</span>
        <span class="pill">candidate count: 3</span>
        <span class="pill">n = 8</span>
        <span class="pill">plots rendered by ggplot2</span>
      </div>
    </section>
    %s
    <p class="footer">Generated by docs/design/build_retro_family_candidates_preview.R</p>
  </main>
</body>
</html>',
  sections
)

out_file <- file.path(design_dir, "retro_family_candidates_preview.html")
writeLines(html, out_file, useBytes = TRUE)
message("Wrote: ", normalizePath(out_file, winslash = "/", mustWork = TRUE))
