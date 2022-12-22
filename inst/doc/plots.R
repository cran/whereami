## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(whereami)
library(ggplot2)

## ----rmd caption,fig.cap=whereami(path_expand = TRUE),fig.width=7-------------

ggplot(iris) + 
  aes(x=Sepal.Length,y=Sepal.Width) + 
  geom_point()


## ----ggcaption,fig.width=7----------------------------------------------------

ggplot(iris) + 
  aes(x=Sepal.Length,y=Sepal.Width) + 
  geom_point() + 
  labs(caption = sprintf('sourced from: %s',whereami(path_expand = TRUE)))


