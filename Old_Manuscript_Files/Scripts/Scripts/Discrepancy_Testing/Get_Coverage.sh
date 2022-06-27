module load samtools/1.8
samtools sort -@ 20 aligned_${chrom}_${discrep}.bam > sorted_aligned_${chrom}_${discrep}.bam
samtools depth -aa sorted_aligned_${chrom}_${discrep}.bam > ${chrom}_${discrep}_depth.txt