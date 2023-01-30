
qiime tools import \
  --input-path  data/processed_data/interactions/BMO1/all_asvs.fasta \
  --output-path data/processed_data/BM01_asvs.qza \
  --type 'FeatureData[Sequence]'

qiime feature-classifier classify-sklearn \
     --i-classifier data/reference_library/processed_data/2023-01/16s/ncbi-refseqs-classifier.qza \
     --i-reads data/processed_data/BM01_asvs.qza \
     --o-classification data/processed_data/BM01_taxonomy.qza

qiime tools import \
  --input-path  data/processed_data/interactions/BMO2/all_asvs.fasta \
  --output-path data/processed_data/BM02_asvs.qza \
  --type 'FeatureData[Sequence]'

qiime feature-classifier classify-sklearn \
     --i-classifier data/reference_library/processed_data/2023-01/16s/ncbi-refseqs-classifier.qza \
     --i-reads data/processed_data/BM02_asvs.qza \
     --o-classification data/processed_data/BM02_taxonomy.qza

