
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
