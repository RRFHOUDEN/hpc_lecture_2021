#! /bin/bash
module purge
module load gcc cuda/11.2.146 openmpi
core=4
mpicxx original.cpp -fopenmp -O3
echo 'original version'
mpirun -np ${core} ./a.out
echo 'change_order version'
mpicxx change_order.cpp -fopenmp -O3
mpirun -np ${core} ./a.out
echo 'improved version'
mpicxx example.cpp -fopenmp -O3
mpirun -np ${core} ./a.out
