\name{phage_palette}
\alias{phage_palette}
\title{Generate a ColorPhage palette}
\usage{
phage_palette(
  n,
  mode = c("soft", "vivid", "forest", "mineral", "ocean", "retro", "cinema", "mist"),
  palette = NULL,
  variant = NULL
)
}
\arguments{
\item{n}{Number of colours to return. Must be at least 1. The first high-cardinality release supports up to 12 colours for the default palettes and up to 8 for the other variants.}
\item{mode}{Palette mode. One of \code{"soft"}, \code{"vivid"}, \code{"forest"}, \code{"mineral"}, \code{"ocean"}, \code{"retro"}, \code{"cinema"}, or \code{"mist"}. Ignored when \code{palette} is supplied.}
\item{palette}{Internal palette id, such as \code{"soft_harbor"}, \code{"vivid_core"}, \code{"forest_canopy"}, \code{"mineral_slate"}, \code{"ocean_current"}, \code{"retro_film"}, \code{"cinema_noir"}, or \code{"mist_cloud"}.}
\item{variant}{Optional variant within a mode, such as \code{"breeze"}, \code{"harbor"}, \code{"mist"}, \code{"core"}, \code{"fresh"}, \code{"drama"}, \code{"canopy"}, \code{"moss"}, \code{"ember"}, \code{"slate"}, \code{"quartz"}, \code{"oxide"}, \code{"current"}, \code{"glass"}, \code{"depth"}, \code{"film"}, \code{"paper"}, \code{"signal"}, \code{"noir"}, \code{"marquee"}, \code{"velvet"}, \code{"cloud"}, \code{"lilac"}, or \code{"shell"}.}
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
phage_palette(8, mode = "ocean", variant = "current")
phage_palette(8, mode = "retro", variant = "film")
phage_palette(8, mode = "cinema", variant = "noir")
phage_palette(8, mode = "mist", variant = "cloud")
phage_palette(10, mode = "soft")
phage_palette(12, mode = "vivid")
}
