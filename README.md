
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->

[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/whereami)](https://cran.r-project.org/package=whereami)
[![](https://cranlogs.r-pkg.org/badges/whereami)](https://cran.r-project.org/package=whereami)
[![Coverage
status](https://codecov.io/gh/yonicd/whereami/branch/master/graph/badge.svg)](https://codecov.io/github/yonicd/whereami?branch=master)
[![Covrpage
Summary](https://img.shields.io/badge/covrpage-Last_Build_2022_12_21-red.svg)](http://tinyurl.com/y5c5voy3)
<!-- badges: end -->

# whereami

The goal of whereami is to reliably find where command is run from.

## Installation

``` r
remotes::install_github("yonicd/whereami")
```

## Example

``` r
library(whereami)
library(ggplot2)
#> Warning: package 'ggplot2' was built under R version 4.2.2
```

### General

``` r
whereami()
#> ── Running print(x) at README.Rmd, encoding = UTF-
```

### Plots

``` r

ggplot(iris) + 
  aes(x=Sepal.Length,y=Sepal.Width) + 
  geom_point() + 
  labs(caption = sprintf('sourced from: %s',whereami()))
```

<img src="man/figures/README-plot-1.png" width="100%" />

### Shiny

![](https://github.com/yonicd/whereami/blob/media/whereami_shiny.gif?raw=true)

## Non RStudio session

If you are running a non RStudio script ie from terminal R/Rscript then
the package falls back to `thisfile()`, which has been migrated from
[rprojroot::thisfile()](https://rprojroot.r-lib.org/reference/thisfile.html).

In this case the traceback functionality of `whereami()` to return the
line where the function was sourced is not enabled.
