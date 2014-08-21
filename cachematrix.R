## Put comments here that give an overall description of what your
## functions do


# makeCacheMatrix.R funciton
# Create vector of four functions:
#   getMatrix: display current matrix
#   setMatrix: store new matrix and reinitilize the inverse
#   getInverse: display current inverse
#   setInverse: store new inverse

makeCacheMatrix <- function(x=matrix()){
    #initilize inverse of the matrix
    inverse<-NULL 
    
    #if new matrix comes in, replace the old matrix with the new one
    #and reinitilize the inverse
    setMatrix<-function(y){
        x<<-y
        inverse<<-NULL
    }
    
    #display the current stored matrix
    getMatrix <- function(){
        x
    }
    
    #display the current stored inverse
    getInverse <- function(){
        inverse
    }
    
    #store the newly calculated inverse
    setInverse <- function(i){
        inverse <<- i
    }
    
    #form the list of the functions
    list(setMatrix=setMatrix,getMatrix=getMatrix,
         setInverse=setInverse,getInverse=getInverse)
}


# cachesolve.R function:
#   The function is going to check for existing inverse of the matrix. If 
# it doesn't exist,the function will calculate the inverse, store it, and
# display on console

cacheSolve <- function(x,...){
    #check if inverse has been calculated
    inverse <- x$getInverse()
    
    #if requesting inverse for the same matrix, skip the 
    #calculation and return the calculated inverse
    if(!is.null(inverse)){
        print("getting cache data")
        return(inverse)
    }
    
    #get the new matrix and store it in a variable
    matrix <- x$getMatrix()
    
    #calculate the inverse of the matrix
    i <- solve(matrix)
    
    #store the new inverse and display on console
    x$setInverse(i)
    i
}
