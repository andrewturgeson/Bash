#!/bin/bash
declare -a array
#array=("A" "B" "D" "E" "H" "L" "P" "Y")
array=("NP230687" "ecoli-fadl-only")
for X in "${array[@]}" ; do
    #for I in {1..6}; do
    #    sed -i "s/.*#\$ -N step6.${I}.*/#\$ -N step6.${I}_${X}/g" Bcharmm_${X}/namd/step6.${I}.qsub
    #done
    #x="${X,,}"
    #sed -i "s/plpe/p${x}pe/g" Bcharmm_${X}/namd/step5_charmm2namd.colvar.str
    #sed -i "s/plpg/p${x}pg/g" Bcharmm_${X}/namd/step5_charmm2namd.colvar.str 
    #sed -i "s/.*#\$ -N step7.*/#\$ -N step7_${X}/g" Bcharmm_${X}/namd/step7.qsub
    #sed -i "s/restartfreq             5000;  /restartfreq             500000;/g" Bcharmm_${X}/namd/step7_production.inp
    #sed -i "s/dcdfreq                 5000/dcdfreq                 500000/g" Bcharmm_${X}/namd/step7_production.inp
    #sed -i "s/numsteps                2500000/numsteps               100000000/g" Bcharmm_${X}/namd/step7_production.inp
    #sed -i "s/run                     2500000;             # 5 ns/run                    100000000;             # 200 ns/g" Bcharmm_${X}/namd/step7_production.inp

    #sed -i "s/restartfreq             500000;/restartfreq             5000;  /g" Bcharmm_${X}/namd/step7_production.inp
    #sed -i "s/dcdfreq                 500000;/dcdfreq                 5000;  /g" Bcharmm_${X}/namd/step7_production.inp


    for I in {9..13}; do
        let prev=$I-1
        cp ${X}/namd/step7_production.inp ${X}/namd/step${I}_production.inp
        sed -i "s/step7_production/step${I}_production/g" ${X}/namd/step${I}_production.inp
        sed -i "s/step6.6_equilibration/step${prev}_production/g" ${X}/namd/step${I}_production.inp
        sed -i "s/\$inputname/\$inputname.restart/g" ${X}/namd/step${I}_production.inp

        cp ${X}/namd/step7.qsub ${X}/namd/step${I}.qsub
        sed -i "s/step7/step${I}/g" ${X}/namd/step${I}.qsub
        sed -i "s/TOTALNTHREADS=27/TOTALNTHREADS=54/g" ${X}/namd/step${I}.qsub
        sed -i "s/-pe namd 1/-pe namd 2/g" ${X}/namd/step${I}.qsub
    done
done
