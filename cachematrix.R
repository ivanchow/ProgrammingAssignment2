## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(y) {

  # set the cache value NULL
  m <- NULL
  
  # assign env x from y
  x <<- y
    
  # assign env m NULL
  m <<- NULL
  
  # get x from env
  get <- function() x
  
  # set solve func
  setinverse <- function(solve) m <<- solve
  
  # get solve func
  getinverse <- function() m
  
  # make special cache list for matrix
  list(get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

      # get env matrix value
      m <- x$getinverse()
      # m <- NULL
      
      # check if cache value
      if(!is.null(m)) {
        
        # cache value found
        message("getting cached data")
        
        # return cache value
        return(m)
      }
      
      # cache value not found
      # get original data
      data <- x$get()
      
      # inverse matrix using solve
      m <- solve(data)
      
      # put solve result into cache
      x$setinverse(m)
      
      # return 'solved' m
      m  
  
}
