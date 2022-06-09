module load supernova/2.0.0
basepath="Supernova-2.0.0"

out_prefix="B_napus"
amsdir="${basepath}/Davis_2/outs/assembly"

## output style options are raw|megabubbles|pseudohap|pseudohap2
## minsize default is 1000bp
## headers default is short
call="supernova mkoutput \
--asmdir=${amsdir} \
--outprefix=${out_prefix}.pseudohap \
--style=pseudohap \
--minsize=1000 \
--headers=short"

echo $call
eval $call

end=`date +%s`

runtime=$((end-start))

echo $runtime
