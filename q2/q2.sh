grep -oE 'http(s?)://www.cse.iitb.ac.in/~[a-z]+ ' $1 > url

#sed -r 's/\t+/ /g; s/ +/ /g' input1 | grep -E 'http(s?)://[^ ]+ '

sed -r 's/\t+/ /g' $1 \
| sed -r 's/http(s?):\/\/[^ )]+ //g' \
| sed -r 's/\(http(s?):\/\/[^\)]+\)/( )/g' \
| sed -r 's/ [^ ]+(\.com|\.in|\.org|\.net|\.co|\.us|\.edu|\.gov)\/[^ ]+ / /g' \
| sed -r 's/[^\(]+(\.com|\.in|\.org|\.net|\.co|\.us|\.edu|\.gov)\/[^\)]+/ /g' \
| sed -r 's/ +/ /g' > $1


#sed -r 's/\t+/ /g' input1 \
#| sed -r 's/http(s?):\/\/[^ )]+ //g' \
#| sed -r 's/ [^ ]+(\.net|\.in)\/[^ ]+ / /g' \
#| sed -r '[^\(]+(\.com|\.in|\.org|\.net|\.co|\.us|\.edu|\.gov)/[^\)]+'

#sed -ri 's/\t+/ /g; s/ +/ /g; s/http(s?):\/\/[^ ]+ //g' $1