#!/bin/bash
#This code checks for missing running jobs depending on the list of running and queued sge jobs change the search names for different jobs. 
module load sge
qstat > qstat.log
echo "#############################  IM  #################################"
let a=0
if [ $(grep "IM_[0-9]" qstat.log | grep -c " r ") -eq 1 ]
then
        let a=${a}+1
        #grep "$i" qstat.log | grep " r " | grep -v "OM"
else
        echo "IM only MISSING... "
        #grep "$i" qstat.log | grep " r " | grep -v "OM"

fi


for i in ll37 cec HBD PME PMB; do
        #echo "$i"
        if [ $(grep "$i" qstat.log | grep " r " | grep -c -v "OM") -eq 1 ]
        then
                let a=${a}+1
                #grep "$i" qstat.log | grep " r " | grep -v "OM"
        else
                echo "IM ${i} MISSING... "
                #grep "$i" qstat.log | grep " r " | grep -v "OM"
        fi
done
echo "${a}/6 IM jobs running..." 
