#The first function, makeVector creates a special "matrix"
#which is really a list containing a function to
#set the value of the matrix
#get the value of the matrix
#set the value of the Inverse
#get the value of the Inverse
makeCacheMatrix <- function(x = matrix()){
        m = NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        # solve() produces the Inverse of a matrix.
        setInv <- function(solve) m <<- solve
        getInv <- function() m
        list(set = set, get = get,
             setInv = setInv,
             getInv = getInv)
}

#The following function calculates the Inverse 
#of the special "matrix" created with the above function. 
#However,it first checks to see if the inverse has already been calculated. 
#If so,it gets the inverse from the cache and skips the computation. 
#Otherwise, it calculates the inverse of the data and sets the 
#value of the inverse in the cache via the setInv function.
cacheSolve <- function(x, ...) {
        
        m <- x$getInv()
        if(!is.null(m)) {
                message("getting cached data")
                return(z)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setInv(m)
        m
}