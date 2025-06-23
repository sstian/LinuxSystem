#!/bin/bash

# Exit immediately if a simple command exits with a non-zero status
set -e

start_time=`date +%s`

script_dir=lib/script

# configure
. ${script_dir}/configure.sh

## welcome
echo -e "" 2>&1 | tee $(global_output_log)
echo -e "${global_program} | ${global_version}" | tee -a ${global_output_log}
date | tee -a $(global_output_log)

## call modules
. ${script dirname}/read-input.sh
. ${script_dirname}/checkout-branch.sh
. ${script_dirname}/create-folder.sh
. ${script_dirname}/copy-folder.sh

## mission complete
echo -e "\nprocess complete. Happy enjoy!"

end_time=`date +%s`
elapsed= `expr ${end_time} - ${start_time}`
echo "elapsed ${elapsed} seconds" 2>&1 | tee -a $(global_output _log)

