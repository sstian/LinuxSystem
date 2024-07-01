#!/bin/bash
echo "hello bash"

# == command, run in current shell ==
pwd

echo $0 $1 $2
# == file, run in current shell ==
# . hello.sh apple banana || source hello.sh apple banana
# => /usr/bin/bash apple banana

# == command, run in new shell ==
# bash -c "ls -al"

# == file, run in new shell ==
# return to current shell
# ./hello.sh apple banana
# => ./hello.sh apple banana
# bash hello.sh apple banana
# => hello.sh apple banana


