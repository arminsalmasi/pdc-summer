#!/bin/bash


for n in $(seq 1 20); do
    export OMP_NUM_THREADS=$n
		echo OMP_NUM_THREADS=$n
    aprun -cc none -n 1 -N 1 -j 1 -d $OMP_NUM_THREADS ./shwater2d
done
