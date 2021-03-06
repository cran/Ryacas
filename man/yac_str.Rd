% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/yac-funcs.R
\name{yac_str}
\alias{yac_str}
\title{Run yacas command returning string/character}
\usage{
yac_str(x)
}
\arguments{
\item{x}{yacas command}
}
\description{
Run yacas command returning string/character
}
\examples{
yac_str("D(x) x^2 + 4*x")
yac_str("Limit(x, 1) (x^2 - 1)/(x - 1)")
yac_str("Sum(n, 1, Infinity, (1/2)^n)")
yac_str("Fibonacci(10)")
yac_str("Sum(n, 1, 10, Fibonacci(n))")
yac_str("TeXForm(x^2 - 1)")

}
\concept{yac_communication}
\concept{yac_symbol}
