module load supernova/2.0.0
# Run Programs

sample="B.rapa/Project_RMRL_WC720"

supernova run \
	--id=B_rapa \
	--sample=WC720 \
	--fastqs=${sample} \
	--localcores=45 \
	--localmem=500000 \
	--maxreads=181066667

# Run Stats

end=`date +%s`
runtime=$((end-start))
echo Done after $runtime seconds
