rankall <- function(outcome, num = "best") {
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        ## Check that state and outcome are valid
        ## For each state, find the hospital of the given rank
        
        stateNames <- names(split(data, data[,7]))

        r <- data.frame(cbind(sapply(stateNames, rankhospital, outcome, num), stateNames))
       
        colnames(r) <- c("hospital", "state")
        r
        
        ## Return a data frame with the hospital names and the
        ## (abbreviated) state name
}
