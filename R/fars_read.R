#' Returning a data frame table when reading in a FARS csv file
#'
#' @description The 'fars_read' function returns a table of the class 'data frame' when the input is a filename from the Fatality Analysis Reporting System
#' (FARS) of the US National Highway Traffic Safety.
#'
#' @details When the file name exists, the fars_read function will be applied havng the following steps.
#' First, the file will be evaluated whether it is a csv file with comma as separator by the 'suppressMessages' function from the base package.
#' If the file is a csv, the file will be read in using the 'read_csv' function from the readr package and assigned as 'data'.
#' Then, this 'data' will be converted in a table having a 'data frame' class, using the 'tbl_df' function from the dplyr package.
#'
#' @note stop When the file name does not exist. The non-existence of the file name will be reported by
#' the sentence "file <filename> does not exist".
#'
#' @importFrom readr read_csv
#' @importFrom dplyr tbl_df
#' @importFrom magrittr %>%
#'
#' @param filename A filename must be given to carry out this 'fars_read' function. This can be a string and/or numeric.
#'
#' @return A table of the class 'data frame'
#'
#' @examples
#' systemFilename <- system.file("extdata", "accident_2013.csv.bz2", package = "farsReadTest", mustWork = FALSE)
#' fars_read(systemFilename)
#'
#' @export
fars_read <- function(filename) {
  if(!file.exists(filename))
    stop("file '", filename, "' does not exist")
  data <- suppressMessages({
    readr::read_csv(filename, progress = FALSE)
  })
  dplyr::tbl_df(data)
}

