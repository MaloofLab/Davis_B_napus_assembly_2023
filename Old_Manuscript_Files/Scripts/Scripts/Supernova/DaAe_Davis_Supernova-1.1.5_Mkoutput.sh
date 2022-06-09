THREADS=${SLURM_NTASKS}
MEM=$(expr ${SLURM_MEM_PER_NODE} / 1000)

source ~/.bash_profile
basepath="Bnapus1_2_soni"

out_prefix="Split-2"
amsdir="${basepath}/Split_Bnapus1-2/outs/assembly"

## output style options are raw|megabubbles|pseudohap|pseudohap2
## minsize default is 1000bp
## headers default is short
#call="supernova mkoutput \
#--asmdir=${amsdir} \
#--outprefix=${out_prefix}.raw \
#--style=raw \
#--minsize=1000 \
#--headers=full"

#echo $call
#eval $call

#call="supernova mkoutput \
#--asmdir=${amsdir} \
#--outprefix=${out_prefix}.megabubbles \
#--style=megabubbles \
#--minsize=1000 \
#--headers=full"

#echo $call
#eval $call

call="supernova mkoutput \
--asmdir=${amsdir} \
--outprefix=${out_prefix}.pseudohap \
--style=pseudohap \
--minsize=1000 \
--headers=full"

echo $call
eval $call

call="supernova mkoutput \
--asmdir=${amsdir} \
--outprefix=${out_prefix}.pseudohap2 \
--style=pseudohap2 \
--minsize=1000 \
--headers=full"

echo $call
eval $call

end=`date +%s`

runtime=$((end-start))

echo $runtime

