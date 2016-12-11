#' Path to farsReadTest examples
#'
#' Pakage 'farsReadTest' comes bundled with a number of sample files in its \code{inst/extdata}
#' directory. This function make them easy to access
#'
#' @param path Name of file
#' @export
farsReadTest_example <- function(path) {
  system.file("extdata", path, package = "farsReadTest", mustWork = FALSE)
}
