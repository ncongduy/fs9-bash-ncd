#!/bin/bash

# Declare variable
total_args=$#
current_dir=$(pwd)
src="$current_dir/src"

# Check arguments
[[ $total_args -le 0 ]] && echo "You should provide at least 1 argument." && exit 1

# Count component
function count_component() {
  grep -R "<$1" $src | wc -l
}

# Print arguments
while [ $# -gt 0 ]; do
  number_of_times=($(count_component $1))
  echo "$1 - $number_of_times"
  shift
done