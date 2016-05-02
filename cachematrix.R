# Author: Max Triba
# Homework Assignment 2

# These two functions work to take a matrix, invert the matrix, and store the inverted matrix in the variable c (cache).
# The value returned is NULL until the cache has been produced and c is updated with this cached value. If the cache has already
# been produced (on the current matrix fed into makeCacheMatrix), it returns the previously cached value to avoid re-computation.

# makeCacheMatrix: takes a 2x2 matrix and initializes c (cache) as a NULL value. The set function assigns the matrix to a  
# variable x and reassigns c as NULL (both a scope back into the makeCacheMatrix function)) - relevant in case a new matrix is being cached. 
# The setcache function updates c with a new cache value, which getcache returns. 

makeCacheMatrix <- function(x = matrix()) {
    c <- NULL
    set <- function(y) {
        x <<- y
        c <<- NULL
    }
    get <- function() x
    setcache <- function(cache) c <<- cache
    getcache <- function() c
    list(set = set, get = get,
         setcache = setcache,
         getcache = getcache)       
}


# cacheSolve: Calls the getcache function to assign and return the previously cached value to avoid re-computation. 
# If NULL, the get function returns the matrix, performs the solve function and calls the setcache function from 
# makeCacheMatrix to update the c value. 

cacheSolve <- function(x, ...) {
    c <- x$getcache()
    if(!is.null(c)){
        message("getting cached data")
        return(c)
    }
    data <- x$get()
    c <- solve(data, ...)
    x$setcache(c)
    c
}







