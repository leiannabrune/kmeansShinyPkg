test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})

test_that("kmeans_cluster returns k clusters", {
  fit <- kmeans_cluster(iris, "Sepal.Length", "Sepal.Width", 3)
  expect_true("kmeans" %in% class(fit))
  expect_equal(length(unique(fit$cluster)), 3)
})

test_that("kmeans_cluster errors on bad column name", {
  expect_error(kmeans_cluster(iris, "BADCOL", "Sepal.Width", 3))
})
