\name{scale_colour_continuous_phage}
\alias{scale_colour_continuous_phage}
\alias{scale_color_continuous_phage}
\alias{scale_fill_continuous_phage}
\title{ColorPhage continuous colour scales}
\usage{
scale_colour_continuous_phage(
  ...,
  family = c("soft", "vivid", "forest", "mineral", "ocean", "retro", "cinema", "mist")
)

scale_fill_continuous_phage(
  ...,
  family = c("soft", "vivid", "forest", "mineral", "ocean", "retro", "cinema", "mist")
)
}
\arguments{
\item{...}{Additional arguments passed to ggplot2 continuous scale constructors.}
\item{family}{Palette family used as the continuous gradient anchor.}
}
\value{
A ggplot2 scale object.
}
\description{
Creates ColorPhage continuous scales for gradients, heatmaps, and similar
quantitative displays.
}
\examples{
if (requireNamespace("ggplot2", quietly = TRUE)) {
  ggplot2::ggplot(mtcars, ggplot2::aes(wt, mpg, colour = mpg)) +
    ggplot2::geom_point(size = 3) +
    scale_colour_continuous_phage(family = "ocean")
}
}
