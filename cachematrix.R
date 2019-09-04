## Caching inverse matrix

## Create matrix object

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        get <- function() x
        setinverse <- function(inverse) i <<- inverse
        getinverse <- function() i
        list(get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

## Retrieve inverse from cache if available

cacheSolve <- function (x) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getinverse()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        data <- x$get()
        i <- solve(data)
        x$setinverse(i)
        i
}

a <- matrix(c(1,2,3,4),nrow = 2)
b <- makeCacheMatrix(a)
cacheSolve(b)
cacheSolve(b)