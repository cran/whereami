#' @title Determines the path of the currently running script in terminal
#' @description \R does not store nor export the path of the currently running
#'   script.  This is an attempt to circumvent this limitation by applying
#'   heuristics (such as call stack and argument inspection) that work in many
#'   cases.
#' **CAVEAT**: Use this function only if your workflow does not permit other
#' solution: if a script needs to know its location, it should be set outside
#' the context of the script if possible.
#'
#' @details This functions currently work only if the script was `source`d,
#'   processed with `knitr`,
#'   or run with `Rscript` or using the `--file` parameter to the
#'   `R` executable.  For code run with `Rscript`, the exact value
#'   of the parameter passed to `Rscript` is returned.
#' @return The path of the currently running script, NULL if it cannot be
#'   determined.
#' @seealso [base::source()], [utils::Rscript()], [base::getwd()]
#' @references [https://stackoverflow.com/q/1815606/946850]()
#' @author Kirill Müller, Hadley Wickham, Michael R. Head
#' @note These functions were migrated from
#'  [r-lib/rprojroot](https://github.com/r-lib/rprojroot/tree/4e4f70c0794542a5cfa6c3f66635388365616881).
#' @family this
#' @rdname thisfile
#' @examples
#'
#' if( !interactive() )
#'   thisfile()
#'
#' # using in terminal ( with pipe() )
#'
#'   # open a temp file
#'    tf <- tempfile(fileext = '.R')
#'
#'   # call to write to temp file
#'    f <- 'cat(whereami::thisfile(), "\n", sep = "")'
#'
#'   # write to the file
#'    cat(f,file = tf)
#'
#'   # create an R call to terminal
#'    fcmd <- sprintf('"%s" --slave --vanilla --no-save -f %s',R.home('bin/R'),tf)
#'
#'   # run the call
#'    p <- pipe(fcmd)
#'
#'   # read the output
#'    readLines(p)
#'
#'   # cleanup
#'    close(p)
#'    unlink(tf)
#'
#' @export
thisfile <- function() {
  if (!is.null(res <- thisfile_source())) {
    res
  } else if (!is.null(res <- thisfile_r())) {
    res
  } else if (!is.null(res <- thisfile_rscript())) {
    res
  } else if (!is.null(res <- thisfile_knit())) {
    res
  } else {
    NULL
  }
}

#' @rdname thisfile
#' @export
thisfile_source <- function() {
  for (i in -(1:sys.nframe())) {
    if (identical(args(sys.function(i)), args(base::source))) {
      return(normalizePath(sys.frame(i)$ofile,winslash = '/'))
    }
  }

  NULL
}

#' @rdname thisfile
#' @importFrom utils tail
#' @export
thisfile_r <- function() {
  cmd_args <- commandArgs(trailingOnly = FALSE)
  if (!grepl("^R(?:|term)(?:|[.]exe)$", basename(cmd_args[[1L]]), ignore.case = TRUE)) {
    return(NULL)
  }

  cmd_args_trailing <- commandArgs(trailingOnly = TRUE)
  leading_idx <-
    seq.int(from = 1, length.out = length(cmd_args) - length(cmd_args_trailing))
  cmd_args <- cmd_args[leading_idx]
  file_idx <- c(which(cmd_args == "-f") + 1, which(grepl("^--file=", cmd_args)))
  res <- gsub("^(?:|--file=)(.*)$", "\\1", cmd_args[file_idx])

  # If multiple --file arguments are given, R uses the last one
  res <- utils::tail(res[res != ""], 1)
  if (length(res) > 0) {
    return(res)
  }

  NULL
}

#' @rdname thisfile
#' @importFrom utils tail
#' @export
thisfile_rscript <- function() {
  cmd_args <- commandArgs(trailingOnly = FALSE)
  if (!grepl("^R(?:term|script)(?:|[.]exe)$", basename(cmd_args[[1L]]), ignore.case = TRUE)) {
    return(NULL)
  }

  cmd_args_trailing <- commandArgs(trailingOnly = TRUE)
  leading_idx <-
    seq.int(from = 1, length.out = length(cmd_args) - length(cmd_args_trailing))
  cmd_args <- cmd_args[leading_idx]
  res <- gsub("^(?:--file=(.*)|.*)$", "\\1", cmd_args)

  # If multiple --file arguments are given, R uses the last one
  res <- utils::tail(res[res != ""], 1)
  if (length(res) > 0) {
    return(res)
  }

  NULL
}

#' @rdname thisfile
#' @export
thisfile_knit <- function() {
  if (requireNamespace("knitr")) {
    return(knitr::current_input(dir = TRUE))
  }

  NULL
}
