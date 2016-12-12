#' Creating a FARS filename
#'
#' @description The 'make_filename' function creates a filename, having a charactor vector containing a formatted combination
#' of text and the 'year' variable.
#'
#' @details When the year is given, the year is converted into a integer by 'as.integer' from the base package, and
#' assigned as 'year'. Then, the 'year' variable will be used in the C function 'sprintf' from the base package.
#'
#' @param year - The year parameter is a numerical variable.
#'
#' @return a filename with the format "accident_<year>.csv.bz2"
#'
#' @examples
#' make_filename(2013)
#'
#'
#' @export
make_filename <- function(year) {
  year <- as.integer(year)
  createdFilename <- sprintf("accident_%d.csv.bz2", year)
  systemFilename <- system.file("extdata", createdFilename, package = "farsReadTest", mustWork = FALSE)
  systemFilename
}
