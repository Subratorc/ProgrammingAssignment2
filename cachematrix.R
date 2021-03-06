## Caching the Inverse of a Matrix:
## Below function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
    x <<- y
    inv <<- NULL
}
    get <- function() x
    setInverse <- function(inverse) inv <<- inverse
    getInverse <- function() inv
    list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

## Below function computes the inverse of the special "matrix" created by 
## makeCacheMatrix above. If the inverse has already been calculated and  
## matrix has not changed, then it will get the inverse from the cache

cacheSolve <- function(x, ...) {
    inv <- x$getInverse()
    if (!is.null(inv)) {
      message("getting cached data")
      return(inv)
}
    mat <- x$get()
    inv <- solve(mat, ...)
    x$setInverse(inv)
    inv
}

