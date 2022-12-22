## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(whereami)

## ----eval=FALSE---------------------------------------------------------------
#  cat_where(whereami())
#  cat_where(whereami(), type = "bullet", bullet = "tick")
#  cat_where(whereami(), type = "boxx")
#  cat_where(whereami(), type = "line", background_col = "red")
#  cat_where(whereami(), color = "green")
#  cat_where(whereami(), type = "line", color = "yellow")

## ----echo = FALSE-------------------------------------------------------------
if(file.exists('../reference/figures/printing.png')){
  knitr::include_graphics('../reference/figures/printing.png')
}else{
  knitr::include_graphics('../man/figures/printing.png')
}
  

