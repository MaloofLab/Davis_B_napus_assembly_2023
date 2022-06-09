module load supernova/2.0.0


# Run Programs
sample="B.oleracea/Project_RMRL_BW716"

supernova run \
	--id=B_oleracea2 \
	--sample=BW716 \
	--fastqs=${sample} \
	--localcores=45 \
	--localmem=500 \
	--maxreads=235200000

# Run Stats

end=`date +%s`
runtime=$((end-start))
echo Done after $runtime seconds
