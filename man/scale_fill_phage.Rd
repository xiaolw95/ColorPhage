\name{scale_fill_phage}
\alias{scale_fill_phage}
\title{ColorPhage ggplot2 fill scales}
\usage{
scale_fill_phage(
  ...,
  mode = c("soft", "vivid", "forest", "mineral", "ocean", "retro"),
  palette = NULL,
  variant = NULL
)
}
\arguments{
\item{...}{Additional arguments passed to ggplot2 discrete scale constructors.}
\item{mode}{Palette mode. One of \code{"soft"}, \code{"vivid"}, \code{"forest"}, \code{"mineral"}, \code{"ocean"}, or \code{"retro"}. Ignored when \code{palette} is supplied.}
\item{palette}{Internal palette id, such as \code{"soft_harbor"}, \code{"vivid_core"}, \code{"forest_canopy"}, \code{"mineral_slate"}, \code{"ocean_current"}, or \code{"retro_film"}.}
\item{variant}{Optional variant within a mode.}
}
\value{
A ggplot2 scale object.
}
\description{
Creates a discrete ggplot2 fill scale using ColorPhage palettes.
}
