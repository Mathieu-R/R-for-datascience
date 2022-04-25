# N: simulation size (i.e. number of samples)
# n: sample size
# f: function to generate random variables
# ... any other parameters given to f
?apply
sim <- function(N = 1000, n = 20, f, ...) {
  x <- matrix(f(N * n, ...), nrow = n)
  stats <- apply(
    X = x, 
    MARGIN = 2, 
    FUN = function(y) {
      c(mean(y), var(y))
    }
  )

  rownames(stat()) <- c("mean", "variance")
  return (stats)
}

