#!/bin/bash -l

#SBATCH -A summer-2017
#SBATCH -J myjob
#SBATCH -t 0:10:00
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 24
#SBATCH --reservation=summer-2017-08-16
#SBATCH -e error_file.e
#SABTCH -o output_file.o

aprun -n 1 -d 6 -cc none ./a.out
	## > log.log 2>&1 


