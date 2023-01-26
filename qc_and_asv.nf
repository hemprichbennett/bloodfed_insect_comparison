params.indir = 'data/processed_data/filtered/BM02'

toSearch = params.indir + '**/*{1,2}*.fastq.gz'

input_files = Channel
  .fromFilePairs(toSearch)

basedir = file('./')


process cutadapt_channel {
  input:
  set sampleID, file(infiles) from input_files

  output:
  set sampleID, file('f_clipped'), file('r_clipped') into clipped_channel

  shell:
  """

  fwd_file=\$(echo $infiles | sed 's/ .*//')
  fwd_file=\$(echo \$fwd_file | sed 's/\\[//')
  fwd_file=\$(echo \$fwd_file | sed 's/\\,//')
  rev_file=\$(echo $infiles | sed 's/.* //')
  rev_file=\$(echo \$rev_file | sed 's/\\]//')
  

  echo forward is \$fwd_file
  

  primerpair=16SmbF_bbR
  fwd_primer=\$(sed '1q;d' $basedir/data/primers/\$primerpair) #forward primer is the first line of the primer-file
  rev_primer=\$(sed '2q;d' $basedir/data/primers/\$primerpair) #reverse primer is the second line of the primer-file

  cutadapt -g \$fwd_primer -G \$rev_primer -o f_clipped -p r_clipped \$fwd_file \$rev_file --minimum-length 1

  """
}


process dada2_quality_filtering{
  input:
  set id, file(f_clipped), file(r_clipped) from clipped_channel

  output:
  file "${id}_f" into filtered_fwds
  file("${id}_r") into filtered_revs

  shell:
  """
  Rscript $basedir/scripts/dada2_filtering.R $f_clipped $r_clipped ${id}_f ${id}_r
  """
}

process make_asvs{

  input:
  file f_file from filtered_fwds.collect()
  file r_file from filtered_revs.collect()

  
  shell:
  """
  Rscript $basedir/scripts/dada2_errors_and_merge.R $params.indir $basedir
  """
}
