# Write the following functions:
#   
# makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
# 
# cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
#If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should
#retrieve the inverse from the cache.
# 
# Computing the inverse of a square matrix can be done with the solve function in R. For example, 
#if X is a square invertible matrix, then solve(X) returns its inverse.
# 
# For this assignment, assume that the matrix supplied is always invertible.

#makeCacheMatrix: cache l'inverse d'une matrice

makeCacheMatrix <- function(m = matrix()) {
  i <- NULL
  set <- function(matrix) {
    m <<- matrix
    i <<- NULL
  }
  get <- function() {
    m
  }
  setinv <- function(inverse) {
    i <<- inverse
}
  
  getinv <- function(){ 
    i
  }
  
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## cacheSolve: calcul l'inverse d'une matrice

cacheSolve <- function(x, ...) {
  m <- x$getinv()
  if(!is.null(m)) {
    message('donnees cachees')
    return(m)
  }
  data <- x$get()
  # a%*%x=b  <--->  x=A^-1 * b
  m <- solve(data)%*% data
  x$setinv(m)
  m
}
