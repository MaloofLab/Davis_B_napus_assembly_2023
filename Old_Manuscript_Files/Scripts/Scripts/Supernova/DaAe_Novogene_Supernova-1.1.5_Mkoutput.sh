basepath="Bnapus1_Novogene"

out_prefix="Combined-1"
amsdir="${basepath}/Combined_B_napus-1/outs/assembly"

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

