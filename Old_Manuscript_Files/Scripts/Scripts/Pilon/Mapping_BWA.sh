module load bwa/0.7.16a
module load samtools/1.6

mkdir Canu
cd Canu

bwa mem ../../Assemblies/Canu.fa \
	-t 20 \
	Unbarcoded_Bnapus1_S1_L001_R1_001.fastq.gz \
	Unbarcoded_Bnapus1_S1_L001_R2_001.fastq.gz \
	| samtools sort -@ 20 -O BAM -o Canu.bam -

# Run stats

end=`date +%s`
runtime=$((end-start))
echo $runtime seconds to completion
