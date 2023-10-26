# HSV1-chromatin-dynamics

## Differential association of histone H2A variants with differentially transcribed HSV-1 genomes

Datasets associated with this study are located in the Histogram and depthBEDs folders while scripts used to generate plots are located in the scripts directory. See below for further details of how datasets were generated. 

The annotation directory contains GFF3 files for HSV-1 strain Kos [KT899744](https://www.ncbi.nlm.nih.gov/nuccore/952947517) that have been curated by Dan Depledge (annotation v1.2). 


#### Coding used to generate datasets in histogram and depthBED folders
```
# Bowtie2 indexing of a hybrid human (HG38) and viral (HSV-1 strain Kos) genome fasta file
bowtie2-build HG38full_HSV1-Kos.fasta HG38full_HSV1-Kos

# Quality and adapter trimming
trim_galore --paired --length 30 -o TrimFolder reads_R1.fastq.gz reads_R2.fastq.gz --q 30 --gzip

# Align with bowtie2
bowtie2 -p 4 -X 1000 -q -x HG38full_HSV1-Kos -1 TrimFolder/reads_R1_val_1.fq.gz -2 TrimFolder/reads_R2_val_2.fq.gz -S aligned.hg38_kos-X1000.sam

# Process with SAMtools to generate sorted indexed bam file
samtools view -bS -o aligned.hg38_kos-X1000.bam aligned.hg38_kos-X1000.sam
samtools sort -o aligned.hg38_kos-X1000.sorted.bam aligned.hg38_kos-X1000.bam
samtools index aligned.hg38_kos-X1000.sorted.bam

### HG38 only processing
# Remove HSV1-Kos alignments to generate HG38 only dataset
samtools view -h aligned.hg38_kos-X1000.sorted.bam | awk '{if($3 !~ /HSV1-Kos/){print $0}}' | samtools view -Shb - > aligned.HG38-X1000.sorted.bam
samtools index aligned.HG38-X1000.sorted.bam

sambamba view -h -t 2 -f bam -F "not (unmapped or mate_is_unmapped or supplementary or secondary_alignment) and proper_pair" aligned.HG38-X1000.sorted.bam > aligned.HG38-X1000.Filtered.sorted.bam
samtools index aligned.HG38-X1000.Filtered.sorted.bam

# Subsample 50000 reads (25k matched read pairs)
reformat.sh in=aligned.HG38-X1000.Filtered.sorted.bam out=aligned.HG38-X1000.Filtered.50k_sampled.sorted.bam samplereadstarget=50000 overwrite=TRUE ref=HG38full_HSV1-Kos.fasta

# Generate text file with insert length distribution
bbduk.sh in=aligned.HG38-X1000.Filtered.50k_sampled.sorted.bam ihist=aligned.HG38-X1000.Filtered.sorted.ihist.txt

### HSV-1 only processing
# Extract HSV1-Kos alignments
samtools view -bS -o aligned.HSV1-Kos-X1000.sorted.bam aligned.hg38_kos-X1000.sorted.bam HSV1-Kos:1-152222
samtools index aligned.HSV1-Kos-X1000.sorted.bam

## Filter to retain only reads mapped in proper pairs that are not secondary or supplementary alignments
sambamba view -h -t 2 -f bam -F "not (unmapped or mate_is_unmapped or supplementary or secondary_alignment) and proper_pair" aligned.HSV1-Kos-X1000.sorted.bam > aligned.HSV1-Kos-X1000.Filtered.sorted.bam

# Subsample 50000 reads (25k matched read pairs)
reformat.sh in=aligned.HSV1-Kos-X1000.Filtered.sorted.bam out=aligned.HSV1-Kos-X1000.Filtered.50k_sampled.sorted.bam samplereadstarget=50000 overwrite=TRUE ref=HSV1-Kos.fasta

# Generate sorted BAM files with only uniquely mapped reads
samtools view -b -f 83 aligned.HSV1-Kos-X1000.Filtered.50k_sampled.sorted.bam > aligned.HSV1-Kos-X1000.Filtered.sorted.83.bam
samtools view -b -f 163 aligned.HSV1-Kos-X1000.Filtered.50k_sampled.sorted.bam > aligned.HSV1-Kos-X1000.Filtered.sorted.163.bam
samtools view -b -f 99 aligned.HSV1-Kos-X1000.Filtered.50k_sampled.sorted.bam > aligned.HSV1-Kos-X1000.Filtered.sorted.99.bam
samtools view -b -f 147 aligned.HSV1-Kos-X1000.Filtered.50k_sampled.sorted.bam > aligned.HSV1-Kos-X1000.Filtered.sorted.147.bam

samtools index aligned.HSV1-Kos-X1000.Filtered.sorted.83.bam
samtools index aligned.HSV1-Kos-X1000.Filtered.sorted.163.bam
samtools index aligned.HSV1-Kos-X1000.Filtered.sorted.99.bam
samtools index aligned.HSV1-Kos-X1000.Filtered.sorted.147.bam

samtools merge -f aligned.HSV1-Kos-X1000.Filtered.sorted.paired.bam aligned.HSV1-Kos-X1000.Filtered.sorted.83.bam aligned.HSV1-Kos-X1000.Filtered.sorted.163.bam aligned.HSV1-Kos-X1000.Filtered.sorted.99.bam aligned.HSV1-Kos-X1000.Filtered.sorted.147.bam
samtools index aligned.HSV1-Kos-X1000.Filtered.sorted.paired.bam

# Generate BEDgraph and depthBED files
samtools view -b aligned.HSV1-Kos-X1000.Filtered.sorted.paired.bam | genomeCoverageBed -ibam stdin -bg -split > aligned.HSV1-Kos-X1000.Filtered.sorted.paired.bedgraph
samtools view -b aligned.HSV1-Kos-X1000.Filtered.sorted.paired.bam | genomeCoverageBed -ibam stdin -d -split > aligned.HSV1-Kos-X1000.Filtered.sorted.paired.depth.bed
head -153000 aligned.HSV1-Kos-X1000.Filtered.sorted.paired.depth.bed | grep 'HSV1-Kos' > aligned.HSV1-Kos-X1000.Filtered.sorted.paired.depth.fixed.bed

# Generate text file with insert length distribution
#bbduk.sh in=aligned.HSV1-Kos-X1000.Filtered.sorted.paired.bam ihist=aligned.HSV1-Kos-X1000.Filtered.sorted.paired.ihist.txt

# clean up temp files
rm aligned.HSV1-Kos-X1000.Filtered.sorted.paired.depth.bed
rm aligned.hg38_kos-X1000.sam
```

#### Software used
- TrimGalore
- Bowtie2 v2.4.4
- SAMtools v1.15.1
- BBMap v38.96
- Sambamba v0.8.0
- BEDTools v2.27.1


