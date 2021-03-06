#!/bin/bash
#SBATCH --job-name=CUSTOM    # Name of the job; only 8 characters will be visible on hipergator
#SBATCH --account=phillpot   # Account you are working under; always 'phillpot' unless you have access to another queue
#SBATCH --qos=phillpot       # Queue you are submitting to
#SBATCH --mail-type=CUTSOM   # events which will trigger an email notification; choose many from NONE,BEGIN,END,FAIL
#SBATCH --mail-user=CUSTOM   # email address to conteact in the event of a 'mail-type' event occuring
#SBATCH --ntasks=1           # Number of CPUs to use; mcsqs is not parallel so only use 1
#SBATCH -N 1                 # Number of nodes to use; each hipergator node contains 32 cpus; use the minimum number of nodes
#SBATCH --mem-per-cpu=CUSTOM # amount of memory to use on each cpu; refer to the notification emails to tune efficiency
#SBATCH --distribution=cyclic:cyclic # work distribution scheme
#SBATCH --time=24:00:00              # time limit for the job; hours:minutes:seconds
#SBATCH --output=job.out             # file which stdout is redirected to
#SBATCH --error=job.err              # file which stderr is redirected to

# This is the compile chain as of November 5, 2019.
module load gcc/5.2.0
module load atat/3.34

# rndstr.in is the input file required by mcsqs
# -ro -noe -nop prevent single point clusters from being considered
# -2 and -3 should be supplied with the radius of a 2 and 3 atom cluster respectively
# -2 should be ~ 1.5 * the nearest neighbor distance of your system
# -3 should be ~3 * the nearest neighbor distasnce of your system
corrdump -l=rndstr.in -ro -noe -nop -2=CUSTOM -3=CUSTOM
# -n should be the number of atoms in your system
mcsqs -n=CUSTOM
