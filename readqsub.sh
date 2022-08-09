Z=("WRITING VELOCITIES TO OUTPUT FILE AT STEP 5000" "_ZN9HomePatch14positionsReadyEi+0xef8" "WRITING VELOCITIES TO OUTPUT FILE AT STEP 2505000" "WRITING VELOCITIES TO OUTPUT FILE AT STEP 10005000")
for A in A D L P ; do
        holder=1
        echo $A
        for i in {0..3}; do
                if tail -n 6 ${A}/s${i}.log | grep -q "${Z[$i]}"; then
                        echo found $i
                else
                        #echo not found $i
                        j=$i
                        if [[ $holder -eq 1 ]] ;  then
                                cd ${A}
                                qsub s${j}.qsub > temp.txt
                                echo "qsub s${j}.qsub"
                                sleep 20s
                                let j=$j+1
                                while [ $j -le 3 ] ; do
                                        while IFS= read -r line; do
                                                echo "$line"
                                                qsub -hold_jid ${line:9:5} s${j}.qsub > temp.txt
                                                echo "qsub -hold_jid ${line:9:5} s${j}.qsub > temp.txt"                 
                                        done < temp.txt

                                        let j=$j+1
                                        holder=0
                                done
                                rm temp.txt
                                cd ../
                        fi
                fi
        done
done
