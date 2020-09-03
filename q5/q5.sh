INFILE=$1
OUTFILE="csv"
X=1
Y=0
Z=0
#TEMPFILE="temp"
touch $OUTFILE
#touch $TEMPFILE
#awk NF $INFILE
sed -i 's/ *//g' $INFILE
awk NF $INFILE | awk -v X="$X" 'BEGIN{printf("Name||Projects||Drive Video Link\n")}{
	if(X==1){
		for(i=1;i<NF;i++){
			printf("%s ",$i)
		}
		printf("%s||",$NF)
		X=0
	}
	else if($0 ~ /^https:/){
		printf("||%s\n",$0)
		X=1
	}
	else{
		printf("%s ",$0)
	}
}' > $OUTFILE
#sed -i 's/. "/."/g' $OUTFILE
sed -i 's/ ||/||/g' $OUTFILE