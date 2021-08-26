# DATA MANIPULATION
library(tidyverse)

data_filter <- function(df){
  df %>% 
    filter(tp_despesa != 'Valor Liquidado' & tp_despesa != 'Valor Pago')
} 

data_transf <- function(df){
  df %>%
    mutate(vl_despesa_anulacao =  vl_despesa * if_else(tp_despesa == 'Anulação', -1, 1),
           nome_grupo_despesa  = str_sub(ds_elemento, 1, 2),
           modalidadde_despesa = str_sub(ds_elemento, 3, 4),
           elemento_despesa    = str_sub(ds_elemento, 5, 6),
           item_despesa        = str_sub(ds_elemento, 7, -1))
} 