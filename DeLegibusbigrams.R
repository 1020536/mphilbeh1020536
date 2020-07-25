library(data.table)
library(tidyverse)
library(tidytext)

delegibus <- read.delim('delegibus.txt', col.names=c("value"))
bigrams <- delegibus %>%
  select(value) %>%
  unnest_tokens(ngram, value, token = "ngrams", n = 2) %>%
  count(ngram, sort = TRUE) %>%
  ungroup()

DT::datatable(bigrams)