\name{phage_large_palette}
\alias{phage_large_palette}
\title{Experimental large-scale ColorPhage palette helper}
\usage{
phage_large_palette(
  n = NULL,
  labels = NULL,
  strategy = c("clustered", "hierarchical"),
  family = c("soft", "vivid", "forest", "mineral", "ocean", "retro", "cinema", "mist"),
  groups = NULL
)
}
\arguments{
\item{n}{Number of colours to return. Used for \code{strategy = "clustered"}.}
\item{labels}{Optional labels for the output colours. Required for \code{strategy = "hierarchical"}.}
\item{strategy}{Large-scale strategy. One of \code{"clustered"} or \code{"hierarchical"}.}
\item{family}{Palette family used as the style anchor. One of the current ColorPhage mode names.}
\item{groups}{Optional parent-group labels for \code{strategy = "hierarchical"}.}
}
\value{
A character vector of hexadecimal colours. When \code{labels} are supplied, the vector is named.
}
\description{
Experimental helper for scenarios where a figure needs more categories than the
standard discrete palette system can safely support as flat colours.
}
\examples{
phage_large_palette(n = 24, strategy = "clustered", family = "ocean")

phage_large_palette(
  labels = paste0("Subtype_", 1:12),
  groups = rep(c("A", "B", "C"), each = 4),
  strategy = "hierarchical",
  family = "forest"
)
}
