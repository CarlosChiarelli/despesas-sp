# READ FILES
library(readr)
source('data_transformation.r')

# read in chunk and append csv
read_csv_save <- function(name, name_append, size_chunk = 10000){
  
  # save with append csv
  f_append <- function(df, pos){
    df = data_filter(df)
    write_excel_csv(df, name_append, append = TRUE)
  }
  
  read_csv2_chunked(name,
                    DataFrameCallback$new(f_append),
                    chunk_size = size_chunk,
                    locale = locale(encoding = "latin1"))
  
  # return nothing
  return(0)
}