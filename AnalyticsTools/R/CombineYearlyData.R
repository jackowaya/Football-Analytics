#' A function to combine multiple NFL seasonal data.
#'
#' This function combines a vector of years corresponding to NFL seasonal data into a single R data frame.
#' @param a vector of years for NFL seasonal data to be imported into R.
#' @keywords combine; seasonal data
#' @export
#' @examples
#' CombineYearlyData()

## ---- Combine_Yearly_Data ----
CombineYearlyData <- function(years){
  
  final <- data.frame()
  
  ## Loop over the years specified in the vector. 
  for(i in years){
    
    ## Create the name of the file.
    file <- paste("Data\\BoxScores", i, ".csv", sep = "")
    
    ## Clean the data.
    data <- clean_data(file)
    
    ## Extract the repeated matchups data; and add a year column.
    data <- cbind(year = i, repeated_matchups(data))
    
    ## Append each year into the final dataset. 
    final <- rbind(final, data)
    
  }
  
  ## Return the final dataset.
  final
  
}
