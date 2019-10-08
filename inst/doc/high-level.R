## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ---- message=FALSE------------------------------------------------------
library(Ryacas)

## ------------------------------------------------------------------------
x <- yac_symbol("x")
2*x^2 - 5
c(-2, 5)*x
as_r(c(-2, 5)*x) # or yac_expr(c(-2, 5)*x)

## ------------------------------------------------------------------------
A <- outer(0:3, 1:4, "-") + diag(2:5)
a <- 1:4
A
a

## ------------------------------------------------------------------------
B <- yac_symbol(A)
B
as_r(B)
b <- yac_symbol(a)
b
as_r(b)

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
solve(A, a)
solve(B, b)

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
D[3, 4] <- "2*d + 2"
D
D %>% solve()
D %>% solve() %>% simplify()
D %>% solve() %>% simplify() %>% tex()

## ------------------------------------------------------------------------
L <- yac_symbol("x^2 * (y/4) - a*(3*x + 3*y/2 - 45)")
L

## ------------------------------------------------------------------------
deriv(L, "x")
Hessian(L, "x")

## ------------------------------------------------------------------------
deriv(L, c("x", "y", "a"))
H <- Hessian(L, c("x", "y", "a"))
H
as_r(H)
eval(as_r(H), list(x = 2, y = 2, a = 2))

## ------------------------------------------------------------------------
L2 <- yac_symbol(c("x^2 * (y/4) - a*(3*x + 3*y/2 - 45)", 
                   "x^3 + 4*a^2")) # just some function
L2
Jacobian(L2, "x")
Jacobian(L2, c("x", "y", "a"))

## ------------------------------------------------------------------------
xs <- yac_symbol("x")
poly <- xs^2 - xs - 6
poly
zeroes <- solve(poly, "x") # Solve(x^2 - x - 6 == 0, x)
zeroes
tex(zeroes)
zeroes %>% y_rmvars()

## ------------------------------------------------------------------------
solve(poly, 3, "x") # Solve(x^2 - x - 6 == 3, x)
solve(poly, 3, "x") %>% tex()

