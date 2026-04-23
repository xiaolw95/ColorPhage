\name{phage_diverging_palette}
\alias{phage_diverging_palette}
\title{Generate a diverging ColorPhage palette}
\usage{
phage_diverging_palette(
  n = 256,
  family = c("mineral", "ocean", "forest", "soft", "cinema")
)
}
\arguments{
\item{n}{Number of colours to return.}
\item{family}{Diverging palette family.}
}
\value{
A character vector of hexadecimal colours.
}
\description{
Returns a low-mid-high diverging palette for centered quantitative displays,
such as signed heatmaps and enrichment effects.
}
\examples{
phage_diverging_palette(11, family = "mineral")
}
