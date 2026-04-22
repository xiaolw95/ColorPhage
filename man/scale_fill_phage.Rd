\name{scale_fill_phage}
\alias{scale_fill_phage}
\title{ColorPhage ggplot2 fill scales}
\usage{
scale_fill_phage(..., mode = c("soft", "vivid"), palette = NULL, variant = NULL)
}
\arguments{
\item{...}{Additional arguments passed to ggplot2 discrete scale constructors.}
\item{mode}{Simple mode. One of \code{"soft"} or \code{"vivid"}. Ignored when \code{palette} is supplied.}
\item{palette}{Internal palette id, such as \code{"soft_harbor"} or \code{"vivid_core"}.}
\item{variant}{Optional variant within a mode.}
}
\value{
A ggplot2 scale object.
}
\description{
Creates a discrete ggplot2 fill scale using ColorPhage palettes.
}
