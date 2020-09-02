INFILE=$1
X=0
Y=0
OUTFILE=$(echo "$INFILE" | sed 's/inp/out/g')
touch $OUTFILE
sed 's/!/\n/g' $INFILE | awk -F '-' -v X="$X" -v Y="$Y" '{
	if($1=="U"){
		Y=Y+$2
	}
else if($1=="D"){
	Y=Y-$2
}
else if($1=="L"){
	X=X-$2
}
else{
	X=X+$2
}
printf("%c\t(%d,%d)\n",$1,X,Y)
} END{printf("Final Position: (%d,%d)\n",X,Y)}' > $OUTFILE