## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = interactive() || identical(Sys.getenv("TRAVIS"), "true")
)

## ----setup---------------------------------------------------------------
#  library(whereami)

## ------------------------------------------------------------------------
#  
#  txt_1 <- "
#  whereami::cat_where(whereami::whereami(tag = 'tag1'))
#  "
#  
#  txt_2 <- "whereami::cat_where(whereami::whereami(tag = 'tag2'))"
#  
#  tf_1 <- tempfile(fileext = '.R')
#  tf_2 <- tempfile(fileext = '.R')
#  
#  cat(txt_1,file = tf_1)
#  cat(txt_2,file = tf_2)
#  

## ------------------------------------------------------------------------
#  source(tf_1)
#  source(tf_2)

## ------------------------------------------------------------------------
#  
#  # All counters
#  counter_state()
#  
#  # A single counter
#  counter_state(tag = 'tag1')
#  

## ------------------------------------------------------------------------
#  
#  # Counter names
#  counter_names()
#  
#  # Counter tags
#  counter_tags()
#  

## ------------------------------------------------------------------------
#  counters <- counter_get()
#  
#  counters
#  

## ------------------------------------------------------------------------
#  
#  for( i in 1:10 ){
#  
#    source(tf_1)
#    source(tf_2)
#  
#    if( counter_state(tag = 'tag1') > 5 )
#      counter_reset(tag = 'tag2')
#  }
#  

## ----fig.width=7---------------------------------------------------------
#  plot(counter_get())
#  

## ------------------------------------------------------------------------
#  jsonlite::read_json(
#  file.path(tempdir(),'whereami.json'),
#  simplifyVector = TRUE)
#  

## ------------------------------------------------------------------------
#  counter_reset()
#  

## ------------------------------------------------------------------------
#  counter_state()
#  

