#this uses a file check to determine how far to catdcd PMB dcd files
#use chmod u+x filename to compile
#use ./filename to run
dir=$( pwd )
for X in A B D E H L P Y
  do 
  cd ${dir}/${X}/results
  catdcd_term=("" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "") 
  for j in {3..4}; do
    let k=$j
    if [ -f "${X}.${k}.dcd" ]; then
      catdcd_term[${j}]=${X}.${k}.dcd
    else
      catdcd_term[${j}]=" "
      #echo "step${k}_production.dcd not there" ;
    fi
  done

  #catdcd_term[${j}]=step${k}_production.dcd
~/catdcd/LINUX/bin/catdcd4.0/catdcd -o ../../dcd/${X}.dcd ${catdcd_term[1]} ${catdcd_term[2]} ${catdcd_term[3]} ${catdcd_term[4]} ${catdcd_term[5]} ${catdcd_term[6]} ${catdcd_term[7]} ${catdcd_term[8]} ${catdcd_term[9]} ${catdcd_term[10]} ${catdcd_term[11]} ${catdcd_term[12]} ${catdcd_term[13]} ${catdcd_term[14]} ${catdcd_term[15]} ${catdcd_term[16]} ${catdcd_term[17]} ${catdcd_term[18]}
  #cp ../${X}.psf ../../dcd/${X}.psf
  #cp ../s3.log ../../dcd/${X}3.log
  #cp ../s4.log ../../dcd/${X}4.log

done
