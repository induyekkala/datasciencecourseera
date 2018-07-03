makeVector <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- mean
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}
cacheValue <- function(x,...) {
  i <- x$getinverse()
  if(!is.null(i)) {
    message("getting data.")
    return(i)
  }
  data <- x$get()
  i <- solve(data)
  x$setinverse(i)
  i
}

x=rbind(c(2,-2/4),c(-2/4,2))
m = makeVector(x)
m$get()

cacheValue(m)
