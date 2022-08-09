#!/bin/bash
#this uses a file check to determine how far to catdcd PMB dcd files
#use chmod u+x filename to compile
#use ./filename to run

declare -a array
array=("A" "B" "D" "E" "H" "L" "P" "Y")
declare -a catdcd_term


for X in "${array[@]}"; do

        cd ~/md/PMB_${X}/

        for i in {1..3}; do
                catdcd_term=("" "" "" "" "")
                for j in {1..4}; do
                        if [ -f "PMB_$i.$j.dcd" ]; then
                                echo "$X $i $j"
                                catdcd_term[${j}]=PMB_${i}.${j}.dcd
                        else
                                catdcd_term[${j}]=nothere
                                echo test -f "PMB_${X}/PMB_${i}.${j}.dcd" ;
                        fi
                done
#                               catdcd_term[${j}]=PMB_${i}.${j}.dcd
#~/catdcd/LINUX/bin/catdcd4.0/catdcd -stride 10 -o ~/md/PMB_dcd/${X}_${i}_full.dcd ${catdcd_term[1]}  ${catdcd_term[2]} ${catdcd_term[3]} ${catdcd_term[4]}
        done
done
