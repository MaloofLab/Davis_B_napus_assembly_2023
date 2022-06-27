source Falcon/fc_env_180707/bin/activate

# Run Programs
cd Dovetail_Canu
blasr \
	Pac-Bio/m54048_170705_050736.subreads.bam \
	Assemblies/Dovetail_Canu_20180524.fa \
	--bam \
	--nproc 20 \
	--minSubreadLength 10000 \
	--out m54048_170705_050736_aligned.bam


module load samtools/1.8

samtools sort \
	-@ 20 \
	-o sorted_m54048_170705_050736_aligned.bam \
	m54048_170705_050736_aligned.bam && \
rm m54048_170705_050736_aligned.bam && \
samtools index sorted_m54048_170705_050736_aligned.bam

# Run Stats

end=`date +%s`
runtime=$((end-start))
echo Done after $runtime seconds
