#!/bin/bash -l
# NOTE the -l flag!
#

# This is an example job file for a multi-core MPI job.
# Note that all of the following statements below that begin
# with #SBATCH are actually commands to the SLURM scheduler.
# Please copy this file to your home directory and modify it
# to suit your needs.
# 
# If you need any help, please email rc-help@rit.edu
#

# Name of the job - You'll probably want to customize this.
#SBATCH -J HydRun

# Standard out and Standard Error output files
#SBATCH -o HydRun.output
#SBATCH -e HydRun.output

# Request 5 hours run time MAX, anything over will be KILLED
#SBATCH -t 5:0:0

# Put the job in the "work" partition and request FOUR cores
# "work" is the default partition so it can be omitted without issue.
#SBATCH -p work -n 1


#
# Your job script goes below this line.  
# 

#/home/jxc4005/hydrolight5Aaron_install/main_HL.exe < ./input.txt

#/home/jxc4005/ecolight52_install/Code/Ecolight/mainEL_stnd.exe < ./input.txt

/home/jxc4005/ecolight52_install/Code/Ecolight/mainEL_stnd.exe < ./ITestEco.txt
#/home/jxc4005/hydrolight5Aaron_install/main_HL.exe< ./input.txt
#/home/jxc4005/ecolight52_install/Code/Hydrolight/mainHL_stnd.exe< ./ITestEco.txt
#/home/jxc4005/hydrolight5Aaron_install/code/main_HL.exe< ./ITestEco.txt


sed -n -e '/Ed/ {n; p;}' DOutputHL.txt |awk '{ print $1 }'>Ed.txt
sed -n -e '/RADMa/ {n; p;}' DOutputHL.txt |awk '{ print $10}'>RADMa.txt
sed -n -e '/RAD0Ma/ {n; p;}' DOutputHL.txt |awk '{ print $10}'>RAD0Ma.txt

pr -m -t -s\  RADMa.txt Ed.txt RAD0Ma.txt >tempR.txt

rm Ed.txt
rm RADMa.txt
rm RAD0Ma.txt

mv tempR.txt ./ref/
#rm ./* 2> /dev/null
#exit
