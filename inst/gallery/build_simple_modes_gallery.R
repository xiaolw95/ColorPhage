`%||%` <- function(x, y) {
  if (is.null(x)) y else x
}

script_arg <- grep("^--file=", commandArgs(trailingOnly = FALSE), value = TRUE)
script_path <- if (length(script_arg)) sub("^--file=", "", script_arg[[1]]) else getwd()
repo_root <- normalizePath(file.path(dirname(script_path), "..", ".."), winslash = "/", mustWork = FALSE)
if (!file.exists(file.path(repo_root, "DESCRIPTION"))) {
  repo_root <- normalizePath(getwd(), winslash = "/", mustWork = TRUE)
}

source(file.path(repo_root, "R", "data-palettes.R"), local = TRUE)
source(file.path(repo_root, "R", "phage-palette.R"), local = TRUE)

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
  "vivid_drama"
)

bar_heights <- c(58, 76, 66, 88, 72, 96, 64, 82)
line_y <- c(88, 74, 80, 58, 64, 42, 54, 36)
scatter_x <- c(54, 86, 118, 150, 182, 214, 246, 278)
scatter_y <- c(88, 56, 116, 74, 132, 44, 104, 66)

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

bar_svg <- function(colors) {
  bars <- paste(
    sprintf(
      '<rect x="%s" y="%s" width="28" height="%s" rx="7" fill="%s" />',
      seq(28, by = 42, length.out = length(colors)),
      130 - bar_heights,
      bar_heights,
      colors
    ),
    collapse = "\n"
  )
  sprintf(
    '<svg viewBox="0 0 380 150" role="img" aria-label="bar chart preview">
      <line x1="18" y1="132" x2="360" y2="132" stroke="#d8d0c4" stroke-width="1"/>
      %s
    </svg>',
    bars
  )
}

scatter_svg <- function(colors) {
  circles <- paste(
    sprintf(
      '<circle cx="%s" cy="%s" r="9" fill="%s" opacity="0.92" />',
      scatter_x,
      scatter_y,
      colors
    ),
    collapse = "\n"
  )
  sprintf(
    '<svg viewBox="0 0 340 160" role="img" aria-label="scatter plot preview">
      <line x1="26" y1="134" x2="318" y2="134" stroke="#d8d0c4" stroke-width="1"/>
      <line x1="26" y1="22" x2="26" y2="134" stroke="#d8d0c4" stroke-width="1"/>
      %s
    </svg>',
    circles
  )
}

line_svg <- function(colors) {
  lines <- paste(
    vapply(seq_along(colors), function(i) {
      offset <- (i - 1) * 2.4
      points <- paste(
        sprintf(
          "%s,%s",
          seq(28, by = 42, length.out = 8),
          pmax(18, pmin(128, line_y + offset - i * 1.3))
        ),
        collapse = " "
      )
      sprintf(
        '<polyline points="%s" fill="none" stroke="%s" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" opacity="0.84"/>',
        points,
        colors[[i]]
      )
    }, character(1)),
    collapse = "\n"
  )
  sprintf(
    '<svg viewBox="0 0 380 150" role="img" aria-label="line chart preview">
      <line x1="18" y1="132" x2="360" y2="132" stroke="#d8d0c4" stroke-width="1"/>
      <line x1="18" y1="20" x2="18" y2="132" stroke="#d8d0c4" stroke-width="1"/>
      %s
    </svg>',
    lines
  )
}

palette_section <- function(id) {
  meta <- .phage_palettes[[id]]
  colors <- meta$colors
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
      <div class="preview-grid">
        <div class="preview-card"><h3>Fill / bar</h3>%s</div>
        <div class="preview-card"><h3>Colour / scatter</h3>%s</div>
        <div class="preview-card"><h3>Colour / line</h3>%s</div>
      </div>
    </section>',
    escape_html(meta$mode),
    escape_html(meta$variant),
    escape_html(meta$display_name),
    escape_html(meta$id),
    escape_html(meta$role),
    swatch_cards(colors),
    bar_svg(colors),
    scatter_svg(colors),
    line_svg(colors)
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
    .wrap { width: min(1180px, calc(100%% - 48px)); margin: 36px auto 72px; }
    .hero, .palette-section {
      background: rgba(255,253,248,.94);
      border: 1px solid var(--line);
      border-radius: 30px;
      box-shadow: 0 22px 54px rgba(70,80,90,.10);
    }
    .hero { padding: 34px 36px; margin-bottom: 22px; }
    h1, h2, h3, p { margin: 0; }
    h1 { font-size: clamp(34px, 5vw, 58px); letter-spacing: .01em; margin-bottom: 12px; }
    .hero p { max-width: 780px; color: var(--muted); font-size: 17px; }
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
    }
    .preview-card h3 { font-size: 15px; color: var(--muted); margin-bottom: 10px; }
    svg { width: 100%%; height: auto; display: block; }
    .footer { color: var(--muted); text-align: center; padding: 26px 0 0; font-size: 14px; }
  </style>
</head>
<body>
  <main class="wrap">
    <section class="hero">
      <h1>ColorPhage Simple Modes Gallery</h1>
      <p>这是 ColorPhage 简单模式 MVP 的最小 gallery，用来同时检查色块、填充图、散点图和折线图中的真实观感。当前展示 3 组 soft 与 3 组 vivid 的最终 n = 8 版本。</p>
      <div class="mode-strip">
        <span class="pill">soft default: soft_harbor</span>
        <span class="pill">vivid default: vivid_core</span>
        <span class="pill">current limit: n &lt;= 8</span>
      </div>
    </section>
    %s
    <p class="footer">Generated by inst/gallery/build_simple_modes_gallery.R</p>
  </main>
</body>
</html>',
  sections
)

out_file <- file.path(repo_root, "inst", "gallery", "simple_modes_gallery.html")
writeLines(html, out_file, useBytes = TRUE)
message("Wrote: ", normalizePath(out_file, winslash = "/", mustWork = TRUE))
