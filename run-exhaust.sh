MAX_NUM=6678
MAX_JOBS=500
DELTA=$((MAX_JOBS - 1))
SCRIPT=~/projects/fraternal-dropout/fraternal-dropout/run.sh

echo "Beginning job submission on "`date` >> ~/batch_job_status.out
for i in `seq 0 $MAX_JOBS $MAX_NUM`
do
    A=$i
    B=$((i+DELTA))
    if [ $B -gt $MAX_NUM ];
    then
        D=$((B - MAX_NUM))
        B=$((A+DELTA-D))
    fi
    echo "Submitting jobs $A-$B" >> batch_job_status.out
    sbatch --array=$A-$B --qos=low --gres=gpu --mem=20000 $SCRIPT >> ~/batch_job_status.out
    sleep 100
done

echo "Job submission completed."

