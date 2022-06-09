source ~/falcon/fc_env_170912/bin/activate

# Run Programs

fc_run fc_run.cfg

# Run Stats

end=`date +%s`
runtime=$((end-start))
echo Done after $runtime seconds
