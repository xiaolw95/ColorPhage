#' ColorPhage ggplot2 colour scales
#'
#' @inheritParams phage_palette
#' @param ... Additional arguments passed to ggplot2 discrete scale
#'   constructors.
#'
#' @return A ggplot2 scale object.
#' @export
#'
#' @examples
#' if (requireNamespace("ggplot2", quietly = TRUE)) {
#'   ggplot2::ggplot(mtcars, ggplot2::aes(factor(cyl), mpg, colour = factor(cyl))) +
#'     ggplot2::geom_point() +
#'     scale_color_phage(mode = "vivid")
#' }
scale_color_phage <- function(...,
                              mode = c("soft", "vivid", "forest", "mineral", "ocean", "retro", "cinema", "mist"),
                              palette = NULL,
                              variant = NULL) {
  .check_ggplot2()
  ggplot2::discrete_scale(
    aesthetics = "colour",
    palette = .ggplot_palette(mode = mode, palette = palette, variant = variant),
    ...
  )
}

#' ColorPhage ggplot2 fill scales
#'
#' @inheritParams scale_color_phage
#'
#' @return A ggplot2 scale object.
#' @export
#'
#' @examples
#' if (requireNamespace("ggplot2", quietly = TRUE)) {
#'   ggplot2::ggplot(mtcars, ggplot2::aes(factor(cyl), fill = factor(cyl))) +
#'     ggplot2::geom_bar() +
#'     scale_fill_phage(mode = "soft")
#' }
scale_fill_phage <- function(...,
                             mode = c("soft", "vivid", "forest", "mineral", "ocean", "retro", "cinema", "mist"),
                             palette = NULL,
                             variant = NULL) {
  .check_ggplot2()
  ggplot2::discrete_scale(
    aesthetics = "fill",
    palette = .ggplot_palette(mode = mode, palette = palette, variant = variant),
    ...
  )
}

.ggplot_palette <- function(mode, palette = NULL, variant = NULL) {
  force(mode)
  force(palette)
  force(variant)

  function(n) {
    phage_palette(n = n, mode = mode, palette = palette, variant = variant)
  }
}

.check_ggplot2 <- function() {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("Package `ggplot2` is required for ColorPhage scale helpers.", call. = FALSE)
  }
}
