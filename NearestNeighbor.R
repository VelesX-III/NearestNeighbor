library(rlist) #Allows us to call list.sort.

Norm <- function(u, v, dimension = NULL) {
  if (is.null(dimension)) {
    dimension <- length(u)
  }
  innerProduct <- 0.
  for (i in 1:dimension) {
    innerProduct <- innerProduct + (u[[i]] - v[[i]]) ^ 2
  }
  return(sqrt(innerProduct))
}

GetNeighbors <- function(vectors, testVector, desiredNeighbors) {
  distances = list()
  for (i in 1:length(vectors)) {
    distances[[i]] <-
      list(vector = vectors[[i]],
           distance = Norm(testVector, vectors[[i]]))
  }
  sortedDistances <- list.sort(distances, distance)
  
  neighbors <- list()
  for (i in 1:desiredNeighbors) {
    neighbors[[i]] <- sortedDistances[[i]]$vector
  }
  return(neighbors)
}

dataset = list(
  #Can of course be imported from a file or defined inline.
  c(2.7810836, 2.550537003, 0),
  c(1.465489372, 2.362125076, 0),
  c(3.396561688, 4.400293529, 0),
  c(1.38807019, 1.850220317, 0),
  c(3.06407232, 3.005305973, 0),
  c(7.627531214, 2.759262235, 1),
  c(5.332441248, 2.088626775, 1),
  c(6.922596716, 1.77106367, 1),
  c(8.675418651,-0.242068655, 1),
  c(7.673756466, 3.508563011, 1)
)

GetNeighbors(dataset, dataset[[1]], 3)