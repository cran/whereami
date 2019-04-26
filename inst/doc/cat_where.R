## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "figures/"
)

## ----setup---------------------------------------------------------------
library(whereami)

## ----eval=FALSE----------------------------------------------------------
#  cat_where(whereami())
#  cat_where(whereami(), type = "bullet", bullet = "tick")
#  cat_where(whereami(), type = "boxx")
#  cat_where(whereami(), type = "line", background_col = "red")
#  cat_where(whereami(), color = "green")
#  cat_where(whereami(), type = "line", color = "yellow")

