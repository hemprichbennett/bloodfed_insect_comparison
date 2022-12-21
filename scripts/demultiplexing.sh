# code requires cutadapt to be installed, and 
# should be ran in projects base directory
cutadapt \
    -e 0.15 --no-indels \
    -g ^file:data/primers/barcodes_fwd.fasta \
    -G ^file:data/primers/barcodes_rev.fasta \
    -o ./data/processed_data/demultiplexed/{name1}-{name2}.1.fastq.gz \
    -p ./data/processed_data/demultiplexed/{name1}-{name2}.2.fastq.gz \
    BB_TMBM/BM01/Blood-Meal-01-CCDB-35500-511-3547548/FASTQ_Generation_2022-10-22_00_19_30Z-4477526/101922Blood-Meal-1_L001-ds.24b9d774095b4073968cae4add9331f2/101922Blood-Meal-1_S1_L001_R1_001.fastq.gz \
    BB_TMBM/BM01/Blood-Meal-01-CCDB-35500-511-3547548/FASTQ_Generation_2022-10-22_00_19_30Z-4477526/101922Blood-Meal-1_L001-ds.24b9d774095b4073968cae4add9331f2/101922Blood-Meal-1_S1_L001_R2_001.fastq.gz

