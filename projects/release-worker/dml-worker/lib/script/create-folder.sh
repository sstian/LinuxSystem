#!/bin/bash

echo -e "\n>> executing commmand: .create-folder.sh"

## define variable, input parameter
stream=${global_inputs_arr["stream"]}

## define function
function verify_folder() {
  the_folder=$1
  if [ -d "${the_folder}" ]; then
    echo "folder ${the_folder} exists, removing and re-creating..."
    rm -r ${the_folder}
  fi
  mkdir -p ${the_folder}
  echo "${the_folder} folder created."
}

function get_quarter() {
  my_date=$1
  month=${my_date:4:2}
  case ${month} in
    01|02|03 echo "Q1" ;;
    04|05|06 echo "Q2" ;;
    07|08|09 echo "Q3" ;;
    10|11|12 echo "Q4" ;;
    *) echo "00" ;;
  esac
}

function create_folder() {
  vefiry_folder ${global_output_dir}

  echo -e "\nstart to work for sql file..."
create_folder
  quarter=$(get_quarter ${release_date})
  echo "year = ${year}, quarter = ${quarter}"

  for region in "${regions[@]}"; do
    # ...
    mkdir -p ${subfolder}
    cp ${global_template_file} ${subfolder}/${user_filename}.sql
  done

  cmd //c "tree ${global_output_dir} /F /A"
}

if [ "${jiraid}" = "" ]; then
  echo "JIRA is none"
  echo "Press any key to exit..."
  read && exit
fi

create_folder
