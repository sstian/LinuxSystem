#!/bin/bash

## Author: Tian Jihui
## SOEID:JT4686
## Email: jt44686@citi.com
## Time: 2022-09-22 14:45 UTC+8
## Function: batch dml worker for sql file
## Usage: . dml-worker.sh JT44686 C150494E-1781 20220923
## Example: 
## out/
##   CHG_LIVE_EMEA_20220923/
##     JT44686_C150494E-1781_EMEA.checkout.sql
##     JT44686_C150494E-1781_EMEA.sql
##   CHG_LIVE_EMEA_BAK_20220923/
##     JT44686_C150494E-1781_EMEA.rollback.checkout.sql
##     JT44686_C150494E-1781_EMEA.rollback.sql


## difine variable 
soeid=$1
jiraid=$2
release_date=$3

out_dir=out
template_file=template.sql
regions=(APAC EMEA NAM)

echo -e "*** welcome to use batch dml worker for sql file *** \n"
if [ -d ${out_dir} ]; then
	echo "${out_dir} folder exists, removing and re-creating..."
	rm -r ${out_dir}
fi
mkdir ${out_dir}
echo "${out_dir} folder created."


echo -e "\nstart to work for sql file..."
for region in ${regions[*]}
do
	echo -e "--------------------------------------------------"
	echo ${region}
	echo -e "--------------------------------------------------"

	user_filename=${soeid}_${jiraid}_${region}
	
	subfolder=${out_dir}/CHG_LIVE_${region}_${release_date}
	mkdir ${subfolder}
	cp ${template_file} ${subfolder}/${user_filename}.sql
	cp ${template_file} ${subfolder}/${user_filename}.checkout.sql
	
	echo "+ subfolder: "${subfolder}
	ls -1 ${subfolder}
	
	bakfolder=${out_dir}/CHG_LIVE_${region}_BAK_${release_date}
	mkdir ${bakfolder}
	cp ${template_file} ${bakfolder}/${user_filename}.rollback.sql
	cp ${template_file} ${bakfolder}/${user_filename}.rollback.checkout.sql
	
	echo -e "\n+ bakfolder: "${bakfolder}
	ls -1 ${bakfolder}

done

echo -e "--------------------------------------------------\n"
echo -e "process completely. Happy enjoy!"
