
# testing the fars_read function
context("fars_read")
test_that("FARS year is not exisitng", {
  expect_error(fars_read("accident_2012.csv.bz2"))
})

test_that("FARS year is existing", {
  output <- fars_read(farsReadTest_example("accident_2013.csv.bz2"))
  expect_that(output, is_a('data.frame'))
})
