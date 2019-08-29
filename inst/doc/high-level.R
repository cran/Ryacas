## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ---- message=FALSE------------------------------------------------------
library(Ryacas)

## ------------------------------------------------------------------------
A <- outer(0:3, 1:4, "-") + diag(2:5)
a <- 1:4
A
a

## ------------------------------------------------------------------------
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
exp(B)
as_r(exp(B))
A[, 2:3]
B[, 2:3]
A[upper.tri(A)] <- 1
B[upper.tri(B)] <- 1
A
B
2*A - A
2*B - B
A %*% solve(A)
B %*% solve(B)
solve(A %*% t(A))
solve(B %*% t(B))

## ------------------------------------------------------------------------
yac_str("W") # Get variable W if exists, or else just a symbol
yac_str("Variables()") # ...or list variables
B
yac_assign(B, "W") # assign B in R to W in yacas
yac_str("W") # Get variable W if exists, or else just a symbol
yac_str("Variables()") # ...or list variables
yac_silent("Clear(W)")
yac_str("Variables()") # List variables
yac_str("W") # Get variable W if exists, or else just a symbol

## ------------------------------------------------------------------------
D <- diag(4) %>% yac_symbol()
D
D <- D/2
D
D[2:3, 1] <- "d"
D[3,4] <- "2*d + 2"
D
D %>% solve()
D %>% solve() %>% simplify()
D %>% solve() %>% simplify() %>% tex()

