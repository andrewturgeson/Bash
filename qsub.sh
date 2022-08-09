#!/bin/bash
for X in A B D E H L P Y; do
    cd ${X}
    qsub s0.qsub > temp.txt
    echo "qsub s0.qsub > temp.txt"
    for I in {1..3}; do
        while IFS= read -r line
        do
            echo "$line"
            echo "qsub -hold_jid ${line:9:5} s${I}.qsub" 
            qsub -hold_jid ${line:9:5} s${I}.qsub > temp.txt

        done < temp.txt
       sleep 10s
    done

    sleep 30s
    rm temp.txt
    cd ../
done

watch -n 1 qstat
