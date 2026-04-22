`%||%` <- function(x, y) {
  if (is.null(x)) y else x
}

script_arg <- grep("^--file=", commandArgs(trailingOnly = FALSE), value = TRUE)
script_path <- if (length(script_arg)) sub("^--file=", "", script_arg[[1]]) else getwd()
repo_root <- normalizePath(file.path(dirname(script_path), "..", ".."), winslash = "/", mustWork = FALSE)
if (!file.exists(file.path(repo_root, "DESCRIPTION"))) {
  repo_root <- normalizePath(getwd(), winslash = "/", mustWork = TRUE)
}

if (!requireNamespace("ggplot2", quietly = TRUE)) {
  stop("Package `ggplot2` is required to build the ColorPhage gallery.", call. = FALSE)
}

source(file.path(repo_root, "R", "data-palettes.R"), local = TRUE)
source(file.path(repo_root, "R", "phage-palette.R"), local = TRUE)
source(file.path(repo_root, "R", "ggplot-scales.R"), local = TRUE)

escape_html <- function(x) {
  x <- gsub("&", "&amp;", x, fixed = TRUE)
  x <- gsub("<", "&lt;", x, fixed = TRUE)
  x <- gsub(">", "&gt;", x, fixed = TRUE)
  x
}

palette_ids <- c(
  "soft_breeze",
  "soft_harbor",
  "soft_mist",
  "vivid_core",
  "vivid_fresh",
  "vivid_drama",
  "forest_canopy",
  "forest_moss",
  "forest_ember",
  "mineral_slate",
  "mineral_quartz",
  "mineral_oxide",
  "ocean_current",
  "ocean_glass",
  "ocean_depth",
  "retro_film",
  "retro_paper",
  "retro_signal"
)

gallery_dir <- file.path(repo_root, "inst", "gallery")
figure_dir <- file.path(gallery_dir, "figures")
if (!dir.exists(figure_dir)) {
  dir.create(figure_dir, recursive = TRUE)
}

old_figures <- list.files(figure_dir, pattern = "\\.svg$", full.names = TRUE)
if (length(old_figures)) {
  unlink(old_figures)
}

theme_gallery <- function(base_size = 11) {
  ggplot2::theme_minimal(base_size = base_size) +
    ggplot2::theme(
      text = ggplot2::element_text(family = "sans", colour = "#27313c"),
      plot.background = ggplot2::element_rect(fill = "#fffdf8", colour = NA),
      panel.background = ggplot2::element_rect(fill = "#fffdf8", colour = NA),
      panel.grid.major = ggplot2::element_line(colour = "#e7dfd2", linewidth = 0.35),
      panel.grid.minor = ggplot2::element_blank(),
      axis.title = ggplot2::element_blank(),
      axis.text = ggplot2::element_text(colour = "#6c7480", size = 9),
      legend.position = "none",
      plot.margin = ggplot2::margin(10, 12, 10, 12)
    )
}

save_svg_plot <- function(plot, file, width = 5.8, height = 3.6) {
  grDevices::svg(filename = file, width = width, height = height, bg = "transparent")
  on.exit(grDevices::dev.off(), add = TRUE)
  print(plot)
}

bar_plot <- function(palette_id) {
  values <- c(7.8, 10.2, 8.9, 11.5, 9.6, 12.4, 8.4, 10.9)
  df <- data.frame(
    group = factor(paste0("G", seq_along(values)), levels = paste0("G", seq_along(values))),
    value = values
  )

  ggplot2::ggplot(df, ggplot2::aes(group, value, fill = group)) +
    ggplot2::geom_col(width = 0.72, alpha = 0.96) +
    scale_fill_phage(palette = palette_id) +
    ggplot2::scale_y_continuous(expand = ggplot2::expansion(mult = c(0, 0.12))) +
    ggplot2::labs(title = "Grouped comparison") +
    theme_gallery()
}

scatter_plot <- function(palette_id) {
  set.seed(3401)
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
    scale_color_phage(palette = palette_id) +
    ggplot2::labs(title = "Clustered scatter") +
    theme_gallery()
}

line_plot <- function(palette_id) {
  time <- rep(seq_len(7), times = 8)
  group <- factor(rep(paste0("L", 1:8), each = 7), levels = paste0("L", 1:8))
  baseline <- rep(seq(3.8, 6.2, length.out = 8), each = 7)
  trend <- rep(c(0.15, -0.04, 0.1, 0.2, -0.08, 0.16, 0.05, 0.12), each = 7) * time
  wave <- rep(c(0.4, -0.2, 0.1, -0.35, 0.25, -0.15, 0.32), times = 8)
  df <- data.frame(group = group, time = time, value = baseline + trend + wave)

  ggplot2::ggplot(df, ggplot2::aes(time, value, colour = group, group = group)) +
    ggplot2::geom_line(linewidth = 1.05, alpha = 0.9) +
    ggplot2::geom_point(size = 1.8, alpha = 0.9) +
    scale_color_phage(palette = palette_id) +
    ggplot2::labs(title = "Longitudinal trend") +
    theme_gallery()
}

