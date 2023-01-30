
qiime tools import \
  --input-path  data/processed_data/interactions/BMO1/all_asvs.fasta \
  --output-path data/processed_data/BM01.fasta \
  --type 'FeatureData[Sequence]'

qiime tools import \
  --input-path  data/processed_data/interactions/BMO2/all_asvs.fasta \
  --output-path data/processed_data/BM02.fasta \
  --type 'FeatureData[Sequence]'
