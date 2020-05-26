# unit test for the forint function to make sure that forint(42) returns 42 HUF

context("output format")
library(scales)

test_that("suffix is added to input value", {
  expect_equal(forint(42), "42 HUF")
})


# further unit tests to demonstrate different use cases of unit tests.
test_that("output value is equal to input value", {
  expect_equal(substr(forint(42), 1, 2), "42")
  expect_equal(as.numeric(substr(forint(42), 1, 2)), 42)
})

test_that("suffix of integer is HUF", {
  expect_equal(substr(forint(42), 3, 6), " HUF")
})

test_that("class of output is character", {
  expect_equal(class(forint(42)), "character")
})
