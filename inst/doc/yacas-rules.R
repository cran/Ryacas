## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ---- message=FALSE-----------------------------------------------------------
library(Ryacas)

## -----------------------------------------------------------------------------
system.file(package = "Ryacas", "yacas")

## -----------------------------------------------------------------------------
yac_str("Sum(i, 1, m, 2*i-1)")
yac_str("Sum(i, 0, m, 2^i)")

## -----------------------------------------------------------------------------
yac_str("Sum(i, 1, m, 2^i)")

## -----------------------------------------------------------------------------
yac_str("Sum(i, 0, m, 2*i-1)")

## -----------------------------------------------------------------------------
yac_silent("SumFunc(_k,0,_n,2*_k-1, n^2 - 1)")

## -----------------------------------------------------------------------------
yac_str("Sum(i, 0, m, 2*i-1)")

