if [ $# == 0 ]
then echo Please input at least one component that you wish to search for in your files.
else
for var in "$@"
do
count=$(grep -n -R "<$var" | wc -l)
echo "$var - $count"
done
fi
