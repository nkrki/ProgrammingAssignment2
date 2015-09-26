## Prepare a list which stores values calculated by the second function

## Prepare a list to store the value which acts like a cache

makeCacheMatrix <- function(x = matrix()) {
mi <- NULL
	set <- function(y) {
		x <<- y
		mi <<- NULL
	}
	get <- function() x
	setinverse <- function(inverse) mi <<- inverse
	getinverse <- function() mi
	list(set = set, get = get, setinverse = setinverse, 
			getinverse = getinverse)
	x
}


## Take a matrix, calculate the inverse and store it using above function

cacheSolve <- function(x, ...) {
        mi <- x$getinverse()
	if(!is.null(mi)) {
		message("getting cached data")
		return(mi)
	}
	data <- x$get()
	mi <- solve(data)
	x$setinverse(mi)
	mi
}
