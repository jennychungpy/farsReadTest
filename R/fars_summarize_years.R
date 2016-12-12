#' Creating a summary table with the valid years of a FARS file
#'
#' @description The 'fars_summarize_years' function returns a table with a summary of the 'years' parameter.
#'
#' @details After applying the 'fars_read_years' function on the parameter 'years', a 'dat_list' object is made.
#' Lists of different years will be bound by rows using the 'bind_rows' function of the dplyr package, followed by:
#'    1) the 'group_by' function of the dplyr package, aggregating by the 'year' and 'MONTH' variables
#'    2) after aggregation, the number of rows 'n' is counted using the 'summarize' function from the dplyr package
#'    3) the different elements in the 'year' column is then spread over multiple columns using the 'spread'
#'       function from the dplyr package, together with the number of rows 'n'
#'
#' @note error - When the year is invalid, a warning will be given such as "invalid year: <year>".  Nothing (=NULL) will be returned.
#'
#' @importFrom dplyr bind_rows group_by summarize
#' @importFrom tidyr spread
#' @importFrom magrittr %>%
#'
#' @inheritParams fars_read_years
#'
#' @return A table with a summary of all valid years in a FARS file
#'
#' #@example
#' #fars_summarize_years(c(2013, 2014))
#'
#' @export
fars_summarize_years <- function(years) {
  dat_list <- fars_read_years(years)
  dplyr::bind_rows(dat_list) %>%
    dplyr::group_by(year, MONTH) %>%
    dplyr::summarize(n = n()) %>%
    tidyr::spread(year, n)
}
