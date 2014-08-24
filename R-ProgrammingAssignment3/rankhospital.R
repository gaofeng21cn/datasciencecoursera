rankhospital <- function(state, outcome, num = "best") {
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        if (!(state %in% names(split(data, data[,7])))) stop("invalid state")
        
        index <- switch(outcome, "heart attack" = 11, "heart failure" = 17, "pneumonia" = 23, FALSE)
        if(!index) stop("invalid outcome")
        
        ## Return hospital name in that state with the given rank
        ## 30-day death rate
        data <- data[data[,7] == state,] # limit State
        data <- data[!is.na(as.numeric(data[,index])),] # drop na in data[,index]
        num <- switch(as.character(num), best = 1, worst = length(data[,index]), num)
        data[order(as.numeric(data[,index]), data[,2])[num], 2]

}
