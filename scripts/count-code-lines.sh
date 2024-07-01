#!/bin/bash

# Function: Count code lines submitted by yourself via Git
# Usage:
#  1. Put the script under all repositories parent directory.
#  2. Run it with `bash count-code-lines.sh "<author: use regular expression pattern>"`
#     e.g. bash count-code-lines.sh "sstian"

## input parameters
author=$1

if [ -z "${author}" ]; then
  echo "Error: Please input author name."
  echo "Format: bash count-code-lines.sh \"<author: use regular expression pattern>\""
  exit 1
fi

## ready go!
echo -e "Counting code lines ...\n"

start_time=`date +%s`

## define global varibales
added_line=0
removed_line=0
total_line=0

## get all directories
dirs=`ls -d */`

## reverse and superpose
number=0
for dir in ${dirs}
do
  # every direcory by number
  number=`expr ${number} + 1`
  echo "${number} The directory/repository is: ${dir}"

  cd ${dir}

  # core function: get code lines by git log & awk
  # git log --author=<patten: regular expression>
  output=`git log --author="${author}" --pretty=tformat: --numstat | awk '{ added += $1; removed += $2; total += $1 - $2} END { printf "added-lines: %s, removed-lines: %s, total-lines: %s", added, removed, total }'`

  # take count
  array=(${output//,/ })
  size=${#array[@]}
  if [ ${size} == 6 ]; then
    echo "  ${output}"
    added_line=`expr ${added_line} + ${array[1]}`
    removed_line=`expr ${removed_line} + ${array[3]}`
    total_line=`expr ${total_line} + ${array[5]}`
  fi
  echo -e ""

  cd ..
done

## sumary information
echo "Congratulation! Author: ${author}, contributed wonderful codes."
echo "Summary: added lines = ${added_line}, removed lines = ${removed_line}, total lines = ${total_line}"

end_time=`date +%s`
elapsed=`expr ${end_time} - ${start_time}`
echo -e "\nprocess complete. elapsed ${elapsed} seconds"
