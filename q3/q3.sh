#grep '[[:alpha:]]\+-[[:digit:]]\{3\}-[[:digit:]]\{8\} \|$' input3
#grep -o ' \?[[:alpha:]]\+-[[:digit:]]\{3\}-[[:digit:]]\{8\}' input3
#sed -n -r 's/.*(( |^)[[:alpha:]]+-[[:digit:]]{3}-[[:digit:]]{8}( |$)).*/\1/p' input3
grep -oE ' ?[[:alpha:]]+-[[:digit:]]{3}-[[:digit:]]{8} ?' $1