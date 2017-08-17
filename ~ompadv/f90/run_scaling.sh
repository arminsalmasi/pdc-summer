#!/bin/bash
for n in $(seq 1 20); do
    export OMP_NUM_THREADS=$n
    exectime=`aprun -cc none -n 1 -N 1 -j 1 -d $OMP_NUM_THREADS ./shwater2d | grep Solver | awk '{ print $3 }'`
	if [ "$n" == "1" ]; then
		firsttime=$exectime
	fi
	echo threads=$n: time=$exectime speedup=`echo scale=5";" $firsttime / $exectime | bc` scaling=`echo scale=5";" $firsttime / $exectime / $n| bc`
done
