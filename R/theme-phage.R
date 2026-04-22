#' ColorPhage ggplot2 theme
#'
#' `theme_phage()` provides a publication-oriented ggplot2 theme tuned to the
#' current ColorPhage palette system. The first version keeps a soft warm
#' background, restrained grid lines, clear titles, and unobtrusive legends.
#'
#' @param base_size Base font size passed to ggplot2 theme constructors.
#' @param base_family Base font family.
#' @param grid Grid line style. One of `"y"`, `"both"`, or `"none"`.
#' @param legend_position Legend position. Passed to ggplot2 theme.
#'
#' @return A ggplot2 theme object.
#' @export
#'
#' @examples
#' if (requireNamespace("ggplot2", quietly = TRUE)) {
#'   ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg, colour = factor(cyl))) +
#'     ggplot2::geom_point(size = 3) +
#'     scale_color_phage(mode = "vivid") +
#'     theme_phage()
#' }
theme_phage <- function(base_size = 11,
                        base_family = "sans",
                        grid = c("y", "both", "none"),
                        legend_position = "right") {
  .check_ggplot2()

  grid <- match.arg(grid)

  theme <- ggplot2::theme_minimal(base_size = base_size, base_family = base_family) +
    ggplot2::theme(
      text = ggplot2::element_text(colour = "#27313C"),
      plot.background = ggplot2::element_rect(fill = "#F4F1EA", colour = NA),
      panel.background = ggplot2::element_rect(fill = "#FFFDF8", colour = NA),
      panel.border = ggplot2::element_blank(),
      panel.grid.major = ggplot2::element_line(colour = "#E7DFD2", linewidth = 0.35),
      panel.grid.minor = ggplot2::element_blank(),
      axis.line = ggplot2::element_blank(),
      axis.ticks = ggplot2::element_blank(),
      axis.title = ggplot2::element_text(colour = "#4F5B66", face = "plain"),
      axis.text = ggplot2::element_text(colour = "#6C7480"),
      plot.title = ggplot2::element_text(face = "bold", size = base_size * 1.28),
      plot.subtitle = ggplot2::element_text(colour = "#5F6873", size = base_size * 0.98),
      plot.caption = ggplot2::element_text(colour = "#7A838C", size = base_size * 0.82),
      strip.background = ggplot2::element_rect(fill = "#F8F4EC", colour = "#DED6CA", linewidth = 0.5),
      strip.text = ggplot2::element_text(face = "bold", colour = "#46515D"),
      legend.position = legend_position,
      legend.background = ggplot2::element_rect(fill = "#FFFDF8", colour = NA),
      legend.key = ggplot2::element_rect(fill = "#FFFDF8", colour = NA),
      legend.title = ggplot2::element_text(face = "bold", colour = "#46515D"),
      legend.text = ggplot2::element_text(colour = "#5F6873"),
      plot.margin = ggplot2::margin(10, 12, 10, 12)
    )

  if (identical(grid, "y")) {
    theme <- theme +
      ggplot2::theme(
        panel.grid.major.x = ggplot2::element_blank()
      )
  } else if (identical(grid, "none")) {
    theme <- theme +
      ggplot2::theme(
        panel.grid.major = ggplot2::element_blank()
      )
  }

  theme
}
