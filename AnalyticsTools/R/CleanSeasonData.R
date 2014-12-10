#' An importer function for NFL seasonal data.
#'
#' This function cleans one of the seasonal data files (included as a csv file in this package) and imports it into R.
#' @param a file name included in the data directory
#' @keywords import; data
#' @export
#' @examples
#' CleanSeasonalData()


## ---- Clean_Data ----
CleanSeasonalData <- function(year){
  
  file <- system.file("extdata", paste("BoxScores", year, ".csv", sep = ""), package="AnalyticsTools")
  
  ## Read in the data. 
  raw <- read.csv(file, header = TRUE)
  
  ## Rename the data so that the variable names are common accross years.
  names(raw)[1] <- "W."
  
  ## Eliminate the seperator rows between weeks;
  ## and eliminate the playoff seperator rows.
  raw <- subset(raw,  W. != "W#" & W. != "" & W. != "Week")
  
  ## Replace "@" symbol in the home/away column. 
  levels(raw$X.1) <- c("home", "away", "neither")
  
  ## Create a column that is the oppose of the home/away column.
  raw$X.2 <- "home"
  raw[as.character(raw$X.1) == "home", 14] <- "away"
  raw[as.character(raw$X.1) == "neither", 14] <- "neither"
  raw$X.2 <- as.factor(raw$X.2)
  
  ## Split the data in half so that there is one record for each team instead of one record for each game. 
  home <- data.frame(week = raw$W., team = raw$Winner.tie, opponent = raw$Loser.tie, location = raw$X.1, scored = raw$PtsW, allowed = raw$PtsL)
  away <- data.frame(week = raw$W., team = raw$Loser.tie, opponent = raw$Winner.tie, location = raw$X.2, scored = raw$PtsL, allowed = raw$PtsW)
  
  ## Combine the two data.frames.
  data <- rbind(home, away)
  
  ## Change the column classes for numerics.
  data$scored  <- as.numeric(as.character(data$scored))
  data$allowed <- as.numeric(as.character(data$allowed))
  
  ## Add a column for the point differential. 
  data$diff <- data$scored - data$allowed
  
  ## Return the data.frame
  data
  
}