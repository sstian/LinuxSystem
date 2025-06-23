#!/bin/bash

## program info
global_program="dml-worker"
global_version="0.0.1"

## global variable
global_input_file=input.txt
global_output_dir=output
global_output_log=output.log
global_template_file=template.sql
global_jira_pattern="([A-Z][A-Z\d_])*-(\d+)"
# global_regions=(APAC EMEA NAM)
decallare -A global_regions_arr
global_regions_arr=([APAC]=hk [EMEA]=uk [NAM]=ny)

global_temp_file=.temp
decallare -A global_inputs_arr
# | key list | value type |
# | -------- | ---------- |
# | jiraid   | string     |
# | regions  | array      |

for region in ${!global_regions_arr[@]}; do
  echo "key = $region, value = ${global_regions_arr[$region]}"
done
