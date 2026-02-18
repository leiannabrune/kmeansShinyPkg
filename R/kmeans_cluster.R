#' Run k-means clustering
#'
#' @param data A data.frame
#' @param xvar Character name of x variable
#' @param yvar Character name of y variable
#' @param k Number of clusters
#' @return A kmeans object
#' @export
kmeans_cluster <- function(data, xvar, yvar, k) {
  stopifnot(is.data.frame(data))
  stopifnot(xvar %in% names(data))
  stopifnot(yvar %in% names(data))

  x <- data[, c(xvar, yvar)]
  stats::kmeans(x, centers = k)
}
