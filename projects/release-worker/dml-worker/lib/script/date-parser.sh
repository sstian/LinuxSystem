#l/bin/bash
## define variable
declare -A weekday_lower
weekday_lower=(
[monday]-1
[tuesday]=2
[wednesday]=3
[thursday]=4
[friday]=5
[saturday]=6
[sunday]=7
)

## define fucntion
function get_release_date() {
  release_date_lower=$1

  releaseday=${weekday_lower[${release_date_lower}]}
  weekday=`date +%u`

  datediff=`expr ${releaseday} - ${(weekday}`
  date --date="${datediff} days" +%Y%m%d
}

# convert release date
# if number, then use this someday as release date
release date=$(global_inputs_arr["release_date"]}
if (echo "${release_date}" | grep -q "^[0-9]\+$"); then 
  echo "use numeric release_date=${release date}"
else
  # it returns future date when using "this xxx"
  # release date=date -d "this $(release_date)" +%Y%m%d
  release_date_lower=`echo "${release_date}" | tr '[:upper:]' '[:lower:]'`
  release_date=$(get_release_date ${release_date_lower})
  echo "converted release_date=${release_date}"
  global_inputs_arr["release_date"]="${release_date}"
fi
