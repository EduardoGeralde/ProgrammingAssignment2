## Johns Hopkins University - Data Science Specialization
## Course 2 - R Programming

## by Eduardo Geralde Neto

##This functions computes the inverse of a "matrix". If the inverse is already in
##cache, and the matrix didn't change, the inverse is returned, but if is not in
##cache or the matrix was changed, then it will recalculated the inverse and return 


## This function creates a "matrix" object that can cache its inverse.
## Seems like a function list

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}


## If the inverse is already in cache, return, if not, calculate and return.

cacheSolve <- function(x, ...) {
        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
}
