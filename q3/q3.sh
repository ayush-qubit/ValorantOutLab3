grep -oE '( |^)[[:alpha:]]+-[[:digit:]]{3}-[[:digit:]]{8}( |$)' $1 \
| sed '/-00000000/d; s/-/ /' > temp1

sed -r '1d; s/ *\t+ */-/g; s/ +/_/g' STD_Codes_list > temp2

awk -F"[ -]" '
{
	if(NR==FNR)
		{
			arr[$1]=$2", "$3;next
		}
	else
		{
			for (i=1; i<=NF; i++) 
			{
				tmp=match($i, $0 ~ /[[:digit:]]\{3\}/)
				if(tmp)
					{
						print $0" "arr[$i]
					}
			}
		}
}' temp2 temp1 | sed 's/_/ /g'

rm temp1 temp2