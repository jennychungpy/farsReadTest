
# testing the fars_read function
context("fars_read")
test_that("FARS year is not exisitng", {
  expect_error(fars_read("accident_2012.csv.bz2"))
})

test_that("FARS year is existing", {
  systemFilename <- system.file("extdata", "accident_2013.csv.bz2", package = "farsReadTest", mustWork = FALSE)
  output <- fars_read(systemFilename)
  expect_that(output, is_a('data.frame'))
})


# testing the make_file function
context("make_filename")
test_that("The year input is not integer", {
  expect_error(make_filename("aaa"))
})

# test_that("The year input is integer", {
#   createdFilename <- make_filename(2013)
#   year <- substr(createdFilename, regexpr('accident_', createdFilename), regexpr('\\.csv.bz2', createdFilename))
#   year <- gsub("\\.", "", year)
#   year <- gsub("accident_", "", year)
#   year <- as.integer(year)
#   expect_that(year, is_a('integer'))
# })
