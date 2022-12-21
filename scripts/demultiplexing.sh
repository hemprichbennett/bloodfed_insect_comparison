# code requires cutadapt to be installed, and 
# should be ran in projects base directory
cutadapt \
    -e 0.15 --no-indels \
    -g ^file:barcodes_fwd.fasta \
    -G ^file:barcodes_rev.fasta \
    -o {name1}-{name2}.1.fastq.gz -p {name1}-{name2}.2.fastq.gz \
    input.1.fastq.gz input.2.fastq.gz
