#!/bin/tcsh
#SBATCH --job-name=dam
#SBATCH --partition=wholenode
#SBATCH --nodes=1

#SBATCH --time=1:00:00
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=END
#SBATCH --mail-user=jinwoo.park@und.edu

module purge
module load gcc
module load openmpi

set var=$1
singularity exec --bind /anvil/scratch/x-cybergis/compute/1672794633Ilt8J:/job/executable /anvil/projects/x-cis220065/x-cybergis/compute/extractinundationcensustracts-processor.sif python3 main_multi_scenarios_final.py $var

# singularity exec --bind /anvil/scratch/x-cybergis/compute/1672794633Ilt8J:/job/executable /home/x-cybergis/simages/extractinundationcensustracts-processor.sif python3 main_multi_scenarios.py $var