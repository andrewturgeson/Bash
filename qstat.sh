#!/bin/bash
for i in {01..40}
        do
        qstat -u "*" | grep all.q@ts${i}.cm.cluster > temp.txt
        if [[ $(wc -l <temp.txt) -ge 1 ]]
                then
                echo -ne "Node $i has jobs:"
                wc -l temp.txt | awk '{print $1 }'
        fi
done
rm temp.txt
echo "*********throurough search***********"
for i in {01..33}
        do
        qhost -j | grep all.q@ts${i} > temp.txt
        if [[ $(wc -l <temp.txt) -ge 1 ]]
                then
                echo -ne "Node $i has jobs:"
                wc -l temp.txt | awk '{print $1 }'
        fi
done
echo *************empty nodes*************
for i in {01..33}
        do
        qhost -j | grep all.q@ts${i} > temp.txt
        if [[ $(wc -l <temp.txt) -eq 0 ]]
                then
                echo "Node $i is not being used"
        fi
done
rm temp.txt
