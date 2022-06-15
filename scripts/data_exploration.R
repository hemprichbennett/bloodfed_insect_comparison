library(magrittr)
library(dplyr)
library(tidyr)
library(ggplot2)
library(rentrez)

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

# we cannot identify any of these sequences using the BOLD r package 
# as that only works for querying CO1

more_info %>%
  group_by(Phylum) %>%
  summarise(nrows = n())

more_info %>%
  filter(Phylum == 'Arthropoda') %>%
  group_by(Order) %>%
  summarise(nrows = n())



bold_data <- readxl::read_excel('~/Dropbox/work/projects/in_progress/bin_accumulation/data/processed_data/TMGHA/bold_tidied.xlsx')


big_df <- in_df %>%
  left_join(bold_data, by = c('ProcessID' = 'Process ID'))


chordate_df <- big_df %>%
  filter(Phylum == 'Chordata')


duplicate_processids <- big_df %>%
  group_by(ProcessID) %>%
  summarise(nrows = n()) %>%
  filter(nrows >1) %>%
  pull(ProcessID)

just_duplicates <- big_df %>%
  filter(ProcessID  %in% duplicate_processids)


temp <- filter(just_duplicates, ProcessID == 'TMGHA1001-21')
