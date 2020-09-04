#grep '[[:alpha:]]\+-[[:digit:]]\{3\}-[[:digit:]]\{8\} \|$' input3
#grep -o ' \?[[:alpha:]]\+-[[:digit:]]\{3\}-[[:digit:]]\{8\}' input3
#sed -n -r 's/.*(( |^)[[:alpha:]]+-[[:digit:]]{3}-[[:digit:]]{8}( |$)).*/\1/p' input3

grep -oE '( |^)[[:alpha:]]+-[[:digit:]]{3}-[[:digit:]]{8}( |$)' $1 \
| sed '/-00000000/d; s/-/ /' > temp1


sed -r '1d; s/ *\t+ */-/g; s/ +/_/g' STD_Codes_list > temp2

#cat temp2
#echo -e "\n======="
#cat temp1
#echo "======="

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
#cat temp3
#cat temp1
#echo "==========="
#cat temp2
rm temp1 temp2