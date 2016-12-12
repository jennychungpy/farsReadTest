## ----reading_farsFile----------------------------------------------------
fars_read <- function(filename) {
  if(!file.exists(filename))
    stop("file '", filename, "' does not exist")
  data <- suppressMessages({
    readr::read_csv(filename, progress = FALSE)
  })
  dplyr::tbl_df(data)
}


## ----creating_farsFilename-----------------------------------------------
make_filename <- function(year) {
  year <- as.integer(year)
  createdFilename <- sprintf("accident_%d.csv.bz2", year)
  systemFilename <- system.file('extdata', createdFilename, package = 'farsReadTest')
  systemFilename
}


