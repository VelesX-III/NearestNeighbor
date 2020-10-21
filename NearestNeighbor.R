Norm <- function(u, v, dimension = NULL) {
  if (is.null(dimension)) {
    dimension <- length(u)
  }
  total <- 0.
  for (i in c(1:dimension)) {
    total <- total + (u[i] - v[i]) ^ 2
  }
  return(sqrt(total))
}

GetNeighbors <- function(train, testVector, neighbors) {
  distances = list()
  for (trainVector in 1:length(train)) {
    distance = norm(testVector, trainVector)
    append(c(trainVector,distance))
  }
}