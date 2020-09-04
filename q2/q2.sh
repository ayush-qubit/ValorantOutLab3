INFILE=$1
OUTFILE="url"
sed -i -e 's/https:/ https:/g' $INFILE
sed -i -e 's/http:/ http:/g' $INFILE
sed -r -i 's/\(/\(/g;s/\/\)/\/ \)/g' $INFILE
sed -i -e 's/   */ /g' $INFILE
sed -i -e 's/\t\t*/ /g' $INFILE
awk '{
	for(i=1;i<=NF;i++){
		if($i ~ /https:\/\/www.cse.iitb.ac.in\/~[a-z][a-z]*/ || $i ~ /http:\/\/www.cse.iitb.ac.in\/~[a-z][a-z]*/){
			print $i
		}
	}
}' $INFILE | sed 's/.*\(http[A-Za-z]*\)/\1/' > $OUTFILE
awk '{
	for(i=1;i<=NF;i++){
		if($i ~ /^https:\/\/.*/ || $i ~ /^http:\/\/.*/ || $i ~ /.*(.com|.in|.org|.net|.co|.us|.edu|.gov)\/.*/){
			printf("")
		}
		else{
			printf("%s ",$i)
		}
	}
}' $INFILE > output
cat output > $INFILE
rm output