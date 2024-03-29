library(tidyverse)

in_df <- readxl::read_excel('data/raw_data/29_9_21 Heath trap SMRT-00672_mBraveoutput_EVZ20210929-1.xlsm')

in_df %>%
  group_by(ProcessID) %>%
  summarise(n = n()) %>%
  ggplot(. , aes(x = n)) +
  geom_histogram() +
  labs(x = 'Number of rows', y = 'Number of processIDs')


more_info <- in_df %>%
  mutate(trimmed_read = gsub('-', '', Sequence),
         readlength = nchar(Sequence),
            trimmed_readlength = nchar(trimmed_read),
         read_is_unpadded = ifelse(readlength == trimmed_readlength, T, F))

more_info %>% group_by(read_is_unpadded) %>% summarise(n = n())
