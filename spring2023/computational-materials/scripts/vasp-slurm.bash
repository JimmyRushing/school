#!/bin/bash
#SBATCH -J vasp-Al           # job name
#SBATCH -o log_slurm.o%j  # output and error file name (%j expands to jobID)
#SBATCH -n 4             # total number of cpus requested: 48 per node.
#SBATCH -p short         # queue (partition)
#SBATCH -t 12:00:00       # run time (hh:mm:ss) - 12.0 hours in this example.

# Run this file in the folder containing your INCAR with:
# sbatch vasp-slurm.bash

# Prints some useful info about the job
echo "Date              = $(date)"
echo "Hostname          = $(hostname -s)"
echo "Working Directory = $(pwd)"
echo ""
echo "Number of Nodes Allocated      = $SLURM_JOB_NUM_NODES"
echo "Number of Tasks Allocated      = $SLURM_NTASKS"
echo "Number of Cores/Task Allocated = $SLURM_CPUS_PER_TASK"
echo ""

# Loads the vasp module
module load vasp/5.4.4

# Execute the program:
mpirun vasp_std
