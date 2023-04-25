# Week 11a Working with words


# library to load 
library(here)
library(tidyverse)
library(tidytext)
library(wordcloud2)
library(janeaustenr)

# What is String?
# string is this

word<- "this is a string"
word_vector<- c("apple", "banana")

# manipulation (paste words together)

paste("high temp", "low temp")

# if you want a dash vetween words

paste("high temp", "low temp", sep = "-")

# if you want no space 

paste0("high temp", "low temp")

# working with vectors 

shapes<- c("circle", "square")
paste("my favorite shape is", shapes)

# if you want to know how many letters are in each word

str_length(shapes)


seq_data<- c("ATCCCGTC")
str_sub(seq_data, start = 2, end = 4) # takes out the 2nd, third, fourth
str_sub(seq_data, start= 3, end = 3) <-"A" # replace the third one "t" as "a"
str_dup(seq_data, times = c(2,3)) # times the number of time to duplicate

seq_data

badtreatments<-c("High", " High", "High ", "Low", "Low")
badtreatments

# removes all white space

str_trim(badtreatments)

x<-"I love R!"
str_to_upper(x) # all in uppercase
str_to_lower(x) # all in lower case
str_to_title(x) # makes the first letter uppercase


data<-c("AAA", "TATA", "CTAG", "GCTT")

str_view(data, pattern = "A") # find all the string with A
str_detect(data, pattern = "A") # detect a specific pattern 
str_detect(data, pattern = "AT")

str_locate(data, pattern = "AT") # locate a pattern

vals<-c("a.b","b.c","c.d")

str_replace(vals, "\\."," ")

# str_replace only replaces the first instance 

vals<-c("a.b.c", "b.c.d","c.d.e")
str_replace(vals, "\\.", " ")

# so str_replace_all(vals, "\\.", " ") equal replaces all

str_replace_all(vals, "\\.", " ")

vals2<-c("test 123", "test 456", "test")
str_subset(vals2, "\\d")

# \\d means it number character in them
# \\D means letter character in them 

str_count(vals2, "[aeiou]") # count the number of lowercase letter

# count any digit
str_count(vals2, "[0-9]")

strings<-c("550-153-7578",
           "banana",
           "435.114.7586",
           "home: 672-442-6739")

phone <- "([2-9][0-9]{2})[- .]([0-9]{3})[- .]([0-9]{4})"

# Which strings contain phone numbers?
str_detect(strings, phone)

"([0-9]{3})[.]([0-9]{4})[.]([0-9]{2})"

# subset only the strings with phone numbers
test<-str_subset(strings, phone)
test

str_replace_all(test, "\\.", "-")

# explore it
head(austen_books())

original_books <- austen_books() %>% # get all of Jane Austen's books
  group_by(book) %>%
  mutate(line = row_number(), # find every line
         chapter = cumsum(str_detect(text, regex("^chapter [\\divxlc]", # count the chapters (starts with the word chapter followed by a digit or roman numeral)
                                                 ignore_case = TRUE)))) %>% #ignore lower or uppercase
  ungroup() # ungroup it so we have a dataframe again
# don't try to view the entire thing... its >73000 lines...
head(original_books)

tidy_books <- original_books %>%
  unnest_tokens(output = word, input = text) # add a column named word, with the input as the text column
head(tidy_books) # there are now >725,000 rows. Don't view the entire thing!

#see an example of all the stopwords
head(get_stopwords())

cleaned_books <- tidy_books %>%
  anti_join(get_stopwords()) # dataframe without the stopwords

cleaned_books %>%
  count(word, sort = TRUE)

sent_word_counts <- tidy_books %>%
  inner_join(get_sentiments()) %>% # only keep pos or negative words
  count(word, sentiment, sort = TRUE) # count them

sent_word_counts %>%
  filter(n > 150) %>% # take only if there are over 150 instances of it
  mutate(n = ifelse(sentiment == "negative", -n, n)) %>% # add a column where if the word is negative make the count negative
  mutate(word = reorder(word, n)) %>% # sort it so it gows from largest to smallest
  ggplot(aes(word, n, fill = sentiment)) +
  geom_col() +
  coord_flip() +
  labs(y = "Contribution to sentiment")

words<-cleaned_books %>%
  count(word) %>% # count all the words
  arrange(desc(n))%>% # sort the words
  slice(1:100) #take the top 100

wordcloud2(words, shape = 'triangle', size=0.3) # make a wordcloud out of the top 100 words
