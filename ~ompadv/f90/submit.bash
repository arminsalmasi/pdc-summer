#!/bin/bash -l

#SBATCH -A summer-2017
#SBATCH -J myjob
#SBATCH -t 0:10:00
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 1
#SBATCH --reservation=summer-2017-08-17
#SBATCH -e error_file.e
#SABTCH -o output_file.o
export OMP_NUM_THREADS=1


