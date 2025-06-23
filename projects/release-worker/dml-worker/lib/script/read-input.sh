#!/bin/bash

# to avoid unexecpted space, all add quote below

## trim input file
egrep -v "^#|^\s*$" "${global_input_file}" > "${global_temp_file}"

dos2unix "${global_temp_file}"

## create data dictonary
# IFS = Input Field Separator
# it is normaly any whitespace characters
while IFS= read -r line; do
  # split like / *= */
  IFS=" = " read -r key value <<< "${line}"
  global_inputs_arr["${key}"]="${value}"
done < "${global_temp_file}"

## convert arguments
git_branch=${global_inputs_arr["git_branch"]}
jiraids=`echo "${git_branch}" | LC_ALL=en_US.utf8 grep -P ${global_jira_pattern} -o`
read -r jiraid <<< "${jiraids}"
echo "extracted jiraid=${jiraid}"
global_inputs_arr["jiraid"]="${jiraid}"

## convert windows path to linux path
# e.g. C:\repos\test_dml -> /C/repos/test_dml
repo_path=${global_inputs_arr["repo_path"]}
temp=`echo "${repo_path}" | sed "s/[\]/\//g" | sed "s/[:]//"`
repo_path_target="/"${temp}
global_inputs_arr["repo_path_target"]="${repo_path_target}"

## convert region
# split like /, */
region_spec=${global_inputs_arr["region_spec"]}
region_spec_upper=`echo "${region_spec}" | tr '[:lower:]' '[:upper:]'`
echo "region_spec=${region_spec} -> ${region_spec_upper}"
global_inputs_arr["region_spec_upper"]="${region_spec_upper}"

IFS=", " read -r -a regions <<< "${region_spec_upper}"
global_inputs_arr["regions"]=${regions}

## convert release date
. lib/script/date-parser.sh

## print
echo -e "\n>> [global_inputs_arr]:"
for key in ${!global_inputs_arr[@]}; do
  echo "key:[${key}]--value:[${global_inputs_arr[${key}]}]"
done

regions=${global_inputs_arr["regions"]}
for region in "${regions[@]}"; do
  echo "region => ${region}"
done
echo "Press any key to continue ..." && read
