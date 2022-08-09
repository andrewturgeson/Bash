#!/bin/bash

#for k in NP233248 NP230688 NP230687 ecoli
for k in A D L P
        do
        cd ${k}
        let j=0; while [ -f results/${k}.${j}.dcd ]; do let j=$j+1; done

        name="s${j}.qsub"

        let count=0;
        for i in {01..33}
                do
                qhost -j | grep all.q@ts${i} > temp.txt
                #echo "$i"

                if [ ${i} == 01  -o ${i} == 12 -o ${i} == 13 -o ${i} == 23  -o  ${i} == 26  -o  ${i} == 29  -o  ${i} == 31  -o  ${i} == 33 ]
                then
                        #echo "$i = bad"
                        p=$i
                else
                #       qhost -j | grep all.q@ts${i} > temp.txt
                        if [[ $(wc -l <temp.txt) -eq 0 ]]
                                then
                                let count=$count+1
                                if [[ $count -eq 1 ]]
                                        then
                                        echo "Node ${i} is not being used:"
                                        echo "qsub -l h=ts${i}.cm.cluster $name"
                                        qsub -l h=ts${i}.cm.cluster $name
                                        #qsub $name     
                                fi
                        fi
                fi
        done
        rm temp.txt
        cd ../
        echo "available nodes: $count"
        sleep 20s
done

watch qstat
