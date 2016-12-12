#' Path to farsReadTest examples
#'
#' Pakage 'farsReadTest' comes bundled with a number of sample files in its \code{inst/extdata}
#' directory. This function make them easy to access
#'
#' @param filename Name of file
#'
#' @export
#' #@example
#' #farsReadTest_example(accident_2013.csv.bz2)
farsReadTest_example <- function(filename) {
  system.file("extdata", filename, package = "farsReadTest", mustWork = FALSE)
}
