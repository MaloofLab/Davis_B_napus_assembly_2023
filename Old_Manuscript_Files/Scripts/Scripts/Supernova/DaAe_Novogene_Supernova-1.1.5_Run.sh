supernova run \
	--sample Combined_B_napus1-1 \
	--id Combined_B_napus-1 \
	--fastqs ${sample} \
	--localcores 45 \
	--localmem 500000

# Run Stats

end=`date +%s`
runtime=$((end-start))
echo Done after $runtime seconds
