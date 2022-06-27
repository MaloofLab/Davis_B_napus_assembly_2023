module load supernova/2.0.0
basepath="Parent_Supernova/B.oleracea"

out_prefix="B_oleracea"
amsdir="${basepath}/B_oleracea/outs/assembly"

## output style options are raw|megabubbles|pseudohap|pseudohap2
## minsize default is 1000bp
## headers default is short
call="supernova mkoutput \
--asmdir=${amsdir} \
--outprefix=${out_prefix}.raw \
--style=raw \
--minsize=1000 \
--headers=full"

echo $call
echo "NOT CALLED"
#eval $call

call="${supernovapath}/supernova mkoutput \
--asmdir=${amsdir} \
--outprefix=${out_prefix}.megabubbles \
--style=megabubbles \
--minsize=1000 \
--headers=full"

echo $call
echo "NOT CALLED"
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
