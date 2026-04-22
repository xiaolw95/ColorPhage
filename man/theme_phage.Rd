\name{theme_phage}
\alias{theme_phage}
\title{ColorPhage ggplot2 theme}
\usage{
theme_phage(
  base_size = 11,
  base_family = "sans",
  grid = c("y", "both", "none"),
  legend_position = "right"
)
}
\arguments{
\item{base_size}{Base font size passed to ggplot2 theme constructors.}
\item{base_family}{Base font family.}
\item{grid}{Grid line style. One of \code{"y"}, \code{"both"}, or \code{"none"}.}
\item{legend_position}{Legend position. Passed to ggplot2 theme.}
}
\value{
A ggplot2 theme object.
}
\description{
Creates a publication-oriented ggplot2 theme matched to the current
ColorPhage palette system.
}
\examples{
if (requireNamespace("ggplot2", quietly = TRUE)) {
  ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg, colour = factor(cyl))) +
    ggplot2::geom_point(size = 3) +
    scale_color_phage(mode = "vivid") +
    theme_phage()
}
}
