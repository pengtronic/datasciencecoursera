complete <- function(directory, id = 1:332) {
    if (getwd() != "/Users/pengzhang/Desktop/R programming/specdata"){
        setwd(directory)
    }
    files <- list.files()
    datafiles <- files[id]
    len_id <- length(id)
    nobs <- vector(mode="numeric",length = len_id)
    for (i in 1:len_id){
        data <- read.csv(datafiles[i])
        sulfate <- data[,"sulfate"]
        nitrate <- data[,"nitrate"]
        idx <- which(sulfate>0 & nitrate>0, T)
        comp <- length(idx)
        nobs[i] <- comp
    }
    dataframe <- data.frame(id,nobs)
    dataframe
}