#' Plotting the number of accidents in the given state number and year of a FARS csv file
#'
#' @description The fars_map_state' function returns a plot with points which represent the occurring coordinates in the given state
#' number and year in a 'accident_%.csv' file.
#'
#' @details Within the 'fars_map_state' function, the followings handling are executed:
#'    1) a filename will be created using the 'make_filename' function (defined previously) by given the 'year' parameter
#'    2) the created filename is then used as input for the 'fars_read' function in order to return a table of the class
#'       'data.frame'. This table is named as 'data'
#'    3) the 'state.num' parameter is converted to an integer (by 'as.integer')
#'    4) a search for the 'state.num' is performed in a the column 'STATE' in the 'data' table which is made unique. When the
#'       state number s valid, the 'filter' function of the dplyr package will be applied to obtain all the information of that
#'       state number in the 'data' table. This is assigned as 'data.sub' (=subset of the 'data' table). Within the 'data.sub',
#'       the followings are executed:
#'         a) converting the values of LONGITUD variable greater than 900 into 'NA'
#'         b) converting the values of LATITUDE variable greater than 90 into 'NA'
#'         c) finally, the 'data.sub' data will be used to create a graph using:
#'              - the 'map' function of the maps package for drawing lines and polygons using the 'state' database
#'                with the range of the 'LATITUDE' variable as the Y-axis and the range of the 'LONGITUD' variable as the 'X-axis'
#'                to create the raster/plot. Both having the NA values removed when executing this step.
#'              - the 'points' function of the graphics package to add the coordinates (x = LONGITUD, y = LATITUDE) as points
#'                (using pch = 46) in the raster/plot.
#'
#' @note stop - When the file name does not exist. The non-existence of the file name will be reported by the sentence "file <filename>
#'              does not exist".
#' @note error - When the year is invalid, a warning will be given such as "invalid year: <year>".  Nothing (=NULL) will be returned.
#' @note stop - When the 'state.num' does not occur, the text "invalid STATE number: <state.num>" is printed.
#' @note message - When 'data.sub' has no row (in other words no data), the message "no accidents to plot" will be printed and the
#'                 (temporarily) invisible copy of the "NULL" object is returned.
#'
#' @importFrom dplyr filter
#' @importFrom maps map
#' @importFrom graphics points
#'
#' @param state.num - The 'state.num' parameter is numerical and indicates the number of the state.
#' @param year - The 'year' parameter is numerical and indicates from which year the file should be.
#'
#' @return A plot with points which represent the occurring coordinates in the given state number and year in a 'accident_<year>.csv' file.
#'
#' #@example
#' #fars_map_state(7, 2015)
#'
#' @export
fars_map_state <- function(state.num, year) {
  filename <- make_filename(year)
  data <- fars_read(filename)
  state.num <- as.integer(state.num)

  if(!(state.num %in% unique(data$STATE)))
    stop("invalid STATE number: ", state.num)
  data.sub <- with(data, {
    dplyr::filter(data, STATE == state.num)
  })
  if(nrow(data.sub) == 0L) {
    message("no accidents to plot")
    return(invisible(NULL))
  }
  is.na(data.sub$LONGITUD) <- data.sub$LONGITUD > 900
  is.na(data.sub$LATITUDE) <- data.sub$LATITUDE > 90
  with(data.sub, {
    maps::map("state", ylim = range(LATITUDE, na.rm = TRUE),
              xlim = range(LONGITUD, na.rm = TRUE))
    graphics::points(LONGITUD, LATITUDE, pch = 46)
  })
}
