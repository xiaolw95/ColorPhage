\name{phage_palette}
\alias{phage_palette}
\title{Generate a ColorPhage palette}
\usage{
phage_palette(
  n,
  mode = c("soft", "vivid", "forest", "mineral"),
  palette = NULL,
  variant = NULL
)
}
\arguments{
\item{n}{Number of colours to return. Must be between 1 and 8 in the current MVP.}
\item{mode}{Palette mode. One of \code{"soft"}, \code{"vivid"}, \code{"forest"}, or \code{"mineral"}. Ignored when \code{palette} is supplied.}
\item{palette}{Internal palette id, such as \code{"soft_harbor"}, \code{"vivid_core"}, \code{"forest_canopy"}, or \code{"mineral_slate"}.}
\item{variant}{Optional variant within a mode, such as \code{"breeze"}, \code{"harbor"}, \code{"mist"}, \code{"core"}, \code{"fresh"}, \code{"drama"}, \code{"canopy"}, \code{"moss"}, \code{"ember"}, \code{"slate"}, \code{"quartz"}, or \code{"oxide"}.}
}
\value{
A character vector of hexadecimal colours.
}
\description{
Returns colours from the current ColorPhage palette library.
}
\examples{
phage_palette(5, mode = "soft")
phage_palette(8, mode = "vivid", variant = "drama")
phage_palette(8, mode = "forest", variant = "canopy")
phage_palette(8, mode = "mineral", variant = "slate")
}
