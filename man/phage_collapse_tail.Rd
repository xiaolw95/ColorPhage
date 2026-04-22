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
\examples{
phage_collapse_tail(
  labels = c("A", "B", "C", "D", "E"),
  values = c(10, 8, 2, 1, 1),
  top_n = 3
)
}
