import argparse
import os

if __name__ == "__main__":
    # setup the command line argument parser
    parser = argparse.ArgumentParser()
    parser.add_argument("rndstr",
                        type=str,
                        help="Path to the 'rndstr.in' random structure file")
    parser.add_argument("runjob",
                        type=str,
                        help="Path to the SLURM job submission script")
    parser.add_argument("N", type=int, help="Number of repetitions to make")

    # get command line arguments
    args = parser.parse_args()

    # read the input files
    with open(args.rndstr, "r") as f:
        rndstr_body = f.read()
    with open(args.runjob, "r") as f:
        runjob_body = f.read()
    # generate working directories for each repetition
    cwd = os.getcwd()
    rndstr_filename = "rndstr.in"
    runjob_filename = "runjob.slurm"
    for i in range(args.N):
        dirname = "sqs_{:03d}".format(i)
        path = os.path.join(cwd, dirname)
        os.mkdir(path)
        rndstr_path = os.path.join(path, rndstr_filename)
        runjob_path = os.path.join(path, runjob_filename)
        # make copies of the input files in the new directory
        with open(rndstr_path, "w") as f:
            f.write(rndstr_body)
        with open(runjob_path, "w") as f:
            f.write(runjob_body)
        # enter the new directory to submit the job
        os.chdir(path)
        cmd = "sbatch {}".format(runjob_filename)
        os.system(cmd)
        os.chdir(cwd)