umap_plot <- function(palette_id) {
  set.seed(909)
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
    scale_color_phage(palette = palette_id) +
    ggplot2::coord_equal() +
    ggplot2::labs(title = "UMAP-like embedding") +
    theme_gallery(base_size = 10) +
    ggplot2::theme(
      axis.text = ggplot2::element_blank(),
      panel.grid = ggplot2::element_blank()
    )
}

make_plot_files <- function(palette_id) {
  plots <- list(
    bar = bar_plot(palette_id),
    scatter = scatter_plot(palette_id),
    line = line_plot(palette_id),
    umap = umap_plot(palette_id)
  )

  files <- vapply(names(plots), function(kind) {
    out <- file.path(figure_dir, sprintf("%s_%s.svg", palette_id, kind))
    save_svg_plot(plots[[kind]], out)
    file.path("figures", basename(out))
  }, character(1))

  files
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
  meta <- .phage_palettes[[id]]
  colors <- meta$colors
  figure_files <- make_plot_files(id)
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
          <p class="eyebrow">%s / %s</p>
          <h2>%s <span>%s</span></h2>
          <p>%s</p>
        </div>
      </div>
      <div class="swatches">%s</div>
      <div class="preview-grid">%s</div>
    </section>',
    escape_html(meta$mode),
    escape_html(meta$variant),
    escape_html(meta$display_name),
    escape_html(meta$id),
    escape_html(meta$role),
    swatch_cards(colors),
    plot_cards
  )
}

sections <- paste(vapply(palette_ids, palette_section, character(1)), collapse = "\n")

html <- sprintf(
'<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ColorPhage Simple Modes Gallery</title>
  <style>
    :root {
      --bg: #f4f1ea;
      --panel: #fffdf8;
      --ink: #27313c;
      --muted: #6c7480;
      --line: #ded6ca;
      --soft: #92adc0;
      --vivid: #415a80;
    }
    * { box-sizing: border-box; }
    body {
      margin: 0;
      font-family: "Segoe UI", "PingFang SC", "Microsoft YaHei", sans-serif;
      color: var(--ink);
      background:
        radial-gradient(circle at 12%% 10%%, rgba(146,173,192,.28), transparent 28%%),
        radial-gradient(circle at 86%% 6%%, rgba(201,123,93,.18), transparent 24%%),
        radial-gradient(circle at 82%% 86%%, rgba(91,154,144,.16), transparent 24%%),
        var(--bg);
      line-height: 1.55;
    }
    .wrap { width: min(1280px, calc(100%% - 48px)); margin: 36px auto 72px; }
    .hero, .palette-section {
      background: rgba(255,253,248,.94);
      border: 1px solid var(--line);
      border-radius: 30px;
      box-shadow: 0 22px 54px rgba(70,80,90,.10);
    }
    .hero { padding: 34px 36px; margin-bottom: 22px; }
    h1, h2, h3, p { margin: 0; }
    h1 { font-size: clamp(34px, 5vw, 58px); letter-spacing: .01em; margin-bottom: 12px; }
    .hero p { max-width: 860px; color: var(--muted); font-size: 17px; }
    .mode-strip { display: flex; flex-wrap: wrap; gap: 10px; margin-top: 22px; }
    .pill {
      border: 1px solid var(--line);
      border-radius: 999px;
      padding: 8px 14px;
      background: #f8f5ef;
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
    .palette-head p:last-child { color: var(--muted); max-width: 760px; }
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
      background: #fbf8f2;
    }
    .preview-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(260px, 1fr)); gap: 14px; }
    .preview-card {
      border: 1px solid var(--line);
      background: linear-gradient(180deg, #fff, #f9f5ef);
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
      background: #fffdf8;
    }
    .footer { color: var(--muted); text-align: center; padding: 26px 0 0; font-size: 14px; }
  </style>
</head>
<body>
  <main class="wrap">
    <section class="hero">
      <h1>ColorPhage Palette Gallery</h1>
      <p>这是 ColorPhage MVP 的真实 ggplot2 gallery，用来同时检查色块、填充图、散点图、折线图和 UMAP-like 场景中的实际观感。当前展示 3 组 soft、3 组 vivid、3 组 forest、3 组 mineral、3 组 ocean 与 3 组 retro 的最终 n = 8 版本。</p>
      <div class="mode-strip">
        <span class="pill">soft default: soft_harbor</span>
        <span class="pill">vivid default: vivid_core</span>
        <span class="pill">forest default: forest_canopy</span>
        <span class="pill">mineral default: mineral_slate</span>
        <span class="pill">ocean default: ocean_current</span>
        <span class="pill">retro default: retro_film</span>
        <span class="pill">current limit: n &lt;= 8</span>
        <span class="pill">plots rendered by ggplot2</span>
      </div>
    </section>
    %s
    <p class="footer">Generated by inst/gallery/build_simple_modes_gallery.R</p>
  </main>
</body>
</html>',
  sections
)

out_file <- file.path(gallery_dir, "simple_modes_gallery.html")
writeLines(html, out_file, useBytes = TRUE)
message("Wrote: ", normalizePath(out_file, winslash = "/", mustWork = TRUE))
