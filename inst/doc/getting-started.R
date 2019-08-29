## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ---- message=FALSE------------------------------------------------------
library(Ryacas)

## ------------------------------------------------------------------------
eq <- "x^2 + 4 + 2*x + 2*x"
yac_str(eq) # No task was given to yacas, so we simply get the same returned
yac_str(paste0("Simplify(", eq, ")"))
yac_str(paste0("Factor(", eq, ")"))
yac_expr(paste0("Factor(", eq, ")"))
yac_str(paste0("TeXForm(Factor(", eq, "))"))

## ------------------------------------------------------------------------
y_fn(eq, "Factor")
yac_str(y_fn(eq, "Factor"))
yac_str(y_fn(y_fn(eq, "Factor"), "TeXForm"))

## ------------------------------------------------------------------------
eq %>% y_fn("Factor")
eq %>% y_fn("Factor") %>% yac_str()
eq %>% y_fn("Factor") %>% y_fn("TeXForm") %>% yac_str()

## ------------------------------------------------------------------------
yac_str(paste0("Factor(", eq, ")"))
expr <- yac_expr(paste0("Factor(", eq, ")"))
expr
eval(expr, list(x = 2))

## ------------------------------------------------------------------------
eqy <- yac_symbol(eq)
eqy
as_r(eqy)
eqy %>% y_fn("Factor") # Notice how we do not need to call yac_str()/yac_expr()

## ------------------------------------------------------------------------
A <- outer(0:3, 1:4, "-") + diag(2:5)
a <- 1:4
B <- yac_symbol(A)
B
b <- yac_symbol(a)
b

## ------------------------------------------------------------------------
y_fn(B, "Transpose")
y_fn(B, "Inverse")
y_fn(B, "Trace")

## ------------------------------------------------------------------------
A %*% a
B %*% b
t(A)
t(B)
A[, 2:3]
B[, 2:3]
A %*% solve(A)
B %*% solve(B)

## ---- eval = FALSE-------------------------------------------------------
#  hilbert <- function(n) {
#    i <- 1:n
#    H <- 1 / outer(i - 1, i, "+")
#    return(H)
#  }

## ------------------------------------------------------------------------
hilbert_den <- function(n) { 
  i <- 1:n
  H <- outer(i - 1, i, "+")
  return(H)
}
Hden <- hilbert_den(4)
Hden
H <- 1/Hden
H

## ------------------------------------------------------------------------
Hyden <- yac_symbol(Hden)
Hyden
Hy <- 1/Hyden
Hy

## ------------------------------------------------------------------------
as_r(Hy) # now floating-point and the related problems
diag(Hy)
Hy[upper.tri(Hy)]
Hy[1:2, ]
dim(Hy)
A <- Hy
A[lower.tri(A)] <- "x"
A
as_r(A)
eval(as_r(A), list(x = 999))

