#!/bin/bash

# Check arguments
total_args=$#

[[ $total_args -le 0 ]] && echo "Please enter one or several names of components." && \
  echo "Example 1: ./component-count.sh Button" && \
  echo "Example 2: ./component-count.sh Button Header Footer" && \
  exit 1

# User input a path to React directory
echo "Please enter a path to React directory."
echo "For example: /home/frontend_project/country_app/src"
read -p "Please enter a path here: " usr_path

# Check user path exists
while [[ ! -d $usr_path ]]; do
  echo
  echo "Directory ${usr_path} doese not exist."
  echo "Please enter a path React directory again or press 'q' to exit."
  read -p "Please enter a path here: " usr_path

  [[ $usr_path == "q" || $usr_path == "Q"  ]] && exit 1
done

echo "Component count is below:"
src=$usr_path

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