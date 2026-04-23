\name{phage_collapse_tail}
\alias{phage_collapse_tail}
\title{Collapse long-tail categories for composition plots}
\usage{
phage_collapse_tail(labels, values, top_n = 12, other_label = "Other")
}
\arguments{
\item{labels}{Category labels.}
\item{values}{Numeric values used to rank category importance.}
\item{top_n}{Number of categories to preserve before collapsing the tail.}
\item{other_label}{Label used for the collapsed remainder.}
}
\value{
A character vector with the same length as \code{labels}.
}
\description{
Helps prepare long-tail composition plots by preserving only the top
categories and collapsing the rest into a single \code{Other} level.
}
\details{
This helper is intended for composition-like plots where the tail is less
important than the dominant categories. It is not a palette generator. Its
purpose is to improve plot readability before colours are assigned.

Typical use cases include stacked abundance bars, proportional area plots, or
other long-tail composition displays. In these cases, collapsing the tail
often produces a more interpretable figure than trying to assign distinct
colours to every minor category.
}
\examples{
phage_collapse_tail(
  labels = c("A", "B", "C", "D", "E"),
  values = c(10, 8, 2, 1, 1),
  top_n = 3
)
}
