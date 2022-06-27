cd Bnapus1_2_soni

# Run Programs

sample=Supernova_mkfastq

supernova run \
	--sample Split_Bnapus1-2 \
	--id Split_Bnapus1-2 \
	--fastqs ${sample} \
	--localcores 45 \
	--localmem 500000

# Run Stats

end=`date +%s`
runtime=$((end-start))
echo Done after $runtime seconds
