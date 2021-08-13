# Projeto despesas de São Paulo

Estudo das despesas municipais da cidades de São Paulo.


<br>

---

# Linguagem R

É utilizado nesse projeto R versão `4.1.1`.


<br>

---

# Bibliotecas

Executar a instalação abaixo:

```sh
install.packages("tidyverse")
```


<br>

---

# Executar projeto

Para executar o projeto basta importar o arquivo *main.r* conforme abaixo:

```sh
source('main.r')
```


<br>

---

# Processos

* página wev para download: `https://transparencia.tce.sp.gov.br/conjunto-de-dados`

* despesas

* baixar 2010 - 2020

* unir todos dados

* filtrar

  - tp_despesa  > tirar "liquidado" e "pago" 

  - tp_despesa > para "anulação" multiplicar vl_despesa por (-1) para demais vl_despesa multiplicar por 1

* ds_elemento vai virar 4 colunas:

  - col 1 = nome Grupo de Despesa (2 primeiros caracteres)
  
  - col 2 = modalidade de Despesas (3 e 4º caracteres)
  
  - col 3 = Elemento de Despesa (5 e 6º caracteres)
  
  - col4 = Item de Despesa (7 e 8º caracteres e o nome que vem depois)


