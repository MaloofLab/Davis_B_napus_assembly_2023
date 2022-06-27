module load bwa/0.7.16a
module load samtools/1.8

# Run Programs
cd Dovetail_Canu

# First part of protocol found at
# https://github.com/ArimaGenomics/mapping_pipeline/blob/master/Arima_Mapping_UserGuide.pdf

bwa mem \
	-t 10 \
	-B 8 \
	Assemblies/Dovetail_Canu_20180524.fa \
	Reads/HiC/CP-4255_S5_L006_R1_001.fastq.gz \
	| samtools view -Sb - > CP-4255_S5_L006_R1_001.aligned.bam

# Run Stats

end=`date +%s`
runtime=$((end-start))
echo Done after $runtime seconds
