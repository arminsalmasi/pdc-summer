#!/bin/bash -l

rm -f *.out

ftn -fpp -O2 -openmp -lm hello.f90 -o a.out


