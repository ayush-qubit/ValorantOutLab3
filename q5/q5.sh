INFILE=$1
OUTFILE="csv"
#TEMPFILE="temp"
touch $OUTFILE
#touch $TEMPFILE
#awk NF $INFILE
awk NF $INFILE | awk 'BEGIN{printf("Name||Projects||Drive Video Link\n")}{
	if(NF<=2){
		if($0 ~ /https:/){
			printf("||%s\n",$0)
		}
	else if($0 ~ /None/ || $0 ~ /No/ || $0 ~ /NA/){
			printf("%s",$0)
		}
		else if($1 ~ /^[A-Z][A-Za-z]*/ && $2 ~ /[A-Za-z]*/ && $3 ~ /[A-Za-z]*/){
			printf("%s||",$0)
		}
		else{
			printf("%s",$0)
		}
	}
	else if(NF==3){
		if($0 ~ /[A-Z][A-Za-z]* [A-Z][A-Za-z]* [A-Za-z][A-Za-z]*/){
			printf("%s||",$0)
		}
		else{
			printf("%s",$0);
		}
	} 
	else{
		printf("%s",$0)
	}
}' > $OUTFILE
#sed -i 's/. "/."/g' $OUTFILE
sed -i 's/ ||/||/g' $OUTFILE