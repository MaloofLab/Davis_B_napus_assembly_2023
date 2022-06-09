cd Supernova-2.0.0

# Run Programs

sample=Supernova_mkfastq

supernova run \
	--id Davis_2 \
	--sample Bnapus1 \
	--fastqs ${sample} \
	--localcores 45 \
	--localmem 500000 \
	--maxreads=420000000

# Run Stats

end=`date +%s`
runtime=$((end-start))
echo Done after $runtime seconds
