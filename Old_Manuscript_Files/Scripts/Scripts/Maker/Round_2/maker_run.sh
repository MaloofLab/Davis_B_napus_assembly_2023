# Load modules
source maker-3.01.02-beta/Maker.bash_profile
export LD_PRELOAD=/usr/lib/libmpi.so

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
chromosome=chrA01

# Run Programs
cd chrA01
maker

# Run Stats

end=`date +%s`
runtime=$((end-start))
echo Done after $runtime seconds
