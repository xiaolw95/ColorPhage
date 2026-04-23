#' Experimental large-scale ColorPhage palette helper
#'
#' `phage_large_palette()` is an experimental helper for scenarios where a
#' figure needs more categories than the standard discrete palette system can
#' safely support as flat colours. It currently provides a clustered strategy
#' and a hierarchical strategy for 13 to 30 categories.
#'
#' This helper is intended for complex classification figures such as
#' fine-grained single-cell UMAPs or large multi-group scatter plots. It
#' should not be treated as a simple "more colours" version of
#' [phage_palette()]. For `n <= 12`, use [phage_palette()] instead.
#'
#' @param n Number of colours to return. Used for `strategy = "clustered"`.
#' @param labels Optional labels for the output colours. Required for
#'   `strategy = "hierarchical"`.
#' @param strategy Large-scale strategy. One of `"clustered"` or
#'   `"hierarchical"`.
#' @param family Palette family used as the style anchor. One of the current
#'   ColorPhage mode names.
#' @param groups Optional parent-group labels for `strategy = "hierarchical"`.
#'
#' @return A character vector of hexadecimal colours. When `labels` are
#'   supplied, the vector is named.
#'
#' @details
#' `strategy = "clustered"` is recommended when a figure has many categories
#' but no clear parent-child structure. `strategy = "hierarchical"` is
#' recommended when labels naturally belong to parent groups and colours should
#' reflect that grouping.
#'
#' These experimental helpers intentionally avoid pretending that every
#' 20-30-category figure can be solved by a flat discrete palette. When the
#' data are strongly long-tailed, consider preprocessing with
#' [phage_collapse_tail()] before plotting.
#' @export
#'
#' @examples
#' phage_large_palette(n = 24, strategy = "clustered", family = "ocean")
#'
#' phage_large_palette(
#'   labels = paste0("Subtype_", 1:12),
#'   groups = rep(c("A", "B", "C"), each = 4),
#'   strategy = "hierarchical",
#'   family = "forest"
#' )
phage_large_palette <- function(n = NULL,
                                labels = NULL,
                                strategy = c("clustered", "hierarchical"),
                                family = c("soft", "vivid", "forest", "mineral", "ocean", "retro", "cinema", "mist"),
                                groups = NULL) {
  strategy <- match.arg(strategy)
  family <- match.arg(family)

  if (identical(strategy, "clustered")) {
    if (is.null(n)) {
      if (is.null(labels)) {
        stop("`n` or `labels` must be supplied for clustered large-scale palettes.", call. = FALSE)
      }
      n <- length(labels)
    }

    n <- .validate_large_n(n)
    cols <- .build_clustered_palette(n = n, family = family)

    if (!is.null(labels)) {
      if (length(labels) != n) {
        stop("`labels` must have the same length as `n`.", call. = FALSE)
      }
      names(cols) <- labels
    }

    return(cols)
  }

  if (is.null(labels) || is.null(groups)) {
    stop("`labels` and `groups` are required for hierarchical large-scale palettes.", call. = FALSE)
  }

  if (length(labels) != length(groups)) {
    stop("`labels` and `groups` must have the same length.", call. = FALSE)
  }

  if (length(unique(labels)) != length(labels)) {
    stop("`labels` must be unique for hierarchical large-scale palettes.", call. = FALSE)
  }

  .build_hierarchical_palette(labels = labels, groups = groups, family = family)
}

