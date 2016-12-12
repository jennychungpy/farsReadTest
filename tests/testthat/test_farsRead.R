
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
  file <- make_filename("aaa")
  expect_error(fars_read(file))
})

test_that("The year input is integer", {
  file <- make_filename(2013)
  output <- fars_read(file)
  expect_that(output, is_a('data.frame'))
})


# testing the fars_read_years function
context("fars_read_years")
test_that("The year is not valid", {
  expect_warning(fars_read_years(2012), "invalid year")
})

test_that("Valid years and returning a list", {
  output <- fars_read_years(2013)
  expect_that(output, is_a('list'))
})

test_that("Valid years and returning a list", {
  output <- fars_read_years(c(2013, 2014))
  expect_that(output, is_a('list'))
})


# testing the fars_summarize_years function
context("fars_summarize_years")
test_that("The year is not valid", {
  expect_error(fars_summarize_years(2012))
})

test_that("Valid years and returning a tbl_df", {
  output <- fars_summarize_years(2013)
  expect_that(output, is_a('tbl_df'))
})

test_that("Valid years and returning a tbl_df", {
  output <- fars_summarize_years(c(2013, 2014))
  expect_that(output, is_a('tbl_df'))
})


# testing the fars_map_state function
context("fars_map_state")
test_that("Invalid state number and valid year", {
  expect_error(fars_map_state(1, 2015))
})

test_that("Valid state number and year", {
  output <- fars_map_state(7, 2015)
  expect_that(output, is_a('map'))
})
