# atat-scripts
Scripts related to the Alloy Theoretic Automated Toolkit

## Format
Script names should follow the general convention `purpose_software_platform` where, in this case, `software` will be one of the packages in ATAT. Please comment your code __heavily__ as a courtesy to those who are not familiar with it.

## Descriptions

### repeat_mcsqs_hipergator.py
Generates many SQS structures from one input structure and one job submission script. Execute it in the following way, assuming you have the script in your `PATH`.
```bash
$ python3 repeat_mcsqs_hipergator.py <rndstr> <runjob> <N>
```
Where `rndstr` is the path to a rndstr.in structure file, `runjob` is the path to a SLURM job submission script, and `N` is the number of structures to generate. Working directories for each structure will be generated so be sure to execute this script in a nested directory to prevent terminal bloat. 

### runjob_mcsqs_hipergator.sh
Template for a mcsqs job submisson script on hipergator. Execute it in the following way, assuming you have copied it into your simulation directory.
```bash
$ sbatch runjob_mcsqs_hipergator.sh
```
