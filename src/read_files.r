# READ FILES
library(readr)
source('data_transformation.r')

# read in chunk and append csv
read_csv_save <- function(name, name_append, size_chunk = 10000){
  
  # save with append csv
  f <- function(df, pos){
    
    # data manipulation 
    df = data_transf(df)
    
    # save data
    write_excel_csv(df, name_append, append = TRUE)
    
  }
  
  # read
  read_csv2_chunked(name,
                    DataFrameCallback$new(f),
                    chunk_size = size_chunk,
                    locale = locale(encoding = "latin1"))
  
  # return nothing
  return(0)
}