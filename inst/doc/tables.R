## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(whereami)
library(magrittr)
library(kableExtra)

## -----------------------------------------------------------------------------
knitr::kable(head(iris,10), align = "c",format = 'html') %>%
  kableExtra::footnote(
    general_title = "Source: ",
    general = whereami(path_expand = TRUE)[1])

