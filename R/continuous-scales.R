#' Generate a continuous ColorPhage palette
#'
#' `phage_continuous_palette()` returns an interpolated continuous palette based
#' on family-specific anchor colours tuned for gradients and heatmap-like
#' displays.
#'
#' @param n Number of colours to return.
#' @param family Continuous palette family. One of the current ColorPhage
#'   family names.
#'
#' @return A character vector of hexadecimal colours.
#' @export
#'
#' @examples
#' phage_continuous_palette(9, family = "ocean")
phage_continuous_palette <- function(n = 256,
                                     family = c("soft", "vivid", "forest", "mineral", "ocean", "retro", "cinema", "mist")) {
  family <- match.arg(family)
  n <- .validate_continuous_n(n)
  anchors <- .phage_continuous_anchors[[family]]
  grDevices::colorRampPalette(anchors, space = "Lab")(n)
}

#' Generate a diverging ColorPhage palette
#'
#' `phage_diverging_palette()` returns a low-mid-high diverging palette for
#' centered quantitative displays, such as signed heatmaps and enrichment
#' effects.
#'
#' @param n Number of colours to return.
#' @param family Diverging palette family.
#'
#' @return A character vector of hexadecimal colours.
#' @export
#'
#' @examples
#' phage_diverging_palette(11, family = "mineral")
phage_diverging_palette <- function(n = 256,
                                    family = c("mineral", "ocean", "forest", "soft", "cinema")) {
  family <- match.arg(family)
  n <- .validate_continuous_n(n)
  anchors <- .phage_diverging_anchors[[family]]
  grDevices::colorRampPalette(anchors, space = "Lab")(n)
}

#' ColorPhage continuous colour scales
#'
#' @param ... Additional arguments passed to ggplot2 continuous scale
#'   constructors.
#' @param family Palette family used as the continuous gradient anchor.
#'
#' @return A ggplot2 scale object.
#' @export
#'
#' @examples
#' if (requireNamespace("ggplot2", quietly = TRUE)) {
#'   ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg, colour = mpg)) +
#'     ggplot2::geom_point(size = 3) +
#'     scale_colour_continuous_phage(family = "ocean")
#' }
scale_colour_continuous_phage <- function(...,
                                          family = c("soft", "vivid", "forest", "mineral", "ocean", "retro", "cinema", "mist")) {
  .check_ggplot2()
  family <- match.arg(family)
  ggplot2::scale_colour_gradientn(
    colours = phage_continuous_palette(256, family = family),
    ...
  )
}

#' @rdname scale_colour_continuous_phage
#' @export
scale_color_continuous_phage <- scale_colour_continuous_phage

#' @rdname scale_colour_continuous_phage
#' @export
scale_fill_continuous_phage <- function(...,
                                        family = c("soft", "vivid", "forest", "mineral", "ocean", "retro", "cinema", "mist")) {
  .check_ggplot2()
  family <- match.arg(family)
  ggplot2::scale_fill_gradientn(
    colours = phage_continuous_palette(256, family = family),
    ...
  )
}

#' ColorPhage diverging colour scales
#'
#' @param ... Additional arguments passed to ggplot2 diverging scale
#'   constructors.
#' @param family Diverging palette family.
#' @param midpoint Midpoint passed to ggplot2 diverging scale constructors.
#'
#' @return A ggplot2 scale object.
#' @export
#'
#' @examples
#' if (requireNamespace("ggplot2", quietly = TRUE)) {
#'   ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg, colour = mpg - mean(mpg))) +
#'     ggplot2::geom_point(size = 3) +
#'     scale_colour_diverging_phage(family = "mineral")
#' }
scale_colour_diverging_phage <- function(...,
                                         family = c("mineral", "ocean", "forest", "soft", "cinema"),
                                         midpoint = 0) {
  .check_ggplot2()
  family <- match.arg(family)
  ggplot2::scale_colour_gradient2(
    low = .phage_diverging_anchors[[family]][[1]],
    mid = .phage_diverging_anchors[[family]][[2]],
    high = .phage_diverging_anchors[[family]][[3]],
    midpoint = midpoint,
    ...
  )
}

#' @rdname scale_colour_diverging_phage
#' @export
scale_color_diverging_phage <- scale_colour_diverging_phage

#' @rdname scale_colour_diverging_phage
#' @export
scale_fill_diverging_phage <- function(...,
                                       family = c("mineral", "ocean", "forest", "soft", "cinema"),
                                       midpoint = 0) {
  .check_ggplot2()
  family <- match.arg(family)
  ggplot2::scale_fill_gradient2(
    low = .phage_diverging_anchors[[family]][[1]],
    mid = .phage_diverging_anchors[[family]][[2]],
    high = .phage_diverging_anchors[[family]][[3]],
    midpoint = midpoint,
    ...
  )
}

.validate_continuous_n <- function(n) {
  if (length(n) != 1 || is.na(n) || !is.numeric(n)) {
    stop("`n` must be a single numeric value.", call. = FALSE)
  }

  n <- as.integer(n)

  if (n < 2) {
    stop("`n` must be at least 2 for continuous palettes.", call. = FALSE)
  }

  n
}

.phage_continuous_anchors <- list(
  soft = c("#C8D6E3", "#92ADC0", "#9DBCBA", "#B7C9A5", "#F1B04A"),
  vivid = c("#1D3557", "#355C7D", "#457B9D", "#A8DADC", "#E63946"),
  forest = c("#18372E", "#23483A", "#6F8F62", "#A9B98F", "#D6B36A"),
  mineral = c("#1D2F40", "#536879", "#AFC0C8", "#D7D2C3", "#A46F5E"),
  ocean = c("#153C4A", "#1F4E5F", "#337A84", "#A7CED1", "#D8E7E4"),
  retro = c("#373C36", "#6F7764", "#A19B72", "#D5C08A", "#C7835F"),
  cinema = c("#17202A", "#1F2A36", "#6A7D91", "#D9D5CC", "#B45A53"),
  mist = c("#70879D", "#8CA0B3", "#D8E0DE", "#E8E5DE", "#C9B7C4")
)

.phage_diverging_anchors <- list(
  mineral = c("#355C7D", "#F1EEE6", "#B45A53"),
  ocean = c("#1F4E5F", "#F6F4EE", "#C99A6B"),
  forest = c("#23483A", "#F1EBDD", "#C98563"),
  soft = c("#92ADC0", "#F7F2EB", "#EB6E51"),
  cinema = c("#3C4E63", "#F2ECE3", "#B45A53")
)
