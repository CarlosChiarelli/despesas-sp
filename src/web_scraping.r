# SCRAPING
library(tidyverse)
source('read_files.r')

# replace integer in "YEAR_REPLACE"
url_src = 'https://transparencia.tce.sp.gov.br/sites/default/files/conjunto-dados/despesas-YEAR_REPLACE.zip'
#interv = 2010:2020
interv = 2010:2012
path_data = '../data'

# download file and append (if exist) csv
download_unzip_csv <- function(year){
  
  # year in string
  year = as.character(year)
  
  # msg
  print(str_c('Starting: ', year))
        
  # get links download and local download
  url_download = str_replace(url_src, "YEAR_REPLACE", year)
  file_zip = str_c(path_data, '/despesas-', year, '.zip')
  file_csv = str_c(path_data, '/despesas-', year, '.csv')
  file_csv_full = str_c(path_data, '/despesas.csv')
  
  print('Download...')
  download.file(url_download, file_zip)
  
  print('Unzip...')
  unzip(file_zip, exdir = path_data)
  
  print('Remove...')
  file.remove(file_zip)
  
  print('Save...')
  read_csv_save(file_csv, file_csv_full)
  
  # delete
  file.remove(file_csv)
  
  # msg
  print(str_c('Finished: ', year))
}

# create foulder "../data" if not exist
dir.create(file.path(path_data, path_data), showWarnings = FALSE)

# run all years
for (i in 1:length(interv)) {
  download_unzip_csv(interv[i])
}





