\name{scale_colour_diverging_phage}
\alias{scale_colour_diverging_phage}
\alias{scale_color_diverging_phage}
\alias{scale_fill_diverging_phage}
\title{ColorPhage diverging colour scales}
\usage{
scale_colour_diverging_phage(
  ...,
  family = c("mineral", "ocean", "forest", "soft", "cinema"),
  midpoint = 0
)

scale_fill_diverging_phage(
  ...,
  family = c("mineral", "ocean", "forest", "soft", "cinema"),
  midpoint = 0
)
}
\arguments{
\item{...}{Additional arguments passed to ggplot2 diverging scale constructors.}
\item{family}{Diverging palette family.}
\item{midpoint}{Midpoint passed to ggplot2 diverging scale constructors.}
}
\value{
A ggplot2 scale object.
}
\description{
Creates ColorPhage diverging scales for centered quantitative displays such as
signed heatmaps and enrichment effects.
}
\examples{
if (requireNamespace("ggplot2", quietly = TRUE)) {
  ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg, colour = mpg - mean(mpg))) +
    ggplot2::geom_point(size = 3) +
    scale_colour_diverging_phage(family = "mineral")
}
}
