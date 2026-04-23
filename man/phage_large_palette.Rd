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
\details{
This helper is intended for complex classification figures such as
fine-grained single-cell UMAPs or large multi-group scatter plots. It should
not be treated as a simple "more colours" version of \code{\link[=phage_palette]{phage_palette()}}.
For \code{n <= 12}, use \code{\link[=phage_palette]{phage_palette()}} instead.

\code{strategy = "clustered"} is recommended when a figure has many categories
but no clear parent-child structure. \code{strategy = "hierarchical"} is
recommended when labels naturally belong to parent groups and colours should
reflect that grouping.

These experimental helpers intentionally avoid pretending that every
20-30-category figure can be solved by a flat discrete palette. When the data
are strongly long-tailed, consider preprocessing with
\code{\link[=phage_collapse_tail]{phage_collapse_tail()}} before plotting.
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
