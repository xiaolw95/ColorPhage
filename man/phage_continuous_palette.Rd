\name{phage_continuous_palette}
\alias{phage_continuous_palette}
\title{Generate a continuous ColorPhage palette}
\usage{
phage_continuous_palette(
  n = 256,
  family = c("soft", "vivid", "forest", "mineral", "ocean", "retro", "cinema", "mist")
)
}
\arguments{
\item{n}{Number of colours to return.}
\item{family}{Continuous palette family. One of the current ColorPhage family names.}
}
\value{
A character vector of hexadecimal colours.
}
\description{
Returns an interpolated continuous palette based on family-specific anchor
colours tuned for gradients and heatmap-like displays.
}
\examples{
phage_continuous_palette(9, family = "ocean")
}
