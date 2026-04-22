\name{phage_palette}
\alias{phage_palette}
\title{Generate a ColorPhage palette}
\usage{
phage_palette(n, mode = c("soft", "vivid"), palette = NULL, variant = NULL)
}
\arguments{
\item{n}{Number of colours to return. Must be between 1 and 8 in the current MVP.}
\item{mode}{Simple mode. One of \code{"soft"} or \code{"vivid"}. Ignored when \code{palette} is supplied.}
\item{palette}{Internal palette id, such as \code{"soft_harbor"} or \code{"vivid_core"}.}
\item{variant}{Optional variant within a mode, such as \code{"breeze"}, \code{"harbor"}, \code{"mist"}, \code{"core"}, \code{"fresh"}, or \code{"drama"}.}
}
\value{
A character vector of hexadecimal colours.
}
\description{
Returns colours from the current ColorPhage simple-mode palette library.
}
\examples{
phage_palette(5, mode = "soft")
phage_palette(8, mode = "vivid", variant = "drama")
}
