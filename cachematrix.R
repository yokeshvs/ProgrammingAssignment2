## Put comments here that give an overall description of what your
## functions do

## Returns a vector of list containing get,set,getinverse and setinverse functions

makeCacheMatrix <- function(x = matrix()) {
  temp <- NULL
  set <- function(y) {
      x <<- y
      temp <<- NULL
  }
  get <- function() {
      x
  }
  setinverse <- function(inverse) {
      temp <<- inverse
  }
  getinverse <- function() {
      temp
  }
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Checks for cached data and returns if available
## Otherwise, computes inverse function, stores them in cache and also return the value on method call

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  local_value <- x$getinverse()
  if(!is.null(local_value)){
      message("Retrieving cached data")
      return (local_value)
  }
  data <- x$get()
  local_value <- solve(data)
  x$setinverse(local_value)
  local_value
}
