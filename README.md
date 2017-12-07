# Massive Run (Copyright Dendi Suhubdy, 2017)
SLURM unlimited loop to submit a job

the bash script was created for the lab environment at MILA
so that at each half an hour the script would check if there 
are jobs or resources available, which are 1 unkillable, 2 high
and unlimited low jobs (although low jobs could be killed by others).

# Running
```bash
./submit.sh
```

# Job

Place your main executable file and modify `./main.sh` to
run only your script. In this case it's `main.py`, it could be
`./main` for a C/C++ program.
