#module load java

# Run Programs

mkdir Canu

java -Xmx500G -jar ~/Bioinformatic_Packages/pilon-1.22.jar \
	--genome ../Assemblies/Canu.fa \
	--frags ../Bams/Canu_2/Canu.bam \
	--outdir Canu_2 \
	--diploid \
	--fix all \
	--threads 40 \
	--verbose

# Run Stats

end=`date +%s`
runtime=$((end-start))
echo Done after $runtime seconds
