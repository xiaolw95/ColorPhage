\name{scale_color_phage}
\alias{scale_color_phage}
\title{ColorPhage ggplot2 colour scales}
\usage{
scale_color_phage(
  ...,
  mode = c("soft", "vivid", "forest", "mineral"),
  palette = NULL,
  variant = NULL
)
}
\arguments{
\item{...}{Additional arguments passed to ggplot2 discrete scale constructors.}
\item{mode}{Palette mode. One of \code{"soft"}, \code{"vivid"}, \code{"forest"}, or \code{"mineral"}. Ignored when \code{palette} is supplied.}
\item{palette}{Internal palette id, such as \code{"soft_harbor"}, \code{"vivid_core"}, \code{"forest_canopy"}, or \code{"mineral_slate"}.}
\item{variant}{Optional variant within a mode.}
}
\value{
A ggplot2 scale object.
}
\description{
Creates a discrete ggplot2 colour scale using ColorPhage palettes.
}
