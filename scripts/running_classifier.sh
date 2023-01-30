# import the data
qiime tools import \
  --input-path  data/processed_data/interactions/BMO1/all_asvs.fasta \
  --output-path data/processed_data/BM01_asvs.qza \
  --type 'FeatureData[Sequence]'

# make classifications
qiime feature-classifier classify-sklearn \
     --i-classifier data/reference_library/processed_data/2023-01/16s/ncbi-refseqs-classifier.qza \
     --i-reads data/processed_data/BM01_asvs.qza \
     --o-classification data/processed_data/BM01_taxonomy.qza

# visualise the classifications
qiime metadata tabulate \
     --m-input-file data/processed_data/BM01_taxonomy.qza \
     --o-visualization results/BM01_taxonomy.qzv

# import the data
qiime tools import \
  --input-path  data/processed_data/interactions/BMO2/all_asvs.fasta \
  --output-path data/processed_data/BM02_asvs.qza \
  --type 'FeatureData[Sequence]'

# make classifications
qiime feature-classifier classify-sklearn \
     --i-classifier data/reference_library/processed_data/2023-01/16s/ncbi-refseqs-classifier.qza \
     --i-reads data/processed_data/BM02_asvs.qza \
     --o-classification data/processed_data/BM02_taxonomy.qza

# visualise the classifications
qiime metadata tabulate \
     --m-input-file data/processed_data/BM02_taxonomy.qza \
     --o-visualization results/BM02_taxonomy.qzv