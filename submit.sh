#!/bin/bash

	clear
	echo "-----------------------------------------------------"
	echo "	           MULTIPLE ON SLURM CLUSTER               "
	echo "-----------------------------------------------------"
	echo "starting infinite loop for submitting jobs"

while :
do
	echo "number of unkillable jobs : "
	UNKILL=$(squeue --user=suhubdyd | grep -c unkillable)
	if [ $UNKILL==0 ]; then
		echo $UNKILL
		sbatch --qos=unkillable --gres=gpu --mem=20000 ./main.sh
	fi
	echo "number of high jobs : " 
	HIGH=$(squeue --user=suhubdyd | grep -c high)
	if [ $HIGH == 0 ]; then
		echo $HIGH
		sbatch --qos=high --gres=gpu --mem=20000 ./main.sh
		sbatch --qos=high --gres=gpu --mem=20000 ./main.sh
	fi
	echo "number of low jobs : " 
	LOW=$(squeue --user=suhubdyd | grep -c low)
	if [ $LOW == 0 ]; then 
		echo $LOW
		sbatch --qos=low --gres=gpu --mem=20000 ./main.sh
		sbatch --qos=low --gres=gpu --mem=20000 ./main.sh
		sbatch --qos=low --gres=gpu --mem=20000 ./main.sh
		sbatch --qos=low --gres=gpu --mem=20000 ./main.sh
	fi
	echo "Another call.."
	# wait for another half an hour
	sleep 1800
done
