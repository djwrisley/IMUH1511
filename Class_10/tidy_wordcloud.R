
# adapted from https://richpauloo.github.io/2017-12-29-Using-tidytext-to-make-word-clouds/

path <- '/Users/djw12/Downloads/data/Lippert_Elders.txt'  #try Elders2 as well
dat <- read.table(path, header = FALSE, fill = TRUE)  #take txt file and read it into a table

#all packages must be loaded in using install.packages("nameofpackage")

library(dplyr) # for data wrangling
library(tidytext) # for NLP
library(stringr) # to deal with strings
library(wordcloud) # to render wordclouds
library(RColorBrewer) # to set colors
library(knitr) # for tables
library(DT) # for dynamic tables
library(tidyr) # for data tidying
library(reshape2) # for data tidying
library(ggplot2) # for creating visualizations

tidy_dat <- tidyr::gather(dat, key, word) %>% select(word) # DF into a column
tidy_dat$word %>% length() # check length

unique(tidy_dat$word) %>% length() #look for the unique tokens

# tokenizing

tokens <- tidy_dat %>%
  unnest_tokens(word, word) %>%
  dplyr::count(word, sort = TRUE) %>%
  ungroup()

# removing stop words

tokens_clean <- tokens %>%
  anti_join(stop_words)

#define palette for word cloud, visualize wordcloud

pal <- brewer.pal(8,"Dark2")
tokens_clean %>%
  with(wordcloud(word, n, random.order = FALSE, max.words = 150, colors=pal))

# remove some custom stop words

uni_sw <- data.frame(word = c("james","zane","ralph", "harry"))
tokens_clean <- tokens_clean %>%
  anti_join(uni_sw, by = "word")

# visualize the word cloud

tokens_clean %>%
  with(wordcloud(word, n, random.order = FALSE, max.words = 150, colors=pal))


# you can also fetch text from PG an open repository, adapted from https://www.tidytextmining.com/tidytext.html

library(gutenbergr)

burton <- gutenberg_download(c(3435, 3436, 3437, 3438, 3439, 3440, 3441, 3442, 3443, 3444))

tidy_burton <- burton %>%
  unnest_tokens(word, text) %>%
  anti_join(stop_words) %>%
  count(word, sort = TRUE)

tidy_burton %>% 
  with(wordcloud(word, n, random.order = FALSE, max.words = 150, colors=pal))
