library(readr)
library(tidyr)
library(magrittr)
library(dplyr)
field_data <- read_csv('data/raw_data/example_field_data.csv')

miseq_classifications <- read_csv('data/raw_data/example_miseq_classifications.csv') %>%
  # deduplicate rows
  distinct(.)
miseq_metadata <- read_csv('data/raw_data/example_miseq_data.csv')



pacbio_classifications <- read_csv('data/raw_data/example_pacbio_classifications.csv') %>%
  # deduplicate rows
  distinct(.)
pacbio_metadata <- read_csv('data/raw_data/example_pacbio_data.csv')

pacbio_data <- field_data %>%
  left_join(pacbio_metadata) %>%
  left_join(pacbio_classifications)


vector_ids <- pacbio_data %>%
  filter(Phylum == 'arthropoda') %>%
  select(ProcessID, Taxonomy)

better_field_data <- vector_ids %>%
  left_join(field_data)



 miseq_data <- better_field_data %>%
   left_join(miseq_metadata) %>%
   left_join(miseq_classifications)

 
  