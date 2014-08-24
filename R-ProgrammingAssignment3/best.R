best <- function(state, outcome) {
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        if (!(state %in% data[,7])) stop("invalid state")
        
        index <- 0
        if(outcome == "heart attack") index <- 11
        if(outcome == "heart failure") index <- 17
        if(outcome == "pneumonia") index <-23
        if(!index) stop("invalid outcome")
                
        ## Return hospital name in that state with lowest 30-day death
        ## rate
        data <- data[data[,7] == state,]
        min <- min(as.numeric(data[,index]), na.rm=TRUE)
        names <- data[,2][as.numeric(data[,index]) == min]
        names[!is.na(names)]
       
}
