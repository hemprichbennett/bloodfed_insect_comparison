# code requires cutadapt to be installed, and 
# should be ran in projects base directory
cutadapt \
    -e 0.15 --no-indels \
    -g ^file:data/primers/barcodes_fwd.fasta \
    -G ^file:data/primers/barcodes_rev.fasta \
    -o ./data/processed_data/demultiplexed/BM01/{name1}-{name2}.1.fastq.gz \
    -p ./data/processed_data/demultiplexed/BM01/{name1}-{name2}.2.fastq.gz \
    --pair-filter=any \
    --discard-untrimmed \
    --json=BM01.cutadapt.json \
    --info-file=BM01.info.tsv \
    BB_TMBM/BM01/Blood-Meal-01-CCDB-35500-511-3547548/FASTQ_Generation_2022-10-22_00_19_30Z-4477526/101922Blood-Meal-1_L001-ds.24b9d774095b4073968cae4add9331f2/101922Blood-Meal-1_S1_L001_R1_001.fastq.gz \
    BB_TMBM/BM01/Blood-Meal-01-CCDB-35500-511-3547548/FASTQ_Generation_2022-10-22_00_19_30Z-4477526/101922Blood-Meal-1_L001-ds.24b9d774095b4073968cae4add9331f2/101922Blood-Meal-1_S1_L001_R2_001.fastq.gz

cutadapt \
    -e 0.15 --no-indels \
    -g ^file:data/primers/barcodes_fwd.fasta \
    -G ^file:data/primers/barcodes_rev.fasta \
    -o ./data/processed_data/demultiplexed/BM02/{name1}-{name2}.1.fastq.gz \
    -p ./data/processed_data/demultiplexed/BM02/{name1}-{name2}.2.fastq.gz \
    --pair-filter=any \
    --discard-untrimmed \
    --json=BM02.cutadapt.json \
    --info-file=BM02.info.tsv \
    BB_TMBM/BM02/Blood-Meal-02-CCDB-35512-523-3563561/FASTQ_Generation_2022-10-27_00_37_19Z-4504500/102422CCDB-BM-2_L001-ds.b809200b619f43a6a4085076580cc92c/102422CCDB-BM-2_S1_L001_R1_001.fastq.gz \
    BB_TMBM/BM02/Blood-Meal-02-CCDB-35512-523-3563561/FASTQ_Generation_2022-10-27_00_37_19Z-4504500/102422CCDB-BM-2_L001-ds.b809200b619f43a6a4085076580cc92c/102422CCDB-BM-2_S1_L001_R2_001.fastq.gz 

# copy all of the files
cp ./data/processed_data/demultiplexed ./data/processed_data/filtered
# delete any of them that are under 4k in size
find ./data/processed_data/filtered/*/* -name "*.fastq.gz" -type f -size -4k -delete