#' Plot k-means clustering results
#'
#' @param data A data.frame
#' @param xvar Character name of x variable
#' @param yvar Character name of y variable
#' @param fit A kmeans object (from kmeans_cluster)
#' @return Invisibly returns NULL (creates a plot)
#' @export
plot_clusters <- function(data, xvar, yvar, fit) {
  stopifnot(is.data.frame(data))
  stopifnot(xvar %in% names(data))
  stopifnot(yvar %in% names(data))
  stopifnot(!is.null(fit$cluster))
  stopifnot(!is.null(fit$centers))

  x <- data[, c(xvar, yvar)]

  graphics::plot(
    x,
    col = fit$cluster,
    pch = 19,
    xlab = xvar,
    ylab = yvar
  )
  graphics::points(fit$centers, pch = 8, cex = 2)

  invisible(NULL)
}
