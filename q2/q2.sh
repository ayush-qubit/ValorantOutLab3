#input file that contains details about classmates
grep -oE 'http(s?)://www.cse.iitb.ac.in/~[a-z]+ ' $1 > url

sed -r 's/\t+/ /g' $1 \
| sed -r 's/http(s?):\/\/[^ )]+ //g' \
| sed -r 's/\(http(s?):\/\/[^\)]+\)/( )/g' \
| sed -r 's/ [^ ]+(\.com|\.in|\.org|\.net|\.co|\.us|\.edu|\.gov)\/[^ ]+ / /g' \
| sed -r 's/[^\(]+(\.com|\.in|\.org|\.net|\.co|\.us|\.edu|\.gov)\/[^\)]+/ /g' \
#output file that contain webpage links of our classmates.
| sed -r 's/ +/ /g' > $1


