# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(stringi)
library(tidyverse)



# Data Import
citations <- stri_read_lines("../data/citations.txt", encoding = "WINDOWS-1252")
citations_txt <- citations[!stri_isempty(citations)]
length(citations) - length(citations_txt)
mean(str_length(citations_txt))

# Data Cleaning
sample(citations_txt, size = 10)

citations_tbl <- tibble(line = 1:length(citations_txt), cite = citations_txt) %>%
  mutate(cite = str_replace_all(string = cite, pattern = "\"|\'", replacement = "")) %>%
  mutate(year = str_match(cite, pattern = "\\((\\d{4})\\)\\.")[,2])
  



sum(!is.na(citations_tbl$first_author))