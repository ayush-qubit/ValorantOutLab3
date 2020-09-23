grep -oE 'http(s?)://www.cse.iitb.ac.in/~[a-z]+ ' $1 > url

sed -i -r 's/\t+/ /g' $1
sed -i -r 's/http(s?):\/\/[^ )]+ //g' $1
sed -i -r 's/\(http(s?):\/\/[^\)]+\)/( )/g' $1
sed -i -r 's/ [^ ]+(\.com|\.in|\.org|\.net|\.co|\.us|\.edu|\.gov)\/[^ ]+ / /g' $1
sed -i -r 's/[^\(]+(\.com|\.in|\.org|\.net|\.co|\.us|\.edu|\.gov)\/[^\)]+/ /g' $1
sed -i -r 's/ +/ /g' $1