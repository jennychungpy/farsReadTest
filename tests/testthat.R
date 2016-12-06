library(testthat)
library(farsReadTest)

source("path/to/fars_read.R")
source("path/to/dataExample.R")


test_results <- test_dir("path/to/tests", reporter="summary")

test_check("farsReadTest")
