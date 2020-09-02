INFILE=$1
X=0
Y=0
OUTFILE=$(echo "$INFILE" | sed 's/inp/out/g')
touch $OUTFILE
echo "" > $OUTFILE
compute(){
	if [[ $1 == "U" ]]; then
		Y=$((Y+$2))
	elif [[ $1 == "D" ]]; then
		Y=$((Y-$2))
	elif [[ $1 == "L" ]]; then
		X=$((X-$2))
	elif [[ $1 == "R" ]]; then
		X=$((X+$2))
	fi
}

for line in $(sed 's/!/\n/g' $INFILE)
do
	IFS='-' read -a arr <<< "$line"
	compute ${arr[0]} ${arr[1]}
	printf "%c\t(%d,%d)\n" "${arr[0]}" "$X" "$Y" >> $OUTFILE
done
printf "Final Position: (%d,%d)\n" "$X" "$Y" >> $OUTFILE