#' Collapse long-tail categories for composition plots
#'
#' `phage_collapse_tail()` helps prepare long-tail composition plots, such as
#' microbiome abundance charts, by preserving only the top categories and
#' collapsing the rest into a single `Other` level.
#'
#' This helper is intended for composition-like plots where the tail is less
#' important than the dominant categories. It is not a palette generator. Its
#' purpose is to improve plot readability before colours are assigned.
#'
#' @param labels Category labels.
#' @param values Numeric values used to rank category importance.
#' @param top_n Number of categories to preserve before collapsing the tail.
#' @param other_label Label used for the collapsed remainder.
#'
#' @return A character vector with the same length as `labels`.
#'
#' @details
#' Typical use cases include stacked abundance bars, proportional area plots,
#' or other long-tail composition displays. In these cases, collapsing the tail
#' often produces a more interpretable figure than trying to assign distinct
#' colours to every minor category.
#' @export
#'
#' @examples
#' phage_collapse_tail(
#'   labels = c("A", "B", "C", "D", "E"),
#'   values = c(10, 8, 2, 1, 1),
#'   top_n = 3
#' )
phage_collapse_tail <- function(labels,
                                values,
                                top_n = 12,
                                other_label = "Other") {
  if (length(labels) != length(values)) {
    stop("`labels` and `values` must have the same length.", call. = FALSE)
  }

  if (!is.numeric(values) || any(is.na(values))) {
    stop("`values` must be a numeric vector without missing values.", call. = FALSE)
  }

  if (length(top_n) != 1 || is.na(top_n) || !is.numeric(top_n) || top_n < 1) {
    stop("`top_n` must be a single positive numeric value.", call. = FALSE)
  }

  labels <- as.character(labels)
  top_n <- as.integer(top_n)

  totals <- stats::aggregate(values, by = list(label = labels), FUN = sum)
  keep <- totals$label[order(totals$x, decreasing = TRUE)][seq_len(min(top_n, nrow(totals)))]

  ifelse(labels %in% keep, labels, other_label)
}

.validate_large_n <- function(n) {
  if (length(n) != 1 || is.na(n) || !is.numeric(n)) {
    stop("`n` must be a single numeric value.", call. = FALSE)
  }

  n <- as.integer(n)

  if (n < 13) {
    stop("For `n <= 12`, use `phage_palette()` instead of `phage_large_palette()`.", call. = FALSE)
  }

  if (n > 30) {
    stop("The current experimental large-scale helpers support up to 30 categories.", call. = FALSE)
  }

  n
}

.build_clustered_palette <- function(n, family) {
  base <- .large_scale_base_colors(family)
  anchor_n <- max(4L, ceiling(n / 4))
  anchor_n <- min(anchor_n, length(base))
  anchor_idx <- unique(round(seq(1, length(base), length.out = anchor_n)))
  anchors <- base[anchor_idx]

  per_anchor <- ceiling(n / length(anchors))
  cols <- unlist(lapply(anchors, function(anchor) {
    .make_variants(anchor, per_anchor)
  }), use.names = FALSE)

  cols[seq_len(n)]
}

.build_hierarchical_palette <- function(labels, groups, family) {
  labels <- as.character(labels)
  groups <- as.character(groups)
  parent_levels <- unique(groups)
  parent_cols <- .build_clustered_palette(n = max(13L, length(parent_levels)), family = family)[seq_along(parent_levels)]
  names(parent_cols) <- parent_levels

  out <- character(length(labels))
  names(out) <- labels

  for (parent in parent_levels) {
    idx <- which(groups == parent)
    variants <- .make_variants(parent_cols[[parent]], length(idx))
    out[idx] <- variants
  }

  out
}

.large_scale_base_colors <- function(family) {
  palette_id <- .phage_mode_defaults[[family]]
  palette <- .phage_palettes[[palette_id]]
  extensions <- palette$extensions %||% list()

  if (!is.null(extensions[["12"]])) {
    return(extensions[["12"]])
  }

  palette$colors
}

.make_variants <- function(anchor, n) {
  if (n <= 1) {
    return(anchor)
  }

  variant_plan <- list(
    .blend_hex(anchor, "#1F2933", 0.16),
    anchor,
    .blend_hex(anchor, "#FFFFFF", 0.18),
    .blend_hex(anchor, "#FFFFFF", 0.34),
    .blend_hex(anchor, "#F3EFE7", 0.46)
  )

  if (n <= length(variant_plan)) {
    return(unlist(variant_plan[seq_len(n)], use.names = FALSE))
  }

  extra_steps <- seq(0.14, 0.54, length.out = n)
  unique(vapply(extra_steps, function(step) .blend_hex(anchor, "#FFFFFF", step), character(1)))[seq_len(n)]
}

.blend_hex <- function(color, target, amount) {
  amount <- max(0, min(1, amount))
  from_rgb <- grDevices::col2rgb(color)
  to_rgb <- grDevices::col2rgb(target)
  mixed <- round(from_rgb * (1 - amount) + to_rgb * amount)
  grDevices::rgb(mixed[1], mixed[2], mixed[3], maxColorValue = 255)
}
