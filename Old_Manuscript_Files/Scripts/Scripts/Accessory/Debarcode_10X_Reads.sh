#module load trimmomatic/0.33

# Run Programs

trimmomatic SE \
	-threads 8 \
	../Bnapus1_S1_L001_R1_001.fastq.gz \
	Unbarcoded_Bnapus1_S1_L001_R1_001.fastq.gz \
	HEADCROP:23

trimmomatic SE \
        -threads 8 \
        ../Bnapus1_S1_L001_R2_001.fastq.gz \
        Unbarcoded_Bnapus1_S1_L001_R2_001.fastq.gz \
        HEADCROP:1

# Run Stats

end=`date +%s`
runtime=$((end-start))
echo Done after $runtime seconds
