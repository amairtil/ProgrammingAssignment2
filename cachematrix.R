## Put comments here that give an overall description of what your
## functions do

## The function makeCacheMatrix() creates a special "matrix", which is a list
##      consisting of four functions.

## The function cacheSolve() first attempts to read in the cached inverse of
##      the "matrix" and return it, if the value returned is NULL, it calculates
##      the inverse using solve() and caches it



## Write a short comment describing this function

## makeCacheMatrix() takes a matrix, using it to create 4 functions,
##      set(), which sets the value of the matrix;
##      get(), which gets the value of the matrix;
##      setinverse(), which sets the cached inverse of the matrix;
##      getinverse(), which gets the cached inverse of the matrix.
##
## makeCacheMatrix() sets the cached inverse to be NULL, and returns a list of 
##      the 4 functions.

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) inv <<- inverse
        getinverse <- function() inv
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## Write a short comment describing this function

## cacheSolve() takes a list of functions created using makeCachedMatrix(), 
##      checks if the inverse of the matrix has been cached. If so, it displays 
##      a message "getting cached data", and returns the cached inverse; if
##      not, it calculates the inverse using solve() and caches it using
##      setinverse(), and returns the inverse.
##
cacheSolve <- function(x, ...) {
        
        inverse <- x$getinverse()
        if(!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinverse(inv)
        inv
        
        ## Return a matrix that is the inverse of 'x'
        
}
