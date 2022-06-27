#!/bin/bash
#SBATCH --partition=production # partition to submit to
#SBATCH --job-name="Maker" # Job name
#SBATCH --array=1-20
#SBATCH --nodes=1 # single node, anything more than 1 will not run
#SBATCH --ntasks=15 # equivalent to cpus, stick to around 20 max on gc64, or gc128 nodes
#SBATCH --mem=30000 # in MB, memory pool all cores, default is 2GB per cpu
#SBATCH --time=7-00:00:00  # expected time of completion in hours, minutes, seconds, default 1-day
#SBATCH --output=arrayJob_%A_%a.out # File to which STDOUT will be written
#SBATCH --error=arrayJob_%A_%a.err # File to which STDERR will be written
#SBATCH --mail-user=jtdavis@ucdavis.edu
#SBATCH --mail-type=ALL
# This will be run once for a single process
aklog
/bin/hostname

start=`date +%s`

# Load modules
source /share/malooflab/Packages/maker-3.01.02-beta/Maker.bash_profile
export LD_PRELOAD=/usr/lib/libmpi.so

echo "My SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
chromosome=$(sed "${SLURM_ARRAY_TASK_ID}q;d" chromosome_list.txt)

# Run Programs
cd ${chromosome}
/share/malooflab/Packages/maker-3.01.02-beta/bin/maker

# Run Stats

end=`date +%s`
runtime=$((end-start))
echo Done after $runtime seconds
